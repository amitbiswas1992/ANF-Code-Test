//
//  ExploreContentCell.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import UIKit

class ExploreContentCell: UITableViewCell {

    private var cachedImages = [Int: UIImage]()
    var viewModel: ExploreContentCellViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var topDescriptionLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var promoMessageLabel: UILabel!
    @IBOutlet weak var promoDescriptionLabel: UILabel!
    @IBOutlet weak var shopMenView: UIView! {
        didSet {
            shopMenView.layer.borderWidth = 1
            shopMenView.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.5, alpha: 1).cgColor
            
        }
    }
    
    @IBOutlet weak var shopWomenView: UIView! {
        didSet {
            shopWomenView.layer.borderWidth = 1
            shopWomenView.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.5, alpha: 1).cgColor
        }
    }
    
    @IBOutlet weak var shopMenButton: UIButton!
    @IBOutlet weak var shopWomenButton: UIButton!
    

    //MARK: - Override Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.backgroundImage.image = nil
        
    }
        
    
    //MARK: - Actions
    @IBAction
    func shopMenButton(_ sender: UIButton) {
        if let stringUrl = viewModel?.menButtonContent?.target, let url = URL(string: stringUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction
    func shopWomenButton(_ sender: UIButton) {
        if let stringUrl = viewModel?.menButtonContent?.target, let url = URL(string: stringUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //MARK: - Public Methods
    func configure(viewModel: ExploreContentCellViewModel) {
        self.viewModel = viewModel
        guard let viewModel = self.viewModel else {
            return
        }
        
        topDescriptionLabel.text = viewModel.topDescription
        productTitleLabel.text = viewModel.productTitle
        promoMessageLabel.text = viewModel.promoMessage
        promoDescriptionLabel.attributedText = viewModel.bottomDescription.toHtmlAttributedString()
        promoDescriptionLabel.textAlignment = .center
        shopMenView.isHidden = viewModel.menButtonContent == nil
        shopWomenView.isHidden = viewModel.womenButtonContent == nil
        
        shopMenButton.setTitle(viewModel.menButtonContent?.title, for: .normal)
        shopWomenButton.setTitle(viewModel.womenButtonContent?.title, for: .normal)
        
        self.loadImage()
        
    }
    
    //MARK: - Private Methods
    private func loadImage() {
        OperationQueue().addOperation {
            
            if let viewModel = self.viewModel {
                if let image = self.cachedImages[viewModel.cellIndex] {
                    self.loadImageFromCache(image: image)
                    
                } else {
                    self.backgroundImage.downloadImage(from: viewModel.bgImageUrl) { image in
                        DispatchQueue.main.async {
                            print(image.size.height)
                            self.backgroundImage.image = image
                            self.cachedImages[viewModel.cellIndex] = self.backgroundImage.image
                        }
                    }
                    
                }
            }
        }
    }
    
    private func loadImageFromCache(image: UIImage?) {
        DispatchQueue.main.async {
            self.backgroundImage.image = image
        }
    }

}

   
