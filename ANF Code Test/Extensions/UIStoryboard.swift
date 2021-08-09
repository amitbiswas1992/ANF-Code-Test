//
//  UIStoryboard.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        case main = "Main"
    }
    
    //MARK: - Convenience Initializers
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
        
    }
}
