//
//  StartScene.swift
//  Mobile Computing Project
//
//  Created by Ryan Soanes on 04/01/2019.
//  Copyright © 2019 Ryan Soanes. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var gameScene:SKScene!
    let backgroundSound = SKAudioNode(fileNamed: "gameOverMusic.wav")
    let playButton = SKSpriteNode(imageNamed: "game_over")
    
    override func didMove(to view: SKView) {
        self.addChild(backgroundSound)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(playButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton {
                if view != nil {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    gameScene = SKScene(fileNamed: "StartScene")
                    backgroundSound.run(SKAction.stop())
                    gameScene.scaleMode = .aspectFit
                    self.view?.presentScene(gameScene, transition: transition)
                }
            }
        }
    }
}
