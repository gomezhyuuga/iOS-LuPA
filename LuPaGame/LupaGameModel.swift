//
//  LupaGameModel.swift
//  LuPaGame
//
//  Created by Fernando Gómez Herrera on 8/30/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import Foundation

class LupaGame {
    
    let numberOfLights = 7
    var numberOfMoves  = 0
    var gameFinished = false
    
    var lights: [Int] = []
    
    init () {
        do {
            generateBoard()
        }
        while(checkIfGameHasFinished())
        gameFinished = false
    }
    
    func restart() {
        do {
            generateBoard()
        } while(checkIfGameHasFinished())
        numberOfMoves = 0
        gameFinished = false
    }
    
    func makeMove(position: Int) {
        if (gameFinished) {
            return
        }
        
        numberOfMoves++
        
        lights[position] = invert(lights[position])
        // Edge positions
        if (position > 0) {
            lights[position - 1] = invert(lights[position - 1])
        }
        if (position < numberOfLights - 1) {
         lights[position + 1] = invert(lights[position + 1])
        }
        
        checkIfGameHasFinished()
    }
    
    private func invert(number: Int) -> Int {
        return number == 1 ? 0 : 1
    }
    
    private func generateBoard() {
        lights = []
        
        for var index = 0; index < numberOfLights; ++index {
            let onOff = Int(arc4random() % 2)
            lights.append(onOff)
        }
    }
    
    private func checkIfGameHasFinished() -> Bool {
        var lastLight = lights[0]
        for light in lights {
            if lastLight != light {
                return false
            }
            lastLight = light
        }
        gameFinished = true
        return gameFinished
    }
}