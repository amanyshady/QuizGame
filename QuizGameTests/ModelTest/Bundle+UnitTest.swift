//
//  Bundle+UnitTest.swift
//  QuizGameTests
//
//  Created by Amany Shady on 27/02/2023.
//

import Foundation

extension Bundle {
    
    public class var unitTest : Bundle {
        return Bundle(for: NetworkManagerTests.self)
    }
}
