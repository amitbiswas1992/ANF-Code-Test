//
//  ANFExploreCardViewModelTests.swift
//  ANF Code TestTests
//
//  Created by Amit Biswas on 8/9/21.
//

import XCTest
@testable import ANF_Code_Test

class ANFExploreCardViewModelTests: XCTestCase {

    
    var viewModel: ANFExploreCardViewModel!
    
    override func setUp() {
        let data = productsListingStub.data(using: .utf8)!
        do {
            
            let productsList = try JSONDecoder().decode([Product].self, from: data)
            self.viewModel = ANFExploreCardViewModel(products: productsList)
            self.viewModel.viewDidLoad()
            
        } catch let jsonErr {
            print("Error serializing json:", jsonErr)
        }
    }

    func testNumberOfRowsShouldBeTen() {
        XCTAssert(viewModel.rows == 1, "table view should have 10 cells")
    }

    func testFirstProductItemTitleShouldNotBeNil() {
        let firstCellViewModel = viewModel.cellViewModel(for: 0)
        let title = firstCellViewModel.productTitle
        XCTAssert(title.count > 0, "title should not be blank")
    }

    func testFirstProductItemImageShouldNotBeNil() {
        let firstCellViewModel = viewModel.cellViewModel(for: 0)
        let imageURL = firstCellViewModel.bgImageUrl
        XCTAssert(!imageURL.absoluteString.isEmpty, "image is not nil")
    }

}
