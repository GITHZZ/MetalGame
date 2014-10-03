//
//  Sprite.swift
//  MetalGame
//
//  Created by 何遵祖 on 14-10-2.
//  Copyright (c) 2014年 何遵祖. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

//三角形顶点数据(中心点为(X:0,Y:0,Z:0))就是世界坐标
private let vertexData:[Float] =
[
    0.0, 0.5, 0.0,
    -0.5, -0.5, 0.0,
    0.5, -0.5, 0.0
]

class Sprite: GameObject
{
    override init()
    {
        super.init()
        
        //获取vertexData中数据的字节大小
        //理论上是使用sizeofValue技术出一个元素所占的字节乘上数组个数即可
        let dataSize = vertexData.count * sizeofValue(vertexData[0])
        //通过字节来从GPU中申请内存传输数据
        vertexBuffer = device.newBufferWithBytes(vertexData, length: dataSize, options: nil)
    }
    
    override func addComponent(c: Component)
    {
        
    }
}