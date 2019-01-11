//
//  ViewController2.swift
//  noughtsCrosses
//
//  Created by Jamie Willison on 04/01/2019.
//  Copyright © 2019 Jamie Willison. All rights reserved.
//

import UIKit
//Declares the structure "Question" which contains the variables Question (string), Answers (string) and Answer (int).
struct Question {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var backBtn: UIButton!
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backBtnsegue", sender: self)
    }
    
    
    //Sets up variables
    var Questions = [Question]()
    var Qnumber = Int()
    var AnswerNumber = Int()

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
            
            for i in 0..<buttons.count{
                buttons[i].setTitle(Questions[Qnumber].Answers[i], for: UIControl.State.normal)
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
        score1 += 1
        performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    @IBAction func btn2(_ sender: Any) {
        if AnswerNumber == 1
        {
            score1 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    @IBAction func btn3(_ sender: Any) {
        if AnswerNumber == 2
        {
            score1 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    @IBAction func btn4(_ sender: Any) {
        if AnswerNumber == 3
        {
            score1 += 1
            performSegue(withIdentifier: "segue1", sender: self)
        } else {
            wrongLabel.isHidden = false
            backBtn.isHidden = false
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
