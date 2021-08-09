//
//  UIImage.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import UIKit

extension UIImageView {
    
    func downloadImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, completion: @escaping (_ image: UIImage) -> Void) {
        NetworkingManager.shared.downloadImageData(from: url) { data in
            guard let imageData = data, let image = UIImage(data: imageData) else {
                return
            }
            
            completion(image)
        }
    }
}


