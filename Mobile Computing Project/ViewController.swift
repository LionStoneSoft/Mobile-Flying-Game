//
//  ViewController.swift
//  Mobile Computing Project
//
//  Created by Ryan Soanes on 09/11/2018.
//  Copyright © 2018 Ryan Soanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollingBackground: UIImageView!
    @IBOutlet var plane: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundScroll()
        planeAnimation()
    }
    
    func backgroundScroll() {
        let imageArray = [UIImage(named: "road1.png")!, UIImage(named: "road2.png")!, UIImage(named: "road3.png")!, UIImage(named: "road4.png")!, UIImage(named: "road5.png")!, UIImage(named: "road6.png")!, UIImage(named: "road7.png")!, UIImage(named: "road8.png")!, UIImage(named: "road9.png")!, UIImage(named: "road10.png")!, UIImage(named: "road11.png")!, UIImage(named: "road12.png")!, UIImage(named: "road13.png")!, UIImage(named: "road14.png")!, UIImage(named: "road15.png")!, UIImage(named: "road16.png")!, UIImage(named: "road17.png")!, UIImage(named: "road18.png")!, UIImage(named: "road19.png")!]
        
        scrollingBackground.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
    }
    
    func planeAnimation() {
        let imageArray = [UIImage(named: "plane1.png")!, UIImage(named: "plane2.png")!, UIImage(named: "plane3.png")!, UIImage(named: "plane4.png")!, UIImage(named: "plane5.png")!, UIImage(named: "plane6.png")!, UIImage(named: "plane7.png")!, UIImage(named: "plane8.png")!, UIImage(named: "plane9.png")!, UIImage(named: "plane10.png")!, UIImage(named: "plane11.png")!, UIImage(named: "plane12.png")!, UIImage(named: "plane13.png")!, UIImage(named: "plane14.png")!, UIImage(named: "plane15.png")!]
        
        plane.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
    }
    
}

