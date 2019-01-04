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
    
    override func didMove(to view: SKView) { //similar to viewDidLoad
        physicsWorld.contactDelegate = self
        self.addChild(gameplayMusic)
        setupBackground()
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
        timerLabel.fontColor = UIColor.black
        self.timerLabel.text = "Time Left: \(timesecond)"
        addChild(timerLabel)
        let actionrun = SKAction.run({
            timesecond = timesecond - 1
            if timesecond == 0 {
                self.gameScene = SKScene(fileNamed: "GameOverScene")
                self.gameplayMusic.run(SKAction.stop())
                self.gameScene.scaleMode = .aspectFit
                self.view?.presentScene(self.gameScene)}
            self.timerLabel.text = "Time Left: \(timesecond)"
        })
        
        timerLabel.run(SKAction.repeatForever(SKAction.sequence([actionwait,actionrun])))
    }
    
    func setupScore() {
        scoreLabel.text = "Score: \(currentScore)"
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height - 65)
        scoreLabel.fontColor = UIColor.black
        addChild(scoreLabel)
    }
    
    func setupPlayer() {
        let f0 = SKTexture.init(imageNamed: "plane1")
        let f1 = SKTexture.init(imageNamed: "plane2")
        let f2 = SKTexture.init(imageNamed: "plane3")
        let f3 = SKTexture.init(imageNamed: "plane4")
        let f4 = SKTexture.init(imageNamed: "plane5")
        let f5 = SKTexture.init(imageNamed: "plane6")
        let f6 = SKTexture.init(imageNamed: "plane7")
        let f7 = SKTexture.init(imageNamed: "plane8")
        let f8 = SKTexture.init(imageNamed: "plane9")
        let f9 = SKTexture.init(imageNamed: "plane10")
        let f10 = SKTexture.init(imageNamed: "plane11")
        let f11 = SKTexture.init(imageNamed: "plane12")
        let f12 = SKTexture.init(imageNamed: "plane13")
        let f13 = SKTexture.init(imageNamed: "plane14")
        let f14 = SKTexture.init(imageNamed: "plane15")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14]
        player.position = CGPoint(x: size.width * 0.2, y: size.height * 0.5)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.05)
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
        let f0 = SKTexture.init(imageNamed: "road1")
        let f1 = SKTexture.init(imageNamed: "road2")
        let f2 = SKTexture.init(imageNamed: "road3")
        let f3 = SKTexture.init(imageNamed: "road4")
        let f4 = SKTexture.init(imageNamed: "road5")
        let f5 = SKTexture.init(imageNamed: "road6")
        let f6 = SKTexture.init(imageNamed: "road7")
        let f7 = SKTexture.init(imageNamed: "road8")
        let f8 = SKTexture.init(imageNamed: "road9")
        let f9 = SKTexture.init(imageNamed: "road10")
        let f10 = SKTexture.init(imageNamed: "road11")
        let f11 = SKTexture.init(imageNamed: "road12")
        let f12 = SKTexture.init(imageNamed: "road13")
        let f13 = SKTexture.init(imageNamed: "road14")
        let f14 = SKTexture.init(imageNamed: "road15")
        let f15 = SKTexture.init(imageNamed: "road16")
        let f16 = SKTexture.init(imageNamed: "road17")
        let f17 = SKTexture.init(imageNamed: "road18")
        let f18 = SKTexture.init(imageNamed: "road19")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18]
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = CGSize(width: size.width, height: size.height)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.04)
        background.run(SKAction.repeatForever(animation))
        addChild(background)
    }
    
    func setupCoins() {
        let coin = SKSpriteNode(imageNamed: "coin")
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
        coin.physicsBody = SKPhysicsBody(rectangleOf: coin.size)
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
        let enemy = SKSpriteNode(imageNamed: "bird1")
        let f0 = SKTexture.init(imageNamed: "bird1")
        let f1 = SKTexture.init(imageNamed: "bird2")
        let f2 = SKTexture.init(imageNamed: "bird3")
        let f3 = SKTexture.init(imageNamed: "bird4")
        let f4 = SKTexture.init(imageNamed: "bird5")
        let f5 = SKTexture.init(imageNamed: "bird6")
        let f6 = SKTexture.init(imageNamed: "bird7")
        let f7 = SKTexture.init(imageNamed: "bird8")
        let f8 = SKTexture.init(imageNamed: "bird9")
        let f9 = SKTexture.init(imageNamed: "bird10")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9]
        let actualY = random(min: enemy.size.height/2, max: size.height - enemy.size.height/2)
        enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: actualY)
        enemy.size = CGSize(width: size.width / 6, height: size.height / 4)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.04)
        enemy.run(SKAction.repeatForever(animation))
        addChild(enemy)
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: actualY),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionMoveDone]))
        //physics body of enemy
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
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


