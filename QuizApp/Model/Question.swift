//
//  Question.swift
//  QuizApp
//
//  Created by Cristian Sedano Arenas on 20/2/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

class Question : CustomStringConvertible{
    
    let questionText : String
    let answer : Bool
    
    var description : String {
        return """
        
        Question: - \(questionText)
        Answer:   - \(answer)
        
        """
    }
    
    init(text: String, correctAnswer: Bool) {
        
        self.questionText = text
        self.answer = correctAnswer
    }
}
