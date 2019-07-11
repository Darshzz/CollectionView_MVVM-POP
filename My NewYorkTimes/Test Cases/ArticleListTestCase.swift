//
//  ArticleListTestCase.swift
//  My NewYorkTimes
//
//  Created by Darshan on 11/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import XCTest
@testable import My_NewYorkTimes

class ArticleListTestCase: XCTestCase {

    var articleVM: ArticleModelProtocol!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        articleVM.dataModel = [DummyArticles(snippet: "California has become the first state to offer taxpayer-funded health benefits to young adults living in the country illegally.", headline: "California OKs Benefits to Immigrants in Country Illegally", imgUrl: nil),
        DummyArticles(snippet: "In a women singles tournament full of surprises, Strycova semifinal run may be the most stunning.", headline: "For Barbora Strycova, Wimbledon Rewards Impatience at Last", imgUrl: "images/2019/07/09/sports/09tennisside1/09tennisside1-verticalTwoByThree735.jpg"),
        DummyArticles(snippet: "California has become the first state to offer taxpayer-funded health benefits to young adults living in the country illegally.", headline: "California OKs Benefits to Immigrants in Country Illegally", imgUrl: "")]
    }

    func testMockData() {
        XCTAssertEqual(articleVM.dataModel[0].snippet, "California has become the first state to offer taxpayer-funded health benefits to young adults living in the country illegally.")
        XCTAssertEqual(articleVM.dataModel[1].headline, "For Barbora Strycova, Wimbledon Rewards Impatience at Last")
        XCTAssertEqual(articleVM.dataModel[0].imgUrl, nil)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        articleVM = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


struct DummyArticles: ArticleDataModelProtocol {
    var snippet: String!
    
    var headline: String!
    
    var imgUrl: String!
    
    
}
