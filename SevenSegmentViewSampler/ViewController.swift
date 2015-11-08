//
//  ViewController.swift
//  SevenSegmentViewSampler
//
//  Created by Takayoshi Otake on 2015/11/08.
//  Copyright © 2015 Takayoshi Otake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    let valueMap: [Int: Int16] = [
        0:0x3f,
        1:0x06,
        2:0x5b,
        3:0x4f,
        4:0x66,
        5:0x6d,
        6:0x7d,
        7:0x07,
        8:0x7f,
        9:0x6f,
    ]
    var value: Int = 0 {
        didSet {
            if let temp_view = stackView.subviews[0] as? BBSevenSegmentView {
                temp_view.pinBits = valueMap[(value / 100) % 10]!
            }
            if let temp_view = stackView.subviews[1] as? BBSevenSegmentView {
                temp_view.pinBits = valueMap[(value / 10) % 10]! | 0x80
            }
            if let temp_view = stackView.subviews[2] as? BBSevenSegmentView {
                temp_view.pinBits = valueMap[(value / 1) % 10]!
            }
        }
    }
    
    var timer: NSTimer?
    
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: nil)
    }
    
    func applicationDidBecomeActive(notification: NSNotification) {
        start()
    }
    
    func applicationWillResignActive(notification: NSNotification) {
        stop()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        start()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        stop()
    }
    
    private func start() {
        if let timer = timer {
            if timer.valid {
                return
            }
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerDidTick:", userInfo: nil, repeats: true)
    }
    
    private func stop() {
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
    }
    
    func timerDidTick(timer: NSTimer) {
        dispatch_async(dispatch_get_main_queue()) { [weak self] () -> Void in
            if let selfVC = self {
                if (selfVC.value < 1000) {
                    selfVC.value += 1
                }
                else {
                    selfVC.value = 0
                }
            }
        }
    }

}

