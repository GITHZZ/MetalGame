//
//  ViewController.swift
//  MetalGame
//
//  Created by 何遵祖 on 14-10-1.
//  Copyright (c) 2014年 何遵祖. All rights reserved.
//

import UIKit
import Metal //添加Metal框架
import QuartzCore

class ViewController: UIViewController
{
    var timer: CADisplayLink! = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        MetalView.getInstance.setAppViewDelegate(view)
        
        MetalView.getInstance.runningWithScene(DemoScene())
        
        //启动定时器
        timer = CADisplayLink(target: self, selector: Selector("gameloop"))
        timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }
    
    func render()
    {
        MetalView.getInstance.render()
    }
    
    func gameloop()
    {
        autoreleasepool{self.render()}
    }
}