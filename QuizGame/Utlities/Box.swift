//
//  Box.swift
//  QuizGame
//
//  Created by Amany Shady on 23/02/2023.
//

import Foundation


class Box<T>{
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                
                self.listener?(self.value)
            }
            
        }
    }
    
    init(value: T?) {
        self.value = value
    }
    
    private var listener : ((T?)->())?
    
    func bind(_ listener :@escaping (T?)->()) {
        
        listener(value)
        self.listener = listener
    }
    
}
