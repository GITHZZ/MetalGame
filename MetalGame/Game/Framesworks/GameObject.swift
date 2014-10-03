//
//  GameObject.swift
//  MetalGame
//
//  Created by 何遵祖 on 14-10-2.
//  Copyright (c) 2014年 何遵祖. All rights reserved.
//

import Foundation
import Metal

class GameObject : NSObject
{
    var position: Vector3! = Vector3(x: 0, y: 0, z: 0)
    var rotation: Vector3! = Vector3(x: 0, y: 0, z: 0)
    var scale: Vector3! = Vector3(x: 1, y: 1, z: 1)
    
    var vertexBuffer: MTLBuffer! = nil
    
    var pipelineState: MTLRenderPipelineState! = nil
    var s_fragmtent: String! = nil
    var s_vertex: String! = nil
    
    var device: MTLDevice! = nil
    
    override init()
    {
        super.init()
        
        self.device = MetalView.getInstance.device
        
        self.readShadersFunction("basic_fragment", vertex: "basic_vertex")
    }
    
    //链接shader文件和方法(渲染球)
    func readShadersFunction(fragment: String, vertex: String)
    {
        let defaultLibrary = device.newDefaultLibrary()
        let fragmentProgram = defaultLibrary?.newFunctionWithName(fragment)
        let vertexProgram = defaultLibrary?.newFunctionWithName(vertex)
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments.objectAtIndexedSubscript(0).pixelFormat = .BGRA8Unorm
        
        var pipelineError : NSError?
        pipelineState = device.newRenderPipelineStateWithDescriptor(pipelineStateDescriptor, error: &pipelineError)
        if (pipelineState == nil)
        {
            println("Failed to create pipeline state, error \(pipelineError)")
        }
    }

    func addComponent(c: Component)
    {
    }
    
    func render()
    {
        
    }
}