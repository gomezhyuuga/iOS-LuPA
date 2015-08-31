//
//  FirstViewController.swift
//  LuPaGame
//
//  Created by Fernando Gómez Herrera on 8/30/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var game = LupaGame()
    
    @IBOutlet weak var lights: UISegmentedControl!
    @IBOutlet weak var btnRestart: UIButton!
    
    @IBAction func restartGame(sender: UIButton) {
        game.restart()
        updateLights()
        lights.enabled = true
        
        // Deactivate restart button
        btnRestart.alpha = 0.4
        btnRestart.enabled = false
    }
    
    @IBAction func makeMove(sender: UISegmentedControl) {
        var selected = sender.selectedSegmentIndex
        
        if (!game.gameFinished) {
            game.makeMove(selected)
            updateLights()
            
            // Show Alert if game has ended
            if (game.gameFinished) {
                // Activate restart button
                btnRestart.enabled = true
                btnRestart.alpha = 1
                lights.enabled = false
                
                // Show Alert
                UIAlertView(title: "Game finished!", message: "Congratulations, you have completed the game in \(game.numberOfMoves) moves!", delegate: self, cancelButtonTitle: "Done").show()
            }
        }
    }
    
    func updateLights() {
        for var index = 0; index < game.lights.count; ++index {
            lights.setTitle("\(game.lights[index])", forSegmentAtIndex: index)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLights()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

