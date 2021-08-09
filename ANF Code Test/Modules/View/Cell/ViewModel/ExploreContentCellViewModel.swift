//
//  ExploreContentCellViewModel.swift
//  ANF Code Test
//
//  Created by Amit Biswas on 8/9/21.
//

import Foundation

struct ExploreContentCellViewModel {
    
    let cellIndex: Int
    let bgImageUrl: URL
    let topDescription: String
    let productTitle: String
    let promoMessage: String
    let bottomDescription: String
    let menButtonContent: Content?
    let womenButtonContent: Content?
    
    init(cellIndex: Int, bgImageUrl: URL, topDescription: String, productTitle: String, promoMessage: String, bottomDescription: String, menButtonContent: Content?, womenButtonContent: Content?) {
        self.cellIndex = cellIndex
        self.bgImageUrl = bgImageUrl
        self.topDescription = topDescription
        self.productTitle = productTitle
        self.promoMessage = promoMessage
        self.bottomDescription = bottomDescription
        self.menButtonContent = menButtonContent
        self.womenButtonContent = womenButtonContent
    }
    
}

