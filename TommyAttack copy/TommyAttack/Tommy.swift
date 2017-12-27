//
//  Tommy.swift
//  TommyAttack
//
//  Created by Joseph Staten on 7/17/17.
//  Copyright © 2017 Joseph Staten. All rights reserved.
//

import SpriteKit

struct ColliderType {
    static let Tommy: UInt32 = 1
    static let Ground: UInt32 = 2
    static let Rock: UInt32 = 3
    static let Score: UInt32 = 4
    
    
    
}


class Tommy: SKSpriteNode {
    
    func initalize() {
        // here we create animations
        
        
        
        
        self.name = "Tommy";
        self.zPosition = 3;
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2);
        self.physicsBody?.affectedByGravity = true;
        self.physicsBody?.allowsRotation = false;
        self.physicsBody?.categoryBitMask = ColliderType.Tommy   ;
        self.physicsBody?.collisionBitMask = ColliderType.Ground | ColliderType.Rock;
        self.physicsBody?.contactTestBitMask = ColliderType.Ground | ColliderType.Rock
        | ColliderType.Score;
        
    }
    
    
    
    func swing(){
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 400)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 120))
    }
    
    
}

