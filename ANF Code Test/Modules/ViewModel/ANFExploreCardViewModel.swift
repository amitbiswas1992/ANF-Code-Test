//
//  ANFExploreCardViewModel.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation

typealias ANFExploreCardViewModelOutput = (ANFExploreCardViewModel.Output) -> ()

class ANFExploreCardViewModel {

    private var cellViewModels = [ExploreContentCellViewModel]()
        
    private var products: [Product] {
        didSet {
            initializeCellViewModels()
            completionHandler?(.reloadData)
        }
    }
    
    var completionHandler: ANFExploreCardViewModelOutput?
    
    //MARK: - Initializer
    init(products: [Product]) {
        self.products = products
        self.initializeCellViewModels()
    }
    
    func viewDidLoad() {
        self.fetchAllProducts()
    }
    
    enum Output {
        case reloadData
        case showError(message: String)
    }
}

//MARK: - Api Call
extension ANFExploreCardViewModel {
    
    func fetchAllProducts() {
       
        NetworkingManager.shared.fetchAllProducts { result in
            switch result {
            case .success(let products):
                self.products.removeAll()
                self.products = products
                self.completionHandler?(.reloadData)
                
            case .failure(let error):
                self.completionHandler?(.showError(message: error.rawValue))
            }
        }
    }
    
}


//MARK: - Helper Methods
extension ANFExploreCardViewModel {
    
    private func initializeCellViewModels() {
        cellViewModels = []

        for (index, product) in self.products.enumerated() {
            
            if let imageUrl = URL(string: product.backgroundImage) {
            
                var menContent: Content?
                var womenContent: Content?
                for content in product.content ?? [] {
                    if menContent == nil {
                        menContent = content
                    } else if womenContent == nil {
                        womenContent = content
                    }
                
                }
                
                let productCellVM = ExploreContentCellViewModel(
                    cellIndex: index,
                    bgImageUrl: imageUrl,
                    topDescription: product.topDescription ?? "",
                    productTitle: product.title,
                    promoMessage: product.promoMessage ?? "",
                    bottomDescription: product.bottomDescription ?? "",
                    menButtonContent: menContent,
                    womenButtonContent: womenContent)
                
                self.cellViewModels.append(productCellVM)
            }
        }
    }
    
    var rows: Int {
        return cellViewModels.count
    }
    
    func cellViewModel(for row: Int) -> ExploreContentCellViewModel {
        return cellViewModels[row]
    }
    
}

