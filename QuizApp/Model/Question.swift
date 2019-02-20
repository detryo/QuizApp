//
//  Question.swift
//  QuizApp
//
//  Created by Cristian Sedano Arenas on 20/2/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        
        self.questionText = text
        self.answer = correctAnswer
    }
}
