//
//  DataFactory.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation
import UIKit

class DataFactory {
    
    static func getANFExploreCardTableVC(identifier: String) -> ANFExploreCardTableViewController? {
        let mainStoryboard = UIStoryboard(storyboard: .main)
        if let moviesListViewController = mainStoryboard.instantiateViewController(withIdentifier: identifier) as? ANFExploreCardTableViewController {
            
            moviesListViewController.viewModel = ANFExploreCardViewModel(products: [])
            return moviesListViewController
        }
        
        return nil
    }
        
}
