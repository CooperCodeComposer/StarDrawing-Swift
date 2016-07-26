//
//  StarView.swift
//  StarDrawing-Swift
//
//  Created by Alistair Cooper on 5/11/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit
import QuartzCore

class StarView: UIView {
    
    func drawStarWithFrame(frame: CGRect, starColor: UIColor, rotation: CGFloat) {
        
        // General declarations
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        
        // Draw star
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, CGRectGetMinX(frame) + 11.12, CGRectGetMinY(frame) + 9.62)
        CGContextRotateCTM(context, -rotation * (CGFloat(M_PI) / 180))
        
        let starPath = UIBezierPath()
        starPath.moveToPoint(CGPointMake(0, -9.38))
        starPath.addLineToPoint(CGPointMake(2.5, -3.26))
        starPath.addLineToPoint(CGPointMake(9.39, -2.9))
        starPath.addLineToPoint(CGPointMake(4.04, 1.25))
        starPath.addLineToPoint(CGPointMake(5.8, 7.58))
        starPath.addLineToPoint(CGPointMake(0, 4.03))
        starPath.addLineToPoint(CGPointMake(-5.8, 7.58))
        starPath.addLineToPoint(CGPointMake(-4.04, 1.25))
        starPath.addLineToPoint(CGPointMake(-9.39, -2.9))
        starPath.addLineToPoint(CGPointMake(-2.5, -3.26))

        starPath.closePath()
        starColor.setFill()
        starPath.fill()
        
        CGContextRestoreGState(context);
    }
    
    override func drawRect(rect: CGRect) {
        
        self.drawStarWithFrame(CGRectMake(0.0, 0.0, 70.0, 70.0), starColor: UIColor.yellowColor(), rotation: 0.6)
        
    }
    
    // method to make stars bounce when touched
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let currentX: CGFloat = self.layer.position.x;
        let currentY: CGFloat = self.layer.position.y;
        
        
        // create a CGPath with arcs
        let thePath: CGMutablePathRef = CGPathCreateMutable();
        
        CGPathMoveToPoint(thePath, nil, currentX, currentY)
        
        CGPathAddLineToPoint(thePath, nil, currentX, (currentY - 40.0))
        CGPathAddLineToPoint(thePath, nil, currentX, currentY)
        CGPathAddLineToPoint(thePath, nil, currentX, (currentY - 30.0))
        CGPathAddLineToPoint(thePath, nil, currentX, currentY)
        CGPathAddLineToPoint(thePath, nil, currentX, (currentY - 20.0))
        CGPathAddLineToPoint(thePath, nil, currentX, currentY)
        CGPathAddLineToPoint(thePath, nil, currentX, (currentY - 10.0))
        CGPathAddLineToPoint(thePath, nil, currentX, currentY)
        CGPathAddLineToPoint(thePath, nil, currentX, (currentY - 5.0))
        CGPathAddLineToPoint(thePath, nil, currentX, currentY)
        
        var theAnimation = CAKeyframeAnimation()
        
        // create the animation object
        theAnimation = CAKeyframeAnimation(keyPath: "position")
        theAnimation.path = thePath;
        theAnimation.duration = 1.8;
        
        // add the animation to the layer
        self.layer.addAnimation(theAnimation, forKey: "position")

    }

}
