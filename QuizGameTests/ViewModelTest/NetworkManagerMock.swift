//
//  NetworkManagerMock.swift
//  QuizGameTests
//
//  Created by Amany Shady on 27/02/2023.
//

import XCTest
@testable import QuizGame

final class NetworkManagerMock: NetworkManagerProtocol {
    
    var quizDataList  : [QuestionItem] = [QuestionItem]()
    var callquizApi = false
    var complateClouser : (([QuestionItem]?, ApiError?) -> ())!
    
    func fetchData(completion: @escaping ([QuizGame.QuestionItem]?, QuizGame.ApiError?) -> ()) {
        
        callquizApi = true
       complateClouser = completion
    }
    

    func fetchError( error : ApiError) {
      
        complateClouser (nil , error)
    }
   

    func fetchData() {
        
        complateClouser(quizDataList , nil)
    }

}
