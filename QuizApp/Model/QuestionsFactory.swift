//
//  QuestionsFactory.swift
//  QuizApp
//
//  Created by Cristian Sedano Arenas on 20/2/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

class QuestionsFactory {
    
    var questionsBank : QuestionsBank!
    
    init(){
        /*
        if let path = Bundle.main.path(forResource: "QuestionsBank", ofType: "plist") {
            if let pList = NSDictionary(contentsOfFile: path) {
                let questionData = pList["Questions"] as! [AnyObject]
                
                for question in questionData {
                    if let text = question["question"], let ans = question["answer"]{
                        questions.append(Question(text: text as! String, correctAnswer: ans as! Bool))
                    }
                }
            }
        }*/
        
        // Procesado Automatico Codable
        do{
            
            if let url = Bundle.main.url(forResource: "QuestionsBank", withExtension: "plist"){
                let data = try Data(contentsOf: url)
                self.questionsBank = try PropertyListDecoder().decode(QuestionsBank.self, from: data)
            }
            
        }catch{
            print(error)
        }
    }
    
    func getQuestionAdd(index: Int) -> Question? {
        
        if index < 0 || index >= self.questionsBank.Questions.count {
            return nil
        } else {
            return self.questionsBank.Questions[index]
        }
    }
    
    func getRandomQuestion() -> Question {
        
        let index = Int (arc4random_uniform(UInt32 (self.questionsBank.Questions.count)))
        return self.questionsBank.Questions[index]
    }
}
