//
//  NetworkManager.swift
//  QuizGame
//
//  Created by Amany Shady on 22/02/2023.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func fetchData(completion : @escaping ([QuestionItem]?) -> ())
}

class NetworkManager : NetworkManagerProtocol {
    
    
    func fetchData(completion : @escaping ([QuestionItem]?) -> ()) {
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5&category=27&difficulty=easy&type=multiple") else {
            return
        }
        
       let task =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("there is an error \(error.localizedDescription)")
                completion(nil)
            }
            
            guard let data = data else {return}
            
            print("return data \(data)")
           
           do {
              
               let result = try JSONDecoder().decode(QuizModel.self, from: data)
               
               completion(result.results)
               
           }catch let jsonError {
               
               print(jsonError)
               completion(nil)
           }
           
        }
        
        task.resume()
    }
}
