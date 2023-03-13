//
//  StartVMTests.swift
//  QuizGameTests
//
//  Created by Amany Shady on 27/02/2023.
//

import XCTest
@testable import QuizGame

final class StartVMTests: XCTestCase {
    
    var sut : StartVM!
    var networkManagerMock : NetworkManagerMock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        networkManagerMock = NetworkManagerMock()
        sut = StartVM(networkManager: networkManagerMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        networkManagerMock = nil
    }
    
    
    func testFetchQuizQuest() {
        
        // when
        sut.fetchQuizQuest()
        
        //then assert
        XCTAssert(networkManagerMock.callquizApi)
        
    }
    
    
   func testFetchError() {
       
       var error = ApiError.noData
       //when
       sut.fetchQuizQuest()
       networkManagerMock.fetchError(error: error)
       
       //then
       // will asert view controller will show alert message depend on network fill
        
    }

    
//    func testCreateQuizCellModel () {
//
//
//        var question : String?
//        var correctAnswer : String?
//        var incorrectAnswers : [String]?
//
//        let questionItemList = [QuestionItem(question: "amy",correctAnswer: "true"]
//    }
//

}
