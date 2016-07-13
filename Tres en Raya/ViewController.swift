//
//  ViewController.swift
//  Tres en Raya
//
//  Created by Darwing Medina on 31/3/16.
//  Copyright © 2016 Darwing Medina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 es circulo, 2 es cruz
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // estados de posicion, 1 para jugador 1 y 2 para jugador 2
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true
    
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        
        for var i = 0 ; i < 9 ; i++ {
            
            var tButton: UIButton
            tButton = view.viewWithTag(i) as! UIButton
            tButton.setImage(nil, forState: .Normal)
            
        }
        
        hideGameOver()
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var image = UIImage()
        
        if gameState[sender.tag] == 0 && gameActive{
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                image = UIImage (named: "nought.png")!
                activePlayer = 2
            }
            else{
                image = UIImage (named: "cross.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal) // sender para que sea cualquiera de los botones asignados, ver tag
            
            for combinations in winningCombinations {
                if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]{
                    
                    gameActive = false
                    
                    if gameState[sender.tag] == 1 {
                        gameOverLabel.text = "Los círculos ganan!"
                    }
                    else {
                        gameOverLabel.text = "Los cruces ganan!"
                    }
                    
                    gameOverLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y) // animacion de etiqueta
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y) // animacion boton
                    })
                }
            }
        }
        
    }
    
    func hideGameOver() {
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideGameOver()
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y) // posiciones iniciales
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y) // posiciones iniciales
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

