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
    
    var currentScore = 0
    var currentQuestionId = 0
    var currectQuestionAnswered = 0
    var currentQuestion :  Question!
    let factory = QuestionsFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
    }
    
    func startGame(){
        
        currentScore = 0
        currentQuestionId = 0
        currectQuestionAnswered = 0
        
        self.factory.questionsBank.Questions.shuffle()
        
        askNextQuestion()
        updateUIElements()
    }
    
    func askNextQuestion(){
        
        if let newQuestion = factory.getQuestionAt(index: currentQuestionId){
            self.currentQuestion = newQuestion
            self.labelQuestion.text = self.currentQuestion.question
            self.currentQuestionId += 1
        }else{
            // Aqui la new Question es nula ya que hemos hecho todas las preguntas
            gameOver()
        }
    }
    
    func gameOver() {
        
        let alert = UIAlertController(title: "Game Over", message: "You´re right \(self.currectQuestionAnswered) / \(self.currentQuestionId) Try again ", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            
            self.startGame()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateUIElements() {
        
        self.labelScore.text = "Score: \(self.currentScore)"
        self.labelQuestionNumber.text = "\(self.currentQuestionId)/\(self.factory.questionsBank.Questions.count)"
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var isCorrect : Bool
        
        if sender.tag == 1{
            // el usuario ha clickado el boton true
            isCorrect = (self.currentQuestion.answer == true)
        }else {
            // el usuario ha clickado el boton false
            isCorrect = (self.currentQuestion.answer == false)
        }
        
        var title = "You have failed"
        
        if (isCorrect) {
            self.currectQuestionAnswered += 1
            title = "Congratulation"
            self.currentScore += 100*self.currectQuestionAnswered
        }
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { (_) in
            
            self.askNextQuestion()
            self.updateUIElements()
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}

