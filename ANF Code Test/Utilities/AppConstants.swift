//
//  AppConstants.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import UIKit

struct AppConstants {
    
    //MARK: - Server End Points
    struct Endpoint {
        static let FETCH_PRODUCTS = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
    }
    
    //MARK: - Helper Methods
    static func showAlert(withTitle title: String, Message message: String, controller: UIViewController) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: title, style: .default))
        controller.present(ac, animated: true)
    }
}
