//
//  BeginningScene.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 06/12/23.
//

import SpriteKit
import AVFoundation

let bobCategory: UInt32 = 1
let doorCategory: UInt32 = 2

class BeginningScene: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let cam = SKCameraNode()
    
    var control: Bool = false
    
    var greyBob = SKSpriteNode(imageNamed: "greyBob")
    
    let door = SKSpriteNode(imageNamed: "doorPurple")
    
    let textBoxer = SKLabelNode(text: "In the beginning...")
    let textBoxer2 = SKLabelNode(text: "We are empty shells.")
    let textBoxer3 = SKLabelNode(text: "Ready to be filled.")
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
        grayBob()
        
        textBox()
        textBox2()
        textBox3()
        
        doorWhatever()
        
        self.camera = cam
        
        view.isPaused = false
        backgroundColor = .black
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        if control == true{
            greyBob.position = greyBob.position + CGPoint(x: 3, y: 0)
            
        }
        cam.position = greyBob.position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    private func grayBob(){
        greyBob.position = CGPoint(x: size.width/2, y: size.height/2)
        greyBob.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        greyBob.physicsBody?.affectedByGravity = false
        greyBob.physicsBody?.categoryBitMask = bobCategory
        greyBob.physicsBody?.collisionBitMask = 0
        greyBob.physicsBody?.contactTestBitMask = doorCategory
        
        addChild(greyBob)
    }
    
    private func textBox(){
        textBoxer.color = .white
        textBoxer.isPaused = false
        textBoxer.position = CGPoint(x: size.width/2, y: size.height/2 + 150)
        
        addChild(textBoxer)
        
        let disappear = SKAction.fadeOut(withDuration: 6)
        
        textBoxer.run(disappear)
    }
    
    private func textBox2(){
        textBoxer2.color = .white
        textBoxer2.isPaused = false
        textBoxer2.position = CGPoint(x: size.width/2 + 1200, y: size.height/2 + 150)
        textBoxer2.alpha = 0
        
        addChild(textBoxer2)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        textBoxer2.run(sequence)
    }
    
    private func textBox3(){
        textBoxer3.color = .white
        textBoxer3.isPaused = false
        textBoxer3.position = CGPoint(x: size.width/2 + 2400, y: size.height/2 + 150)
        textBoxer3.alpha = 0
        
        addChild(textBoxer3)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 12)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        textBoxer3.run(sequence)
    }
    
    private func doorWhatever(){
        door.position = CGPoint(x: size.width/2 + 3000, y: size.height/2)
        door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 200))
        door.physicsBody?.affectedByGravity = false
        door.physicsBody?.categoryBitMask = doorCategory
        door.physicsBody?.collisionBitMask = 0
        door.physicsBody?.contactTestBitMask = bobCategory
        
        addChild(door)
    }

}

func +(point1:CGPoint,point2:CGPoint) -> CGPoint {
    return CGPoint(x: point1.x + point2.x, y: point1.y + point2.y)
}

extension BeginningScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {

        print("didBegin entered for \(String(describing: contact.bodyA.node?.name)) and \(String(describing: contact.bodyB.node?.name))")

        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
             case doorCategory | bobCategory:
                print("Bob and door have contacted.")
            let newScene = LoveScene()
            newScene.size = self.size
            self.scene?.view?.presentScene(newScene)
             default:
                print("Some other contact occurred")
             }
    }

}
