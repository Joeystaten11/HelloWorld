//
//  Scene.swift
//  TommyAttack
//
//  Created by Joseph Staten on 7/17/17.
//  Copyright © 2017 Joseph Staten. All rights reserved.
//


import SpriteKit

class GamePlayScene: SKScene {
    
    
    var tommy = Tommy()
    var gameStarted = false;

   // var pipesHolder = SKNode()
    
    
    override func didMove(to view: SKView) {
        initialize()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tommy.swing()
       //tommy.physicsBody?.affectedByGravity = true;
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveBackGroundsAndGrounds()
        
    }
    
    func initialize(){
        createTommy()
        createBackgrounds()
        createGrounds()
        //spawnEnemy()
    }
    
    func createTommy(){
        tommy = Tommy(imageNamed: "Tommy11")
        tommy.initalize()

       tommy.position = CGPoint(x:-200, y:500)
        self.addChild(tommy)
        
    }
    
    func createBackgrounds(){
        for i in 0...2 {
            let bg = SKSpriteNode (imageNamed: "back1")
            bg.name = "BG"
            bg.zPosition = 1;
            bg.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            bg.position = CGPoint(x: CGFloat(i) * bg.size.width, y:0)
            
            
            let bg1 = SKSpriteNode (imageNamed: "back2")
            bg1.name = "BG1"
            bg1.zPosition = 0;
            bg1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            bg1.position = CGPoint(x: CGFloat(i) * bg.size.width, y:60)
            self.addChild(bg)
            self.addChild(bg1)
        }
    }
    
    func createGrounds(){
        
        for i in 0...2 {
            let ground = SKSpriteNode(imageNamed: "ground")
            ground.name = "Ground"
            ground.zPosition = 4
            ground.anchorPoint = CGPoint(x:0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y:-(self.frame.size.height/2))
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
            ground.physicsBody?.isDynamic = false
            ground.physicsBody?.affectedByGravity = false
            ground.physicsBody?.categoryBitMask = ColliderType.Ground
            
            self.addChild(ground)
            
        }
    }
    
    func moveBackGroundsAndGrounds(){
        enumerateChildNodes(withName: "BG", using: ({
            (node, error) in
            
            node.position.x -= 3
            
            if node.position.x < -(self.frame.width){
                node.position.x += self.frame.width*3
            }
            
        })  )
        
        enumerateChildNodes(withName: "BG1", using: ({
            (node, error) in
            
            node.position.x -= 1
            
            if node.position.x < -(self.frame.width){
                node.position.x += self.frame.width*3
            }
            
        })  )
        
        
        enumerateChildNodes(withName: "Ground", using: ({
            (node, error) in
            
            node.position.x -= 8.5
            
            if node.position.x < -(self.frame.width){
                node.position.x += self.frame.width*3
            }
            
        })  )
    }
    
    
//    func createPipes(){
//        pipesHolder = SKNode()
//        pipesHolder.name = "Holder"
//        
//        let pipeUp = SKSpriteNode(imageNamed: "Pipe 1")
//        let pipeDown = SKSpriteNode(imageNamed: "Pipe 1")
//        
//        
//        pipeUp.name = "Pipe"
//        pipeUp.anchorPoint = CGPoint(x:0.5, y:0.5)
//        pipeUp.position = CGPoint(x: 0, y: 850)
//        pipeUp.yScale = 1.5
//        pipeUp.zRotation = CGFloat(M_PI)
//        pipeUp.physicsBody = SKPhysicsBody(rectangleOf:  pipeUp.size)
//        pipeUp.physicsBody?.categoryBitMask = ColliderType.Pipes
//        pipeUp.physicsBody?.affectedByGravity = false
//        pipeUp.physicsBody?.isDynamic = false
//        
//        
//        
//        
//        pipeDown.name = "Pipe"
//        pipeDown.anchorPoint = CGPoint(x:0.5, y:0.5)
//        pipeDown.position = CGPoint(x: 0, y: 0)
//        pipeDown.yScale = 1.5
//        pipeDown.physicsBody = SKPhysicsBody(rectangleOf:  pipeDown.size)
//        pipeDown.physicsBody?.categoryBitMask = ColliderType.Pipes
//        pipeDown.physicsBody?.affectedByGravity = false
//        pipeDown.physicsBody?.isDynamic = false
//        
//        
//        
//        
//        pipesHolder.zPosition = 5
//        
//        pipesHolder.position.x = self.frame.width + 100
//        pipesHolder.position.y  = CGFloat.randomNumbers( firstNum: -300, secondNum: 300)
//        pipesHolder.position = CGPoint(x:300, y:-500)
//        
//        
//        
//        pipesHolder.addChild(pipeUp)
//        pipesHolder.addChild(pipeDown)
//        
//        self.addChild(pipesHolder)
//        
//        let destination = self.frame.width*2
//        
//        let move =  SKAction.moveTo(x: -destination, duration: 10)
//        let remove = SKAction.removeFromParent()
//        
//        pipesHolder.run(SKAction.sequence([move, remove]), withKey: "Move")
//        
//    }
    
//    
//    func spawnPipes(){
//        let spawn = SKAction.run({() -> Void in
//            
//            self.createPipes()
//            
//            
//        })
//        
//        let delay = SKAction.wait(forDuration: 3)
//        let sequence = SKAction.sequence([spawn, delay])
//        
//        self.run(SKAction.repeatForever(sequence), withKey: "Spawn")
//    }
    
    
}





