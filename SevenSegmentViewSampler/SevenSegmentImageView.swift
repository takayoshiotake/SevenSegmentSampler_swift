//
//  SevenSegmentImageView.swift
//  SevenSegmentViewSampler
//
//  Created by Takayoshi Otake on 2015/11/08.
//  Copyright © 2015 Takayoshi Otake. All rights reserved.
//

import UIKit

@IBDesignable
class SevenSegmentImageView: SevenSegmentView {
    private static var contentSize: CGSize!
    private static var contents: [Pins: UIImage]!
    
    private static var staticInitOnce = dispatch_once_t();
    private class func staticInit() {
        dispatch_once(&SevenSegmentImageView.staticInitOnce) { () -> Void in
            contentSize = CGSizeMake(24, 40)
            
            var temp_contents: [Pins: UIImage] = [:]
            if let image = UIImage(named: "seven_segment_pin_a")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.A] = image
            }
            if let image = UIImage(named: "seven_segment_pin_b")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.B] = image
            }
            if let image = UIImage(named: "seven_segment_pin_c")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.C] = image
            }
            if let image = UIImage(named: "seven_segment_pin_d")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.D] = image
            }
            if let image = UIImage(named: "seven_segment_pin_e")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.E] = image
            }
            if let image = UIImage(named: "seven_segment_pin_f")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.F] = image
            }
            if let image = UIImage(named: "seven_segment_pin_g")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.G] = image
            }
            if let image = UIImage(named: "seven_segment_pin_dp")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.DP] = image
            }
            if let image = UIImage(named: "seven_segment_pin_qm")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate) {
                temp_contents[Pins.QM] = image
            }
            contents = temp_contents
        }
    }
    
    // MARK: -
    
    required init?(coder aDecoder: NSCoder) {
        SevenSegmentImageView.staticInit()
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        SevenSegmentImageView.staticInit()
        super.init(frame: frame)
    }
    
    // MARK: -
    
    override func intrinsicContentSize() -> CGSize {
        return SevenSegmentImageView.contentSize!
    }

    override func drawRect(rect: CGRect) {
        let switchesOnPins = self.switchesOnPins
        
        onColor?.setFill()
        for pin in Pins.Values {
            if switchesOnPins[pin]! {
                SevenSegmentImageView.contents[pin]?.drawAtPoint(CGPointZero)
            }
        }
        
        offColor?.setFill()
        for pin in Pins.Values {
            if !switchesOnPins[pin]! {
                SevenSegmentImageView.contents[pin]?.drawAtPoint(CGPointZero)
            }
        }
    }

}
