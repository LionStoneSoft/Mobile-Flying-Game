//
//  ViewController.swift
//  Mobile Computing Project
//
//  Created by Ryan Soanes on 09/11/2018.
//  Copyright © 2018 Ryan Soanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var enemy: UIImageView!
    @IBOutlet var scrollingBackground: UIImageView!
    @IBOutlet var plane: UIImageView!
    @IBOutlet var scoreChangeLabel: UILabel!
    var crowSpawnTimer: Timer!
    var gameScore: Int = 0
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    var currentLocation: CGPoint?
    var attachment: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        collision = UICollisionBehavior()
        animator.addBehavior(collision)
        backgroundScroll()
        planeAnimation()
        collision.addItem(plane)
        //crowSpawnTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(enemySpawn), userInfo: nil, repeats: true)
        timer()
        
    }
    
    func timer() {
        crowSpawnTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(enemySpawn), userInfo: nil, repeats: true)
    }
    
    @objc func enemySpawn() {
        let containerHeight = Int(view.bounds.height)
        //let containerWidth = Int(view.bounds.width)
        let number = Int.random(in: 75 ..< containerHeight - 75)
        
        enemy = UIImageView(frame: CGRect(x: 270, y: number, width: 75, height: 75))
        enemyAnimation()
        self.view.addSubview(enemy)
        collision.addItem(enemy)
    }
    
    func backgroundScroll() {
        let imageArray = [UIImage(named: "road1.png")!, UIImage(named: "road2.png")!, UIImage(named: "road3.png")!, UIImage(named: "road4.png")!, UIImage(named: "road5.png")!, UIImage(named: "road6.png")!, UIImage(named: "road7.png")!, UIImage(named: "road8.png")!, UIImage(named: "road9.png")!, UIImage(named: "road10.png")!, UIImage(named: "road11.png")!, UIImage(named: "road12.png")!, UIImage(named: "road13.png")!, UIImage(named: "road14.png")!, UIImage(named: "road15.png")!, UIImage(named: "road16.png")!, UIImage(named: "road17.png")!, UIImage(named: "road18.png")!, UIImage(named: "road19.png")!]
        
        scrollingBackground.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
    }
    
    func planeAnimation() {
        let imageArray = [UIImage(named: "plane1.png")!, UIImage(named: "plane2.png")!, UIImage(named: "plane3.png")!, UIImage(named: "plane4.png")!, UIImage(named: "plane5.png")!, UIImage(named: "plane6.png")!, UIImage(named: "plane7.png")!, UIImage(named: "plane8.png")!, UIImage(named: "plane9.png")!, UIImage(named: "plane10.png")!, UIImage(named: "plane11.png")!, UIImage(named: "plane12.png")!, UIImage(named: "plane13.png")!, UIImage(named: "plane14.png")!, UIImage(named: "plane15.png")!]
        
        plane.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
    }
    
    func enemyAnimation() {
        let imageArray = [UIImage(named: "bird1.png")!, UIImage(named: "bird2.png")!, UIImage(named: "bird3.png")!, UIImage(named: "bird4.png")!, UIImage(named: "bird5.png")!, UIImage(named: "bird6.png")!, UIImage(named: "bird7.png")!, UIImage(named: "bird8.png")!, UIImage(named: "bird9.png")!, UIImage(named: "bird10.png")!]
        
        enemy.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let theTouch = touches.first {
            currentLocation = theTouch.location(in: self.view)
            
            attachment = UIAttachmentBehavior(item: plane!,
                                              attachedToAnchor: currentLocation!)
            
            animator?.addBehavior(attachment!)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            
            currentLocation = theTouch.location(in: self.view)
            attachment?.anchorPoint = currentLocation!
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator?.removeBehavior(attachment!)
    }
    
    
//        @objc func enemyAnimation() {
//        let containerHeight = Int(view.bounds.height)
//        let containerWidth = Int(view.bounds.width)
//        let number = Int.random(in: 75 ..< containerHeight - 75)
//
//             //667, 375
//        let containerView = UIView(
//            frame: CGRect(x: containerWidth - containerWidth - 75, y: number, width: 0, height: 0)
//        )
//
//        enemy = UIImageView(frame: CGRect(x: containerWidth, y: number, width: 75, height: 75))
//
//        let imageArray = [UIImage(named: "bird1.png")!, UIImage(named: "bird2.png")!, UIImage(named: "bird3.png")!, UIImage(named: "bird4.png")!, UIImage(named: "bird5.png")!, UIImage(named: "bird6.png")!, UIImage(named: "bird7.png")!, UIImage(named: "bird8.png")!, UIImage(named: "bird9.png")!, UIImage(named: "bird10.png")!]
//
//
//
//        UIView.animate(withDuration: 5.0, animations: { () -> Void in
//            self.enemy.center = containerView.center
//        })
//
//        self.view.addSubview(enemy)
//
//    }
//
//    func enemyCollision() {
//        if (plane.frame.contains(enemy.frame)) {
//            print("tru")
//            gameScore = gameScore - 10
//            scoreChangeLabel.text = "Score: \(gameScore)"
//        }
//
//    }

}
