//
//  Question.swift
//  QuizApp
//
//  Created by Cristian Sedano Arenas on 20/2/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

class Question : CustomStringConvertible, Codable{
    
    let question : String
    let answer : Bool
    /*
    enum CodingKeys : String, CodingKey {
        case questionText = "question"
        case answer = "answer"
    }*/
    
    var description : String {
        return """
        
        Question: - \(question)
        Answer:   - \(answer)
        
        """
    }
    
    init(text: String, correctAnswer: Bool) {
        
        self.question = text
        self.answer = correctAnswer
    }
}

struct QuestionsBank : Codable {
    var Questions : [Question]
}
