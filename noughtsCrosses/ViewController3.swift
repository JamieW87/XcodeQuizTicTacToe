//
//  ViewController3.swift
//  noughtsCrosses
//
//  Created by Jamie Willison on 11/01/2019.
//  Copyright © 2019 Jamie Willison. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet var answerBtns: [UIButton]!
    @IBOutlet weak var backBtn: UIButton!
    
    //Sets up variables
    var Questions = [Question]()
    var Qnumber = Int()
    var AnswerNumber = Int()
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backBtnsegue", sender: self)
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Array of questions loaded when the view opens*/
        Questions = [Question(Question: "Who played Boromir in LOTR", Answers: ["Russell Crowe","Sean Penn","Sean Bean","Jack Nicholson"], Answer: 2),
                     Question(Question: "What is the capital of Canada?", Answers: ["Ottawa","Toronto","Bangladesh","Los Angeles"], Answer: 0),
                     Question(Question: "In which city was the Titanic built?", Answers: ["New York","Belfast","Portsmouth","Shanghai"], Answer: 1),
                     Question(Question: "What animal is the largest animal on earth?", Answers: ["Elephant","Giraffe","Whale","Shark"], Answer: 2),
                     Question(Question: "What is the seventh planet from the sun?", Answers: ["Uranus","Jupiter","Mercury","Earth"], Answer: 0),
                     Question(Question: "Who is the father of the atomic bomb?", Answers: ["Zeppelin","Hitler","Stalin","Oppenheimer"], Answer: 3),
                     Question(Question: "Name the worlds largest ocean", Answers: ["Atlantic","Indian","Arctic","Pacific"], Answer: 3)]
        
        RandomQ()

        // Do any additional setup after loading the view.
    }
    
    /*Function that picks a random question from the array above */
    func RandomQ() {
        if Questions.count > 0{
            Qnumber = Int(arc4random()) % Questions.count
            qLabel.text = Questions[Qnumber].Question
            
            AnswerNumber = Questions[Qnumber].Answer
            
            for i in 0..<answerBtns.count{
                answerBtns[i].setTitle(Questions[Qnumber].Answers[i], for: UIControl.State.normal)
            }
            
        }
        else {
            NSLog("Done")
        }
    }
    
    @IBOutlet weak var wrongLabel: UILabel!
    
    
    @IBAction func btn1(_ sender: Any) {
        if AnswerNumber == 0
        {
            score2 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    @IBAction func btn2(_ sender: Any) {
        if AnswerNumber == 1
        {
            score2 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    
    @IBAction func btn3(_ sender: Any) {
        if AnswerNumber == 2
        {
            score2 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    @IBAction func btn4(_ sender: Any) {
        if AnswerNumber == 3
        {
            score2 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
}
