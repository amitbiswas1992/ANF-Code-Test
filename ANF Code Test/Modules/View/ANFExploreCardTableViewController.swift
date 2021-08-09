//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {

    private let navBarTitle = "A & F"
    private let cellIdentifier = "exploreContentCell"
    private let articleListingNibName = "TopArticleListingCell"

    
    //MARK: - View Model
    var viewModel: ANFExploreCardViewModel?


    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = UIScreen.main.bounds.height
        self.title = navBarTitle
        self.viewModelBinding()
        self.viewModel?.viewDidLoad()
    }
            
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.rows ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExploreContentCell,
            let viewModel = self.viewModel?.cellViewModel(for: indexPath.row) else {
            
            return UITableViewCell()
        }
        
        cell.configure(viewModel: viewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

//MARK: - View Model Binding
extension ANFExploreCardTableViewController {
    
    private func viewModelBinding() {
        
        self.viewModel?.completionHandler = { output in
            switch output {
            case .reloadData:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            
            case .showError(let message):
                DispatchQueue.main.async {
                    AppConstants.showAlert(withTitle: "Error", Message: message, controller: self)
                }
                break
                
            }
        }
    }
    
}
