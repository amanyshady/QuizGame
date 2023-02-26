//
//  NetworkManager.swift
//  QuizGame
//
//  Created by Amany Shady on 22/02/2023.
//

import Foundation


enum ApiError : String , Error {
    
    case noData = "no Data"
    case errorParsigData = "Can't parse data"
    case invalidUrl = "your url is invalid"
}

protocol NetworkManagerProtocol {
    
    func fetchData(completion : @escaping (_ quizeList : [QuestionItem]? , _ error : ApiError?) -> ())
}

class NetworkManager : NetworkManagerProtocol {
    
    
    func fetchData(completion : @escaping (_ quizeList : [QuestionItem]? , _ error : ApiError?) -> ()) {
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5&category=27&difficulty=easy&type=multiple") else {
            
            completion(nil, .invalidUrl)
            return
        }
        
       let task =  URLSession.shared.dataTask(with: url) { data, _, _ in
            
         
            
            guard let data = data else {
                
                completion(nil, .noData)
                return
                
            }
            
            print("return data \(data)")
           
           do {
              
               let result = try JSONDecoder().decode(QuizModel.self, from: data)
               
               guard let quesList = result.results else {return}
            
               completion(quesList , nil)
               
           }catch let jsonError {
               
               print(jsonError)
               completion(nil , .errorParsigData)
           }
           
        }
        
        task.resume()
    }

}
