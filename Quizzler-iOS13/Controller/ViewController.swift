//
//  ViewController.swift
//  Quizzler-iOS13
//

import UIKit

class ViewController: UIViewController {
    

   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
//    var timer = Timer()
//
//    var QuestionNumber = 0
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        questionLabel.text = quiz.first
        
        updateUI()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
//        let actualAnswer = quiz[QuestionNumber].answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
            print("Right!")
        }
        else{
            sender.backgroundColor = UIColor.red
            print("Wrong..!")
        }
        
        quizBrain.nextQuestion()
       
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUI) , userInfo: nil, repeats: false)
//        updateUI()
    }
    @objc func updateUI (){
       
        questionLabel.text = quizBrain.getquestionText()
        progressView.progress = quizBrain.getProgress()

//        questionLabel.text = quiz[QuestionNumber].text
//        progressView.progress = Float(QuestionNumber+1) / Float(quiz.count)
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    
}


