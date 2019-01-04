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
    let playButton = SKSpriteNode()
    let gameOverLabel = SKLabelNode()
    let restartMessage = SKLabelNode()
    
    override func didMove(to view: SKView) {
        self.addChild(backgroundSound)
        setupFinalScore()
        setupGameOver()
        setupRestartMessage()
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        playButton.size = CGSize(width: size.width, height: size.height)
        self.addChild(playButton)
    }
    
    func setupGameOver() {
        gameOverLabel.text = "GAME OVER"
        gameOverLabel.position = CGPoint(x: size.width / 2, y: size.height - size.height / 3)
        gameOverLabel.color = UIColor.white
        gameOverLabel.fontSize = 72
        addChild(gameOverLabel)
    }
    
    func setupRestartMessage() {
        restartMessage.text = "Tap the screen to restart"
        restartMessage.position = CGPoint(x: size.width / 2, y: size.height / 4)
        restartMessage.color = UIColor.white
        restartMessage.fontSize = 72
        addChild(restartMessage)
    }
    
    func setupFinalScore() {
        let finalScoreLabel = SKLabelNode()
        let score = UserDefaults.standard.string(forKey: "score") ?? ""
        finalScoreLabel.text = "Score: \(score)"
        finalScoreLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        finalScoreLabel.color = UIColor.white
        finalScoreLabel.fontSize = 72
        addChild(finalScoreLabel)
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
