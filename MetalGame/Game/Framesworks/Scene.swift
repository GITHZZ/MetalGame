//
//  Scene.swift
//  MetalGame
//
//  Created by 何遵祖 on 14-10-2.
//  Copyright (c) 2014年 何遵祖. All rights reserved.
//

import Foundation
import Metal
import QuartzCore

class Scene : CAMetalLayer
{
    var commandQueue: MTLCommandQueue! = nil
    //元素对象管理数组
    var objManager = [GameObject]()
    
    override init()
    {
        super.init()
        
        self.device = MetalView.getInstance.device
        self.pixelFormat = .BGRA8Unorm
        self.framebufferOnly = true
        self.commandQueue = device.newCommandQueue()
    }
    
    deinit
    {
        objManager.removeAll(keepCapacity: false)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addChild(child: GameObject?)
    {
        assert(child != nil, "child must be not nil!")
        objManager.append(child!)
    }
    
    func render()
    {
        var drawable = self.nextDrawable()
        
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).texture = drawable.texture
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).loadAction = .Clear
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).clearColor = MTLClearColorMake(0.0, 104.0/255.0, 5.0/255.0, 1.0)
        
        let commandBuffer = commandQueue.commandBuffer()
        let renderEncoder = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor)
        
        for obj in objManager
        {
            renderEncoder?.setRenderPipelineState(obj.pipelineState)
            renderEncoder?.setVertexBuffer(obj.vertexBuffer, offset: 0, atIndex: 0)
            renderEncoder?.drawPrimitives(.Triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        }
        
        renderEncoder?.endEncoding()
        
        commandBuffer.presentDrawable(drawable)
        commandBuffer.commit()
        
    }
}
