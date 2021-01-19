//
//  ViewController.swift
//  Rock, Paper, Scissors
//
//  Created by Иван on 1/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var playerScore = 0
    var robotScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
        scoreLabel.text = "\(playerScore):\(robotScore)"
    }
    
    func play(sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
        
        let result = sign.getResult(for: computerSign)
        
        switch result {
        case .win: statusLabel.text = "WIN"; self.view.backgroundColor = .green
            playerScore += 1
        case .lose: statusLabel.text = "LOSE"; self.view.backgroundColor = .red
            robotScore += 1
        case .draw: statusLabel.text = "DRAW"; self.view.backgroundColor = .yellow
        case .start: break
        }
        
        scoreLabel.text = "\(playerScore):\(robotScore)"
    }
    
    func playAgain() {
        self.view.backgroundColor = .white
        robotButton.setTitle("🤖", for: .normal)
        statusLabel.text = "Rock, Paper, Scissors?"
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        
        playAgainButton.isHidden = true
    }
    //MARK: - IBActions
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(sign: .rock)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(sign: .paper)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(sign: .scissors)
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        playAgain()
    }
    

}

