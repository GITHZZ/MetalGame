//
//  DemoScene.swift
//  MetalGame
//
//  Created by 何遵祖 on 14-10-2.
//  Copyright (c) 2014年 何遵祖. All rights reserved.
//

import Foundation

class DemoScene: Scene
{
    override init()
    {
        super.init()
        
        var test = DemoSprite()
        //self.addChild(test)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}