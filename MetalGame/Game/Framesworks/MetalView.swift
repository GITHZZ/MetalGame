//
//  MetalBase.swift
//  MetalGame
//
//  Created by 何遵祖 on 14-10-1.
//  Copyright (c) 2014年 何遵祖. All rights reserved.
//

import Metal
import UIKit
import QuartzCore

private let _SingletonMetalClass = MetalView()

class MetalView
{
    class var getInstance : MetalView
    {
        return _SingletonMetalClass
    }
    
    //基础成员变量
    var device: MTLDevice! = nil
    var currentScene: Scene! = nil
    var viewControllder: UIView! = nil
    
    //相关用户可自定义变量
    var m_pixelFormat: MTLPixelFormat! = nil
    
    init()
    {
        //创建一个能够和机子cpu的链接(用于将数据传到设备上渲染)
        device = MTLCreateSystemDefaultDevice()
    }
    
    func setAppViewDelegate(view : UIView)
    {
        viewControllder = view
    }
    
    //创建渲染场景
    func runningWithScene(s: Scene?)
    {
        assert(viewControllder != nil, "viewController not be set(using setAppDelegate)")
        assert(s != nil, "scene must be not null")
    
        currentScene = s
        currentScene.frame = viewControllder.layer.frame
        viewControllder.layer.addSublayer(currentScene)
    }
    
    func render()
    {
        currentScene.render()
    }
}