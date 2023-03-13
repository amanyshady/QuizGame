//
//  NetworkManagerTests.swift
//  QuizGameTests
//
//  Created by Amany Shady on 27/02/2023.
//

import XCTest
@testable import QuizGame

final class NetworkManagerTests: XCTestCase {

    var sut : NetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
    }

    
  func testFetchData() {
        
      // we have to set expectation as it will wait for the synchronous operation
      
      let expect = XCTestExpectation(description: "fetch all quiz question")
      var responseError : ApiError?
      var responseQuiz : [QuestionItem]?
      
      sut.fetchData { quizeList, error in
          
          responseError = error
          responseQuiz = quizeList
          expect.fulfill()
          
          XCTAssertNil(responseError)
          XCTAssertNotNil(responseQuiz)
          
          XCTAssertEqual(responseQuiz?.count, 5)
          
        
      }
      
      wait(for: [expect], timeout: 3)
      
      
     
      
      
    }
   

}
