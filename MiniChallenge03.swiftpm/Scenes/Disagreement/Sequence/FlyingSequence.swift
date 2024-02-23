//
//  File.swift
//
//
//  Created by João Ângelo on 08/12/23.
//

import SpriteKit
import CoreMotion

let bobFlyingCategory: UInt32 = 1
let invisibleFlyingCategory: UInt32 = 2

class FlyingSequence: SKScene{
    
    var controlContact = false
    
    let dad = SKSpriteNode(imageNamed: "Dad")
    
    let bob = SKSpriteNode(imageNamed: "purpleBob")
    
    var countTaps = 0
    
    var control: Bool = false
    
    let HVM = HomeViewModel()
    
    let cam = SKCameraNode()
    
    let invisible = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
    
    let textBoxer = SKLabelNode(text: "However, even though there are conflicts.")
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        backgroundColor = .black
        
        self.camera = cam
        
        addDad()
        
        addBob()
        
        invisibleObject()
        
        textBox()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = true
        if(dad.position == CGPoint(x: size.width/2 + 1300, y: size.height/2)){
            control = false
        }
        if controlContact == true{
            repeat{
                countTaps+=1
                if(countTaps==1){
                    print("first touch")
                    loveBalloonDad()
                }
                if(countTaps==2){
                    print("second touch")
                    loveBalloonBob()
                }
                if(countTaps==3){
                    let newScene = DiscoverySceneFinal()
                    newScene.size = self.size
                    self.scene?.view?.presentScene(newScene, transition: .fade(withDuration: 3))
                }
            }while(touches.first!.tapCount < 1)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if control == true{
            dad.position = dad.position + CGPoint(x: 3, y: 0)
        }
        if controlContact == true{
            control = false
        }
        cam.position = dad.position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2, y: size.height/2)
        dad.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        dad.physicsBody?.affectedByGravity = false
        dad.physicsBody?.categoryBitMask = bobFlyingCategory
        dad.physicsBody?.collisionBitMask = 0
        dad.physicsBody?.contactTestBitMask = invisibleFlyingCategory
        
        addChild(dad)
    }
    
    private func addBob(){
        bob.position = CGPoint(x: size.width/2 + 1500, y: size.height/2)

        addChild(bob)
    }
    
    private func textBox(){
        textBoxer.color = .white
        textBoxer.isPaused = false
        textBoxer.position = CGPoint(x: size.width/2, y: size.height/2 + 150)
        
        addChild(textBoxer)
        
        let disappear = SKAction.fadeOut(withDuration: 6)
        
        textBoxer.run(disappear)
    }
    
    private func loveBalloonDad(){
        let loveBalloon = SKSpriteNode(imageNamed: "loveBalloon")
        loveBalloon.position = CGPoint(x: size.width/2 + 1400, y: size.height/2 + 300)
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        
        
        addChild(loveBalloon)
        
        loveBalloon.run(sequence)
    }
    
    private func loveBalloonBob(){
        let loveBalloon2 = SKSpriteNode(imageNamed: "loveBalloon")
        loveBalloon2.position = CGPoint(x: size.width/2 + 1400, y: size.height/2 + 300)
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        
        
        addChild(loveBalloon2)
        
        loveBalloon2.run(sequence)
    }
    
    private func invisibleObject(){
        invisible.isHidden = true
        invisible.position = CGPoint(x: size.width/2 + 1300, y: size.height/2)
        invisible.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 200))
        invisible.physicsBody?.affectedByGravity = false
        invisible.physicsBody?.categoryBitMask = invisibleFlyingCategory
        invisible.physicsBody?.collisionBitMask = 0
        invisible.physicsBody?.contactTestBitMask = bobFlyingCategory
        
        addChild(invisible)
    }
    
}

extension FlyingSequence: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {

        print("didBegin entered for \(String(describing: contact.bodyA.node?.name)) and \(String(describing: contact.bodyB.node?.name))")

        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
             case invisibleFlyingCategory | bobFlyingCategory:
                print("Bob and door have contacted.")
            let newScene = ReconciliationSceneFinal()
            newScene.size = self.size
            self.scene?.view?.presentScene(newScene)
            controlContact = true
             default:
                print("Some other contact occurred")
             }
    }

}
