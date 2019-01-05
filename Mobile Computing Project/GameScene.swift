//
//  GameScene.swift
//  Mobile Computing Project Sprite Kit
//
//  Created by Ryan Soanes on 15/12/2018.
//  Copyright © 2018 Ryan Soanes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = SKSpriteNode(imageNamed: "plane1")
    let background = SKSpriteNode(imageNamed: "road1")
    let playerCategory: UInt32 = 0x00000001 << 0
    let enemyCategory: UInt32 = 0x00000001 << 1
    let coinCategory: UInt32 = 0x00000001 << 2
    let coinSound = SKAction.playSoundFileNamed("coinNoise", waitForCompletion: false)
    let crowSound = SKAction.playSoundFileNamed("crowSound", waitForCompletion: false)
    let gameplayMusic = SKAudioNode(fileNamed: "gameplayMusic.wav")
    var gameScene:SKScene!
    var scoreLabel = SKLabelNode()
    var timerLabel = SKLabelNode()
    var currentScore = 0
    var finalScore: String?

    
    override func didMove(to view: SKView) { //similar to viewDidLoad
        physicsWorld.contactDelegate = self
        self.addChild(gameplayMusic)
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(setupBackground),
                SKAction.wait(forDuration: 2.0)
                ])
        ))
        
        setupScore()
        setupPlayer()
        timer()
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(setupEnemy),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(setupCoins),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func timer() {
        let actionwait = SKAction.wait(forDuration: 1)
        var timesecond = 20
        timerLabel.position = CGPoint(x: size.width / 4, y: size.height - 65)
        self.timerLabel.text = "Time Left: \(timesecond)"
        self.timerLabel.color = UIColor.white
        addChild(timerLabel)
        let actionrun = SKAction.run({
            timesecond = timesecond - 1
            if timesecond == 0 {
                self.gameScene = SKScene(fileNamed: "GameOverScene")
                self.gameplayMusic.run(SKAction.stop())
                self.gameScene.scaleMode = .aspectFit
                self.finalScore = String(self.currentScore)
                UserDefaults.standard.set(self.finalScore, forKey: "score")
                self.view?.presentScene(self.gameScene)}
            self.timerLabel.text = "Time Left: \(timesecond)"
        })
        
        timerLabel.run(SKAction.repeatForever(SKAction.sequence([actionwait,actionrun])))
    }
    
    func setupScore() {
        scoreLabel.text = "Score: \(currentScore)"
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height - 65)
        scoreLabel.fontColor = UIColor.white
        addChild(scoreLabel)
    }
    
    func setupPlayer() {
        let f0 = SKTexture.init(imageNamed: "phoenix1")
        let f1 = SKTexture.init(imageNamed: "phoenix2")
        let f2 = SKTexture.init(imageNamed: "phoenix3")
        let f3 = SKTexture.init(imageNamed: "phoenix4")
        let f4 = SKTexture.init(imageNamed: "phoenix5")
        let f5 = SKTexture.init(imageNamed: "phoenix6")
        
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5]
        player.position = CGPoint(x: size.width * 0.2, y: size.height * 0.5)
        player.size = CGSize(width: size.width / 10, height: size.height / 8)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.1)
        player.run(SKAction.repeatForever(animation))
        addChild(player)
        //physics body of player
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = playerCategory
        player.physicsBody?.collisionBitMask = enemyCategory | coinCategory
        player.physicsBody?.contactTestBitMask = enemyCategory | coinCategory
    }
    
    func setupBackground() {
//        let f0 = SKTexture.init(imageNamed: "road1")
//        let f1 = SKTexture.init(imageNamed: "road2")
//        let f2 = SKTexture.init(imageNamed: "road3")
//        let f3 = SKTexture.init(imageNamed: "road4")
//        let f4 = SKTexture.init(imageNamed: "road5")
//        let f5 = SKTexture.init(imageNamed: "road6")
//        let f6 = SKTexture.init(imageNamed: "road7")
//        let f7 = SKTexture.init(imageNamed: "road8")
//        let f8 = SKTexture.init(imageNamed: "road9")
//        let f9 = SKTexture.init(imageNamed: "road10")
//        let f10 = SKTexture.init(imageNamed: "road11")
//        let f11 = SKTexture.init(imageNamed: "road12")
//        let f12 = SKTexture.init(imageNamed: "road13")
//        let f13 = SKTexture.init(imageNamed: "road14")
//        let f14 = SKTexture.init(imageNamed: "road15")
//        let f15 = SKTexture.init(imageNamed: "road16")
//        let f16 = SKTexture.init(imageNamed: "road17")
//        let f17 = SKTexture.init(imageNamed: "road18")
//        let f18 = SKTexture.init(imageNamed: "road19")
//        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18]
//        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
//        background.size = CGSize(width: size.width, height: size.height)
//        let animation = SKAction.animate(with: frames, timePerFrame: 0.04)
//        background.run(SKAction.repeatForever(animation))
//        addChild(background)
        let back = SKSpriteNode(imageNamed: "nighttown")
        back.position = CGPoint(x: size.width/2, y: size.height / 2)
        back.size = CGSize(width: size.width, height: size.height)
        addChild(back)
        back.zPosition = -100
        let actionMove = SKAction.move(to: CGPoint(x: -back.size.width/2, y:size.height/2), duration: 2)
        let actionMoveDone = SKAction.removeFromParent()
        
        let back2 = SKSpriteNode(imageNamed: "nighttown")
        back2.position = CGPoint(x: size.width + (size.width / 2), y: size.height / 2)
        back2.size = CGSize(width: size.width, height: size.height)
        addChild(back2)
        back2.zPosition = -100
        let actionmove2 = SKAction.move(to: CGPoint(x: back2.size.width / 2, y:size.height/2), duration: 2)
        back.run(SKAction.sequence([actionMove, actionMoveDone]))
        back2.run(SKAction.sequence([actionmove2, actionMoveDone]))
        
    }
    
    func setupCoins() {
        let coin = SKSpriteNode(imageNamed: "egg")
        let actualY = random(min: coin.size.height/2, max: size.height - coin.size.height/2)
        coin.position = CGPoint(x: size.width + coin.size.width/2, y: actualY)
        coin.size = CGSize(width: 50, height: 50)
        addChild(coin)
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: -coin.size.width/2, y: actualY),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        coin.run(SKAction.sequence([actionMove, actionMoveDone]))
        //physics for coin
        coin.physicsBody = SKPhysicsBody(circleOfRadius: max(coin.size.width / 2, coin.size.height / 2))
        coin.physicsBody?.isDynamic = true
        coin.physicsBody?.categoryBitMask = coinCategory
        coin.physicsBody?.collisionBitMask = playerCategory
        coin.physicsBody?.contactTestBitMask = playerCategory
        
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func setupEnemy() {
        let enemy = SKSpriteNode(imageNamed: "bat1")
        let f0 = SKTexture.init(imageNamed: "garg1")
        let f1 = SKTexture.init(imageNamed: "garg2")
        let f2 = SKTexture.init(imageNamed: "garg3")
        let f3 = SKTexture.init(imageNamed: "garg4")
        let frames: [SKTexture] = [f0, f1, f2, f3]
        let actualY = random(min: enemy.size.height/2, max: size.height - enemy.size.height/2)
        enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: actualY)
        enemy.size = CGSize(width: enemy.size.width * 4, height: enemy.size.height * 7)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.17)
        enemy.run(SKAction.repeatForever(animation))
        addChild(enemy)
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: actualY),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionMoveDone]))
        //physics body of enemy
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: max(enemy.size.width / 2, enemy.size.height / 2))
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.categoryBitMask = enemyCategory
        enemy.physicsBody?.collisionBitMask = playerCategory
        enemy.physicsBody?.contactTestBitMask = playerCategory
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let body: SKPhysicsBody = contact.bodyB
        
        if collision == playerCategory | enemyCategory {
            currentScore = currentScore - 100
            scoreLabel.text = "Score: \(currentScore)"
            run(crowSound)
            body.node?.removeFromParent()
        }
        
        if collision == playerCategory | coinCategory {
            currentScore = currentScore + 100
            scoreLabel.text = "Score: \(currentScore)"
            run(coinSound)
            body.node?.removeFromParent()
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Called when touch begins
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            player.position.x = location.x
            player.position.y = location.y
            
        }
    }
}


