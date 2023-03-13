//
//  QuizModel.swift
//  QuizGame
//
//  Created by Amany Shady on 22/02/2023.
//

import Foundation

struct QuizModel : Codable {
    
    var results : [QuestionItem]?
}

struct QuestionItem : Codable {
    
    var question : String?
    var correctAnswer : String?
    var incorrectAnswers : [String]?
    
    enum CodingKeys:String , CodingKey {
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
}

struct OptionAnsItem {
    
    var id : Int?
    var answerTxt : String?
    var isCorrect : Bool? = false
    
    init(id: Int? = nil, answerTxt: String? = nil , isCorrect  : Bool? = nil) {
        
        self.id = id
        self.answerTxt = answerTxt
        self.isCorrect = isCorrect
       
    }

}

struct QuizQuestion {
    
    var question : String
    var correctAnswer : String
    var answersOptions : [OptionAnsItem]
    
    init(question: String, correctAnswer: String, answersOptions: [OptionAnsItem] ) {
    
        self.question = question
        self.correctAnswer = correctAnswer
        self.answersOptions = answersOptions
    }
}
