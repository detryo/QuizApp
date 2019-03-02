//
//  ViewController.swift
//  QuizApp
//
//  Created by Cristian Sedano Arenas on 12/2/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    var correntScore = 0
    var correntQuestionId = 0
    var correctQuestionAnswered = 0
    var correntQuestion :  Question!
    let factory = QuestionsFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
    }
    
    func startGame(){
        
        correntScore = 0
        correntQuestionId = 0
        correctQuestionAnswered = 0
        
        // el metodo shuffle reordena las preguntas
        // para que cada partida sea diferente
        self.factory.questionsBank.Questions.shuffle()
        
        askNextQuestion()
    }
    
    func askNextQuestion(){
        
        if let newQuestion = factory.getQuestionAt(index: correntQuestionId){
            self.correntQuestion = newQuestion
            self.labelQuestion.text = self.correntQuestion.question
            self.correntQuestionId += 1
        }else{
            // Aqui la new Question es nula ya que hemos hecho todas las preguntas
            gameOver()
        }
    }
    
    func gameOver() {
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var isCorrect : Bool
        
        if sender.tag == 1{
            // el usuario ha clickado el boton true
            isCorrect = (self.correntQuestion.answer == true)
        }else {
            // el usuario ha clickado el boton false
            isCorrect = (self.correntQuestion.answer == false)
        }
        if (isCorrect) {
            self.correctQuestionAnswered += 1
        }
        askNextQuestion()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}

