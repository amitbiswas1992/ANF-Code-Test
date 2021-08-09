//
//  AppCoordinator.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let navigationController: UINavigationController
    
    //MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
}

//MARK: Helper Methods
extension AppCoordinator {
    
    func start() {
        if let moviesListingController = DataFactory.getANFExploreCardTableVC(identifier: "ANFExploreCardTableViewController") {
            self.navigationController.pushViewController(moviesListingController, animated: true)
        }
        
    }
    
}

