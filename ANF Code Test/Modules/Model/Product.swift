//
//  Product.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation

struct Product: Codable {
    
    let title: String
    let backgroundImage: String
    let content: [Content]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
}

struct Content: Codable {
    let target: String
    let title: String
}
