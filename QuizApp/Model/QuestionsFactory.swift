//
//  QuestionsFactory.swift
//  QuizApp
//
//  Created by Cristian Sedano Arenas on 20/2/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

class QuestionsFactory {
    
    var questions = [Question]()
    
    init(){
        if let path = Bundle.main.path(forResource: "QuestionsBank", ofType: "plist") {
            if let pList = NSDictionary(contentsOfFile: path) {
                let questionData = pList["Questions"] as! [AnyObject]
                
                for question in questionData {
                    if let text = question["question"], let ans = question["answer"]{
                        questions.append(Question(text: text as! String, correctAnswer: ans as! Bool))
                    }
                }
            }
        }
    }
    
    func getQuestionAdd(index: Int) -> Question? {
        
        if index < 0 || index >= questions.count {
            return nil
        } else {
            return questions[index]
        }
    }
    
    func getRandomQuestion() -> Question {
        
        let index = Int (arc4random_uniform(UInt32 (questions.count)))
        return questions[index]
    }
}
