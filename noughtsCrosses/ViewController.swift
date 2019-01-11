//
//  ViewController.swift
//  noughtsCrosses
//
//  Created by Jamie Willison on 19/11/2018.
//  Copyright © 2018 Jamie Willison. All rights reserved.
//

import UIKit
//Imports AVFoundation for music player
import AVFoundation

//Sets up player scores at the beginning
var score1 : Int = 0
var score2 : Int = 0

class ViewController: UIViewController {
    var activePlayer = 1
    /*Sets up the game space. So gameState sets all the spaces on the board to 0 (empty), Winning combinations includes all the possible ways a player could win, and then sets the game to active*/
    //Added combinations for the 4x4 play space
    var gameState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],[0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],[0,5,10,15],[3,6,9,12]]
    var gameActive = true
    
    //Set up for music player
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var turnImage: UIImageView!
    
    /*Function that causes a delay. Call the function around the code you want it to delay, and return the number of seconds you want it to delay for as an argument*/
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    
    @IBAction func action1(_ sender: UIButton) {
        
        //If statement for when the game is active
        if (gameState[sender.tag-1] == 0 && gameActive == true)
        {
            
        //gameActive variable stops game from continued to be played
            if gameActive == true
            {
                
                //Sets the image for player 1
                if (activePlayer == 1) {
                    sender.setImage(UIImage(named:"X.png"), for: UIControl.State()); activePlayer = 2
                    turnImage.image = UIImage(named: "O.png")
                }
                else{
                //Sets the image for player 2
                    sender.setImage(UIImage(named:"O.png"), for: UIControl.State()); activePlayer = 1
                    turnImage.image = UIImage(named: "X.png")
                }
        
                if (gameState[sender.tag-1] == 0){
                    gameState[sender.tag-1] = activePlayer
                }
            }
            //State the winning combinations, when one of these is achieved, game state changes to false
            //and  Buttons show.
            for combination in winningCombinations
                {
                    
                    if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] == gameState[combination[3]]
                    {
                        gameActive = false
                
                        if gameState[combination[0]] == 1{
                            //Nought has won
                            /*If Nought wins, shows the relevant label, then calls the delay function mentioned above and performs the segue to the quiz screen after two seconds*/
                            winLabel.text = "Noughts Wins!"
                            delayWithSeconds(2) {
                                self.performSegue(withIdentifier: "segue2", sender: self)
                            }
                            
                            
                        }else{
                            //Cross has won
                            winLabel.text = "Cross Wins!"
                            delayWithSeconds(2) {
                            self.performSegue(withIdentifier: "segue3", sender: self)
                            }
                        }
                        winLabel.isHidden = false
                    }
                }
            }
        
        /*This block handles the draw. So if no more  spaces are left on the board (i = 0),
         then break the if statement and set the gameActive to false, set the label to say it was a draw, and show the play again button*/
        gameActive = false
        for i in gameState
        {
            if i == 0
            {
                gameActive = true
                break
            }
        }
        if gameActive == false
        {
        winLabel.text = "It's a Draw :("
        winLabel.isHidden = false
        playAgainButton.isHidden = false
        }
        
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    //Play again button resets the board to all 0s, resets the game state and hides the relevant buttons again.
    //Nobody gets a point.
    @IBAction func playAgain(_ sender: Any)
    {
        gameState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        gameActive = true
        activePlayer = 1
        
        //Hides Reset and Win button on reset
        playAgainButton.isHidden = true
        winLabel.isHidden = true
        turnImage.image = UIImage(named: "X.png")
        
        for i in 1...16
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    /*The buttons for the sound player. Play, stop and pause.*/
    
    @IBAction func playBtn(_ sender: UIButton) {
        // play and resume
        if soundPlayer != nil{
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }
    }
    
    @IBAction func pauseBtn(_ sender: UIButton) {
        if soundPlayer != nil{
            elapsedTime = soundPlayer!.currentTime
            soundPlayer!.pause()
        }
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        if soundPlayer != nil{
            soundPlayer!.stop()
            elapsedTime = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Put the score labels in the viewDidLoad function to show them at the beginning.
        scoreLabel2.text = "Score: \(score1)"
        scoreLabel1.text = "Score: \(score2)"
        
        // Path of where the song is
        let path = Bundle.main.path(forResource: "Tiger", ofType: "mp3")
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            // Loads the sound file
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
            // Try catch for if it doesnt play
        catch { print("file not availalbe")}
        
    }


}

