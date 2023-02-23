//
//  QuizModel.swift
//  QuizGame
//
//  Created by Amany Shady on 22/02/2023.
//

import Foundation

struct QuizModel : Codable {
    
    let results : [QuestionItem]?
}

struct QuestionItem : Codable {
    
    let id : Int?
    let question : String?
    let correctAnswer : String?
    let incorrectAnswers : [String]?
    
    enum CodingKeys:String , CodingKey {
        case id
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
}
