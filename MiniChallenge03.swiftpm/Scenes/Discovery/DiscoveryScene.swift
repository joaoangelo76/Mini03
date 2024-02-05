//
//  File.swift
//
//
//  Created by João Ângelo on 08/12/23.
//

import SpriteKit
import CoreMotion

let bobDiscoveryCategory: UInt32 = 1
let invisibleCategory: UInt32 = 2

class DiscoveryScene: SKScene{
    
    var background = SKSpriteNode(imageNamed: "starSky")
    
    let bob = SKShapeNode(circleOfRadius: 30)
    
    let invisible = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
    
    var control: Bool = false
    
    let HVM = HomeViewModel()
    
    let cam = SKCameraNode()
    
    let textBoxer = SKLabelNode(text: "Discovery may be scary.")
    let textBoxer2 = SKLabelNode(text: "But it challenges us.")
    let textBoxer3 = SKLabelNode(text: "To go to new places...")
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
        self.camera = cam
        
        addBob()
        
        textBox()
        textBox2()
        textBox3()
        
        invisibleObject()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        if control == true{
            bob.position = bob.position + CGPoint(x: 3, y: 0)
        }
        cam.position = bob.position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    private func addBob(){
        bob.fillColor = .systemPurple
        bob.position = CGPoint(x: size.width/2, y: size.height/2)
        bob.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        bob.physicsBody?.affectedByGravity = false
        bob.physicsBody?.categoryBitMask = bobDiscoveryCategory
        bob.physicsBody?.collisionBitMask = 0
        bob.physicsBody?.contactTestBitMask = invisibleCategory
        
        addChild(bob)
    }
    
    private func textBox(){
        textBoxer.color = .white
        textBoxer.isPaused = false
        textBoxer.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
        
        addChild(textBoxer)
        
        let disappear = SKAction.fadeOut(withDuration: 6)
        
        textBoxer.run(disappear)
    }
    
    private func textBox2(){
        textBoxer2.color = .white
        textBoxer2.isPaused = false
        textBoxer2.position = CGPoint(x: size.width/2 + 1200, y: size.height/2 + 100)
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
        textBoxer3.position = CGPoint(x: size.width/2 + 2400, y: size.height/2 + 100)
        textBoxer3.alpha = 0
        
        addChild(textBoxer3)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 12)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        textBoxer3.run(sequence)
    }
    
    private func invisibleObject(){
        invisible.fillColor = .red
        invisible.position = CGPoint(x: size.width/2 + 3600, y: size.height/2)
        invisible.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 200))
        invisible.physicsBody?.affectedByGravity = false
        invisible.physicsBody?.categoryBitMask = invisibleCategory
        invisible.physicsBody?.collisionBitMask = 0
        invisible.physicsBody?.contactTestBitMask = bobDiscoveryCategory
        
        addChild(invisible)
    }
    
}

extension DiscoveryScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {

        print("didBegin entered for \(String(describing: contact.bodyA.node?.name)) and \(String(describing: contact.bodyB.node?.name))")

        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
             case invisibleCategory | bobDiscoveryCategory:
                print("Bob and door have contacted.")
            let newScene = LoveScene()
            newScene.size = self.size
            self.scene?.view?.presentScene(newScene)
             default:
                print("Some other contact occurred")
             }
    }

}

