//
//  BBSevenSegmentDrawingView.swift
//  SevenSegmentViewSampler
//
//  Created by Takayoshi Otake on 2015/11/08.
//  Copyright © 2015 Takayoshi Otake. All rights reserved.
//

import UIKit

@IBDesignable
class BBSevenSegmentDrawingView: BBSevenSegmentView {
    private static var contentSize: CGSize!
    private static var contents: [Pins: UIBezierPath]!
    
    private static var staticInitOnce = dispatch_once_t();
    private class func staticInit() {
        dispatch_once(&BBSevenSegmentDrawingView.staticInitOnce) { () -> Void in
            contentSize = CGSizeMake(24, 40)
            
            var temp_contents: [Pins: UIBezierPath] = [:]
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(7.8, 0))
                path.addLineToPoint(CGPointMake(6.33, 1.65))
                path.addLineToPoint(CGPointMake(7.51, 3.27))
                path.addLineToPoint(CGPointMake(19.2, 3.27))
                path.addLineToPoint(CGPointMake(20.67, 1.62))
                path.addLineToPoint(CGPointMake(19.49, 0))
                path.addLineToPoint(CGPointMake(7.8, 0))
                path.closePath()
                temp_contents[Pins.A] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(20.98, 2.05))
                path.addLineToPoint(CGPointMake(19.31, 3.93))
                path.addLineToPoint(CGPointMake(18.18, 17.91))
                path.addLineToPoint(CGPointMake(19.52, 19.75))
                path.addLineToPoint(CGPointMake(21.19, 17.88))
                path.addLineToPoint(CGPointMake(22.32, 3.89))
                path.addLineToPoint(CGPointMake(20.98, 2.05))
                path.closePath()
                temp_contents[Pins.B] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(19.48, 20.58))
                path.addLineToPoint(CGPointMake(17.81, 22.46))
                path.addLineToPoint(CGPointMake(16.68, 36.44))
                path.addLineToPoint(CGPointMake(18.02, 38.29))
                path.addLineToPoint(CGPointMake(19.69, 36.41))
                path.addLineToPoint(CGPointMake(20.82, 22.42))
                path.addLineToPoint(CGPointMake(19.48, 20.58))
                path.closePath()
                temp_contents[Pins.C] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(4.8, 37.06))
                path.addLineToPoint(CGPointMake(3.33, 38.72))
                path.addLineToPoint(CGPointMake(4.51, 40.33))
                path.addLineToPoint(CGPointMake(16.2, 40.33))
                path.addLineToPoint(CGPointMake(17.67, 38.68))
                path.addLineToPoint(CGPointMake(16.49, 37.06))
                path.addLineToPoint(CGPointMake(4.8, 37.06))
                path.closePath()
                temp_contents[Pins.D] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(4.48, 20.58))
                path.addLineToPoint(CGPointMake(2.81, 22.46))
                path.addLineToPoint(CGPointMake(1.68, 36.44))
                path.addLineToPoint(CGPointMake(3.02, 38.29))
                path.addLineToPoint(CGPointMake(4.69, 36.41))
                path.addLineToPoint(CGPointMake(5.82, 22.42))
                path.addLineToPoint(CGPointMake(4.48, 20.58))
                path.closePath()
                temp_contents[Pins.E] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(5.98, 2.05))
                path.addLineToPoint(CGPointMake(4.31, 3.93))
                path.addLineToPoint(CGPointMake(3.18, 17.91))
                path.addLineToPoint(CGPointMake(4.52, 19.75))
                path.addLineToPoint(CGPointMake(6.19, 17.88))
                path.addLineToPoint(CGPointMake(7.32, 3.89))
                path.addLineToPoint(CGPointMake(5.98, 2.05))
                path.closePath()
                temp_contents[Pins.F] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(6.3, 18.53))
                path.addLineToPoint(CGPointMake(4.83, 20.19))
                path.addLineToPoint(CGPointMake(6.01, 21.8))
                path.addLineToPoint(CGPointMake(17.7, 21.8))
                path.addLineToPoint(CGPointMake(19.17, 20.15))
                path.addLineToPoint(CGPointMake(17.99, 18.53))
                path.addLineToPoint(CGPointMake(6.3, 18.53))
                path.closePath()
                temp_contents[Pins.G] = path
            }
            do {
                let path = UIBezierPath(ovalInRect: CGRectMake(21, 37, 3, 3))
                temp_contents[Pins.DP] = path
            }
            do {
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(1.5, 0))
                path.addLineToPoint(CGPointMake(1.5, 0))
                path.addCurveToPoint(CGPointMake(0, 1.64), controlPoint1: CGPointMake(0.67, 0), controlPoint2: CGPointMake(0, 0.73))
                path.addLineToPoint(CGPointMake(0, 1.63))
                path.addCurveToPoint(CGPointMake(1.37, 3.26), controlPoint1: CGPointMake(0, 2.48), controlPoint2: CGPointMake(0.59, 3.19))
                path.addCurveToPoint(CGPointMake(1.32, 3.98), controlPoint1: CGPointMake(1.37, 3.5), controlPoint2: CGPointMake(1.35, 3.74))
                path.addCurveToPoint(CGPointMake(1.18, 4.67), controlPoint1: CGPointMake(1.29, 4.21), controlPoint2: CGPointMake(1.24, 4.44))
                path.addCurveToPoint(CGPointMake(0.95, 5.33), controlPoint1: CGPointMake(1.12, 4.89), controlPoint2: CGPointMake(1.04, 5.11))
                path.addCurveToPoint(CGPointMake(0.63, 5.95), controlPoint1: CGPointMake(0.85, 5.54), controlPoint2: CGPointMake(0.75, 5.75))
                path.addCurveToPoint(CGPointMake(1.61, 5.17), controlPoint1: CGPointMake(0.99, 5.74), controlPoint2: CGPointMake(1.32, 5.47))
                path.addCurveToPoint(CGPointMake(2.36, 4.15), controlPoint1: CGPointMake(1.9, 4.87), controlPoint2: CGPointMake(2.16, 4.52))
                path.addCurveToPoint(CGPointMake(2.83, 2.95), controlPoint1: CGPointMake(2.57, 3.78), controlPoint2: CGPointMake(2.73, 3.37))
                path.addCurveToPoint(CGPointMake(2.99, 1.83), controlPoint1: CGPointMake(2.93, 2.59), controlPoint2: CGPointMake(2.97, 2.21))
                path.addLineToPoint(CGPointMake(2.99, 1.82))
                path.addCurveToPoint(CGPointMake(3, 1.62), controlPoint1: CGPointMake(3, 1.75), controlPoint2: CGPointMake(3, 1.69))
                path.addLineToPoint(CGPointMake(3, 1.64))
                path.addCurveToPoint(CGPointMake(1.5, 0), controlPoint1: CGPointMake(3, 0.73), controlPoint2: CGPointMake(2.33, 0))
                path.closePath()
                temp_contents[Pins.QM] = path
            }
            contents = temp_contents
        }
    }
    
    // MARK: -
    
    required init?(coder aDecoder: NSCoder) {
        BBSevenSegmentDrawingView.staticInit()
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        BBSevenSegmentDrawingView.staticInit()
        super.init(frame: frame)
    }
    
    // MARK: -
    
    override func intrinsicContentSize() -> CGSize {
        return BBSevenSegmentDrawingView.contentSize!
    }
    
    override func drawRect(rect: CGRect) {
        let switchesOnPins = self.switchesOnPins
        
        let ctx = UIGraphicsGetCurrentContext()
        CGContextConcatCTM(ctx, CGAffineTransformMakeScale(bounds.width / BBSevenSegmentDrawingView.contentSize.width, bounds.height / BBSevenSegmentDrawingView.contentSize.height))
        
        onColor?.setFill()
        for pin in Pins.Values {
            if switchesOnPins[pin]! {
                BBSevenSegmentDrawingView.contents[pin]?.fill()
            }
        }
        
        offColor?.setFill()
        for pin in Pins.Values {
            if !switchesOnPins[pin]! {
                BBSevenSegmentDrawingView.contents[pin]?.fill()
            }
        }
    }
    
}
