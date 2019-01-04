//
//  StartScene.swift
//  Mobile Computing Project
//
//  Created by Ryan Soanes on 04/01/2019.
//  Copyright © 2019 Ryan Soanes. All rights reserved.
//

import SpriteKit

class StartScene: SKScene {
    
    var gameScene:SKScene!
    let backgroundSound = SKAudioNode(fileNamed: "menuMusic.wav")
    let spark = SKSpriteNode(imageNamed: "tmp-0")
    
    override func didMove(to view: SKView) {
        self.addChild(backgroundSound)
        sparkBackground()
        setupTitle()
        setupText()
        
    }
    
    func setupText() {
        let startText = SKLabelNode()
        startText.text = "Tap screen to begin"
        startText.position = CGPoint(x: size.width / 2, y: size.height / 5)
        addChild(startText)
    }
    
    func setupTitle() {
        let phoenixTitle = SKSpriteNode(imageNamed: "Phoenix")
        phoenixTitle.position = CGPoint(x: size.width / 2, y: size.height / 2)
        phoenixTitle.size = CGSize(width: size.width - 75, height: size.height / 3)
        addChild(phoenixTitle)
    }
    
    func sparkBackground() {
        let f0 = SKTexture.init(imageNamed: "tmp-0")
        let f1 = SKTexture.init(imageNamed: "tmp-1")
        let f2 = SKTexture.init(imageNamed: "tmp-2")
        let f3 = SKTexture.init(imageNamed: "tmp-3")
        let f4 = SKTexture.init(imageNamed: "tmp-4")
        let f5 = SKTexture.init(imageNamed: "tmp-5")
        let f6 = SKTexture.init(imageNamed: "tmp-6")
        let f7 = SKTexture.init(imageNamed: "tmp-7")
        let f8 = SKTexture.init(imageNamed: "tmp-8")
        let f9 = SKTexture.init(imageNamed: "tmp-9")
        let f10 = SKTexture.init(imageNamed: "tmp-10")
        let f11 = SKTexture.init(imageNamed: "tmp-11")
        let f12 = SKTexture.init(imageNamed: "tmp-12")
        let f13 = SKTexture.init(imageNamed: "tmp-13")
        let f14 = SKTexture.init(imageNamed: "tmp-14")
        let f15 = SKTexture.init(imageNamed: "tmp-15")
        let f16 = SKTexture.init(imageNamed: "tmp-16")
        let f17 = SKTexture.init(imageNamed: "tmp-17")
        let f18 = SKTexture.init(imageNamed: "tmp-18")
        let f19 = SKTexture.init(imageNamed: "tmp-19")
        let f20 = SKTexture.init(imageNamed: "tmp-20")
        let f21 = SKTexture.init(imageNamed: "tmp-21")
        let f22 = SKTexture.init(imageNamed: "tmp-22")
        let f23 = SKTexture.init(imageNamed: "tmp-23")
        let f24 = SKTexture.init(imageNamed: "tmp-24")
        let f25 = SKTexture.init(imageNamed: "tmp-25")
        let f26 = SKTexture.init(imageNamed: "tmp-26")
        let f27 = SKTexture.init(imageNamed: "tmp-27")
        let f28 = SKTexture.init(imageNamed: "tmp-28")
        let f29 = SKTexture.init(imageNamed: "tmp-29")
        let f30 = SKTexture.init(imageNamed: "tmp-30")
        let f31 = SKTexture.init(imageNamed: "tmp-31")
        let f32 = SKTexture.init(imageNamed: "tmp-32")
        let f33 = SKTexture.init(imageNamed: "tmp-33")
        let f34 = SKTexture.init(imageNamed: "tmp-34")
        let f35 = SKTexture.init(imageNamed: "tmp-35")
        let f36 = SKTexture.init(imageNamed: "tmp-36")
        let f37 = SKTexture.init(imageNamed: "tmp-37")
        let f38 = SKTexture.init(imageNamed: "tmp-38")
        let f39 = SKTexture.init(imageNamed: "tmp-39")
        let f40 = SKTexture.init(imageNamed: "tmp-40")
        let f41 = SKTexture.init(imageNamed: "tmp-41")
        let f42 = SKTexture.init(imageNamed: "tmp-42")
        let f43 = SKTexture.init(imageNamed: "tmp-43")
        let f44 = SKTexture.init(imageNamed: "tmp-44")
        let f45 = SKTexture.init(imageNamed: "tmp-45")
        let f46 = SKTexture.init(imageNamed: "tmp-46")
        let f47 = SKTexture.init(imageNamed: "tmp-47")
        let f48 = SKTexture.init(imageNamed: "tmp-48")
        let f49 = SKTexture.init(imageNamed: "tmp-49")
        let f50 = SKTexture.init(imageNamed: "tmp-50")
        let f51 = SKTexture.init(imageNamed: "tmp-51")
        let f52 = SKTexture.init(imageNamed: "tmp-52")
        let f53 = SKTexture.init(imageNamed: "tmp-53")
        let f54 = SKTexture.init(imageNamed: "tmp-54")
        let f55 = SKTexture.init(imageNamed: "tmp-55")
        let f56 = SKTexture.init(imageNamed: "tmp-56")
        let f57 = SKTexture.init(imageNamed: "tmp-57")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, f41, f42, f43, f44, f45, f46, f47, f48, f49, f50, f51, f52, f53, f54, f55, f56, f57]
        spark.position = CGPoint(x: size.width / 2, y: size.height / 2)
        spark.size = CGSize(width: size.width, height: size.height)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.09)
        spark.run(SKAction.repeatForever(animation))
        addChild(spark)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == spark {
                if view != nil {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    gameScene = SKScene(fileNamed: "GameScene")
                    backgroundSound.run(SKAction.stop())
                    gameScene.scaleMode = .aspectFit
                    self.view?.presentScene(gameScene, transition: transition)
                }
            }
        }
    }
}
