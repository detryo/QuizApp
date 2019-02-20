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
        
        questions.append(Question(text: "El vaticano tiene la cantidad de dinero suficiente para acabar con el hambre en el mundo", correctAnswer: true))
       
        questions.append(Question(text: "El caballito de mar es tan fiel a su pareja, que cuando uno muere, el otro tambien", correctAnswer: true))
        
        questions.append(Question(text: "Los humanos son los unicos seres vivos que practican el sexo por placer", correctAnswer: false))
        
        questions.append(Question(text: "La semilla de la manzana contiene cianuro y es toxica", correctAnswer: true))
        
        questions.append(Question(text: "Se puede afeitar el bigote a un gato sin problemas", correctAnswer: false))
        
        questions.append(Question(text: "Un koala necesita beber al menos una vez al dia", correctAnswer: false))
        
        questions.append(Question(text: "Edison, tenia miedo de la oscuridad", correctAnswer: true))
        
        questions.append(Question(text: "Los escorpiones son los unicos animales que se suicidad cuando no pueden escapar de una situacion de peligro", correctAnswer: true))
        
        questions.append(Question(text: "Los ojos de un hamster se pueden caer si se le cuelga cabeza abajo", correctAnswer: true))
        
        questions.append(Question(text: "Si divides el numero de abejas hembra entre el de abejas machode un panel, se obtiene el numero de oro", correctAnswer: false))
        
        questions.append(Question(text: "Las palmeras nacieron por primera vez en el polo norte", correctAnswer: true))
        
        questions.append(Question(text: "Cervantes y Shakespeare murieron el mismo día", correctAnswer: true))
        
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
