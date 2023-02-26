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
            listener?(value)
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
    
//    typealias Listener = (T) -> Void
//    var listener: Listener?
//
//    var value: T {
//        didSet{
//            listener?(value)
//        }
//    }
//
//    init(_ value: T) {
//        self.value = value
//    }
//
//
//    func bind(listener: Listener?){
//        self.listener = listener
//        listener?(value)
//    }
}
