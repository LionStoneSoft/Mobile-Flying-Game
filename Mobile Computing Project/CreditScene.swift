//
//  CreditScene.swift
//  Mobile Computing Project
//
//  Created by Ryan Soanes on 04/01/2019.
//  Copyright © 2019 Ryan Soanes. All rights reserved.
//

import SpriteKit

class CreditScene: SKScene {
    
    let creditButton = SKSpriteNode()
    let playButton = SKSpriteNode()
    var gameScene:SKScene!
    
    override func didMove(to view: SKView) {
        setupCredits()
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        playButton.size = CGSize(width: size.width, height: size.height)
        self.addChild(playButton)
    }
    
    func setupCredits() {
        let backgroundImage = SKSpriteNode(imageNamed: "creditsPic")
        backgroundImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        backgroundImage.size = CGSize(width: size.width, height: size.height)
        addChild(backgroundImage)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton {
                if view != nil {
                    let transition:SKTransition = SKTransition.flipHorizontal(withDuration: 1)
                    gameScene = SKScene(fileNamed: "GameOverScene")
                    gameScene.scaleMode = .aspectFit
                    self.view?.presentScene(gameScene, transition: transition)
                }
            }
        }
    }
}
