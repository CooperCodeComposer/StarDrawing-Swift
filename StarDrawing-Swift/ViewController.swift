//
//  ViewController.swift
//  StarDrawing-Swift
//
//  Created by Alistair Cooper on 5/11/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    var starView: StarView?
    var skyView: UIView?
    var angle: CGFloat = 0.6

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradient()
        
        skyView = UIView.init(frame: CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        
        self.view.addSubview(skyView!)
        
        // set initial off screen position for skyView
        skyView?.transform = CGAffineTransformMakeTranslation(0.0, 2000.0)
        
        generateRandomStars()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1.7, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: [], animations: {
        self.skyView?.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
        }, completion: nil)
    }
    
    // method to add gradient to the background
    func addGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = self.view.frame
        
        // gradient colors
        let color1 = UIColor.blackColor().CGColor as CGColorRef
        let color2 = UIColor(red: 0.0, green: 0.0, blue: 128.0/255.0, alpha: 1.0).CGColor as CGColorRef
        
        gradient.colors = [color1, color2]
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
    }
    
    // method to generate random stars
    func generateRandomStars() {
        var xRandom: CGFloat
        var yRandom: CGFloat
        let width: Int = Int(UIScreen.mainScreen().bounds.size.width)
        let height: Int = Int(UIScreen.mainScreen().bounds.size.height)
        
        // generates random number from 30-100
        let randomNumberStars = GKRandomSource.sharedRandom().nextIntWithUpperBound(69) + 30
        
        for _ in 0...randomNumberStars {
            xRandom = CGFloat(GKRandomSource.sharedRandom().nextIntWithUpperBound(width))
            yRandom = CGFloat(GKRandomSource.sharedRandom().nextIntWithUpperBound(height))
            
            starView = StarView(frame: CGRectMake(xRandom, yRandom, 20.0, 20.0))
            starView!.backgroundColor = UIColor.clearColor()
            
            self.skyView?.addSubview(starView!)
            
        }
        
    }


}

