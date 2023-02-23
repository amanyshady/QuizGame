//
//  StartVM.swift
//  QuizGame
//
//  Created by Amany Shady on 23/02/2023.
//

import Foundation

class StartVM {
    
    let networkManager : NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchQuizQuest() {
       
        networkManager.fetchData(completion: { questionArray in
            
            print("return question array",questionArray)
            
        })
        
    }
    
}
