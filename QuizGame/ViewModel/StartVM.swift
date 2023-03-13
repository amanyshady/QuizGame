//
//  StartVM.swift
//  QuizGame
//
//  Created by Amany Shady on 23/02/2023.
//

import Foundation

class StartVM {
    
    let networkManager : NetworkManagerProtocol
    
    var quizQuesList : Box<[QuizQuestion]> = Box(value: [])
    
    var questionSelected : Int  = 0
    
    var selectCorrectAnswer : Box<Bool> = Box(value: nil)
    
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func increaseQuestionSelected() {
        
        if self.questionSelected < (self.getAllQuestionsNumCount() - 1 ) {
            
            self.questionSelected =  questionSelected + 1
            
        }
    }
    
    func decreaseQuestionSelected() {
      
        if self.questionSelected >= 1 {
            
            self.questionSelected = questionSelected - 1
        }
        
    }
    
    
    func getQuesLabelTxt () -> String {
       
      
        if  let quizarray = self.quizQuesList.value {
            
            return quizarray[self.questionSelected].question
        }
        
        return ""
    }
    
    func getSelectedOptionAnswers (index : Int) -> OptionAnsItem {
        
        if  let quizarray = self.quizQuesList.value {
            
            return quizarray[self.questionSelected].answersOptions[index]
        }
        
        return OptionAnsItem()
    }
    
    func getSelectedOptionAnswersCount () -> Int {
        
        if  let quizarray = self.quizQuesList.value {
            
            return quizarray[self.questionSelected].answersOptions.count
        }
        
        return 0
    }
    
    func userSelectAnswer(selectedAnswer : Int) {
     
        let selectedAnswer = getSelectedOptionAnswers(index: selectedAnswer)
        
        self.selectCorrectAnswer.value = selectedAnswer.isCorrect
        
    }
    
    func getAllQuestionsNumCount () -> Int {
        
        if  let quizarray = self.quizQuesList.value {
            
            return quizarray.count
        }
        
        return 0
    }
    
    func fetchQuizQuest() {
       
        networkManager.fetchData(completion: { questionArray,error  in
            
            if let error = error {
    
                print("Data error",error)
            }
            
            guard let returnQuesArray = questionArray else {return}
          
            DispatchQueue.main.sync {
                
                // create cell model
                let finalQuizList = self.createQuizCellModel(questionArray: returnQuesArray)
                self.quizQuesList.value = finalQuizList
            }
            
        })
        
    }
    
    func createQuizCellModel(questionArray : [QuestionItem]) -> [QuizQuestion] {
        
        var quesArray = [QuizQuestion]()
        
        for item in questionArray {
         
            guard let question = item.question ,
                  let correctAnswer = item.correctAnswer ,
                  let incorrectAnswers = item.incorrectAnswers else {break}
            
            var allOptionsArray = incorrectAnswers
            allOptionsArray.append(correctAnswer)
            
            var optionList : [OptionAnsItem] = [OptionAnsItem]()
            
            for optionItem in allOptionsArray {
               
                let optionItem = OptionAnsItem(id: Int.random(in: 0...6), answerTxt: optionItem, isCorrect: optionItem == correctAnswer)
                
                optionList.append(optionItem)
                
            }
            
            
            let quizQuesItem = QuizQuestion( question: question, correctAnswer: correctAnswer, answersOptions: optionList)
            
            quesArray.append(quizQuesItem)
        }
        
        
        return quesArray
                
               
    }
    
    
}
