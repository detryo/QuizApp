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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}

