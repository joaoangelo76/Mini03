//
//  LoveScene.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 23/11/23.
//

import SpriteKit

let bobLoveCategory: UInt32 = 1
let doorLoveCategory: UInt32 = 2

class LoveScene: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let bob = SKSpriteNode(imageNamed: "purpleBobHappy")
    let dad = SKSpriteNode(imageNamed: "DadHappyRight")
    let mom = SKSpriteNode(imageNamed: "MomHappyLeft")
    
    let cam = SKCameraNode()
    
    var control: Bool = false
    
    var countTaps = 0
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
        self.physicsWorld.contactDelegate = self
        
        backgroundColor = .black
        
        self.camera = cam
        
        addBob()
        addDad()
        addMom()
        
        door()
        
        cam.position = bob.position
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        repeat{
            countTaps+=1
            if(countTaps==1){
                loveBalloon()
            }
            if(countTaps==2){
                addTextBox()
            }
            if(countTaps==3){
                dad.removeFromParent()
                mom.removeFromParent()
                addTextBox2()
            }
            if(countTaps>=4){
                addTextBox3()
                control = true
            }
        }while(touches.first!.tapCount < 1)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if control == true{
            bob.position = bob.position + CGPoint(x: 3, y: 0)
        }
        if(countTaps>=4){
            cam.position = bob.position
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    func addBob(){
        bob.position = CGPoint(x: size.width/2, y: size.height/2)
        bob.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        bob.physicsBody?.affectedByGravity = false
        bob.physicsBody?.categoryBitMask = bobLoveCategory
        bob.physicsBody?.collisionBitMask = 0
        bob.physicsBody?.contactTestBitMask = doorLoveCategory
        
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 - 320, y: size.height/2 + 100)
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 + 300, y: size.height/2 + 90)
        addChild(mom)
    }
    
    func loveBalloon(){
        let loveBalloon = SKSpriteNode(imageNamed: "loveBalloon")
        loveBalloon.position = CGPoint(x: size.width/2, y: size.height/2 + 260)
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        
        
        addChild(loveBalloon)
        
        loveBalloon.run(sequence)
    }
    
    func addTextBox(){
        let textBoxer = SKLabelNode(text: "We are loved.")
        textBoxer.fontColor = .white
        textBoxer.position = CGPoint(x: size.width/2, y: size.height/2 + 150)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer)
        
        textBoxer.run(sequence)
    }
    
    func addTextBox2(){
        let textBoxer2 = SKLabelNode(text: "But the time comes.")
        textBoxer2.fontColor = .white
        textBoxer2.position = CGPoint(x: size.width/2 + 1200, y: size.height/2 + 150)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 12)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer2)
        
        textBoxer2.run(sequence)
    }
    
    func addTextBox3(){
        let textBoxer3 = SKLabelNode(text: "For us to discover ourselves.")
        textBoxer3.fontColor = .white
        textBoxer3.position = CGPoint(x: size.width/2 + 2400, y: size.height/2 + 150)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 12)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer3)
        
        textBoxer3.run(sequence)
    }
    
    private func door(){
        let door = SKSpriteNode(imageNamed: "doorBlue")
        door.position = CGPoint(x: size.width/2 + 3000, y: size.height/2)
        door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 200))
        door.physicsBody?.affectedByGravity = false
        door.physicsBody?.categoryBitMask = doorLoveCategory
        door.physicsBody?.collisionBitMask = 0
        door.physicsBody?.contactTestBitMask = bobLoveCategory
        
        addChild(door)
    }
}

extension LoveScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {

        print("didBegin entered for \(String(describing: contact.bodyA.node?.name)) and \(String(describing: contact.bodyB.node?.name))")

        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
             case doorLoveCategory | bobLoveCategory:
                print("Bob and door have contacted.")
            let newScene = DiscoveryScene()
            newScene.size = self.size
            self.scene?.view?.presentScene(newScene)
             default:
                print("Some other contact occurred")
             }
    }
    
}
