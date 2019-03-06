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
            gameOver()
        }
    }
    
    func gameOver() {
        
        let alert = UIAlertController(title: NSLocalizedString("game.over.title", comment: "Title PopUp game over"), message: "\(NSLocalizedString("game.over.message1", comment: "")) \(self.currectQuestionAnswered) / \(self.currentQuestionId) \(NSLocalizedString("game.over.message2", comment: "")) ", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            
            self.startGame()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateUIElements() {
        
        self.labelScore.text = "\(NSLocalizedString("score.text", comment: "")): \(self.currentScore)"
        self.labelQuestionNumber.text = "\(self.currentQuestionId)/\(self.factory.questionsBank.Questions.count)"
        
        for constraint in self.progressBar.constraints {
            
            if constraint.identifier == "barWidth" {
                
                constraint.constant = (self.view.frame.size.width)/CGFloat(self.factory.questionsBank.Questions.count) * CGFloat(self.currentQuestionId)
            }
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var isCorrect : Bool
        
        if sender.tag == 1{
            isCorrect = (self.currentQuestion.answer == true)
        }else {
            isCorrect = (self.currentQuestion.answer == false)
        }
        
        if (isCorrect) {
            self.currectQuestionAnswered += 1
            self.currentScore += 100*self.currectQuestionAnswered
            ProgressHUD.showSuccess(NSLocalizedString("question.ok", comment: ""), interaction: true)
        }else {
            ProgressHUD.showError(NSLocalizedString("question.ko", comment: ""), interaction: true)
        }
        askNextQuestion()
        updateUIElements()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}

