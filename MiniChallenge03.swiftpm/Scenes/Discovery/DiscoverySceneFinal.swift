//
//  File.swift
//  
//
//  Created by João Ângelo on 27/12/23.
//

import SpriteKit

let bobDiscoveryFinalCategory: UInt32 = 1
let doorDiscoveryFinalCategory: UInt32 = 2

class DiscoverySceneFinal: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let bob = SKSpriteNode(imageNamed: "purpleBob")
    
    let textBoxer = SKLabelNode(text: "Our discovery comes...")
    let textBoxer2 = SKLabelNode(text: "But not without a cost.")
    
    var countTaps = 0
    
    var control: Bool = false
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
        self.physicsWorld.contactDelegate = self
        
        backgroundColor = .black
        
        addBob()
        
        textBox()
        textBox2()
        
        door()
        
        self.camera = cam
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        cam.position = bob.position
        if control == true{
            bob.position = bob.position + CGPoint(x: 3, y: 0)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    func addBob(){
        bob.position = CGPoint(x: size.width/2 - 200, y: size.height/2)
        bob.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        bob.physicsBody?.affectedByGravity = false
        bob.physicsBody?.categoryBitMask = bobLoveCategory
        bob.physicsBody?.collisionBitMask = 0
        bob.physicsBody?.contactTestBitMask = doorLoveCategory
        
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
    
    private func door(){
        let door = SKSpriteNode(imageNamed: "doorRed")
        door.position = CGPoint(x: size.width/2 + 1800, y: size.height/2 + 50)
        door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 200))
        door.physicsBody?.affectedByGravity = false
        door.physicsBody?.categoryBitMask = doorLoveCategory
        door.physicsBody?.collisionBitMask = 0
        door.physicsBody?.contactTestBitMask = bobLoveCategory
        
        addChild(door)
    }
}

extension DiscoverySceneFinal: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {

        print("didBegin entered for \(String(describing: contact.bodyA.node?.name)) and \(String(describing: contact.bodyB.node?.name))")

        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
             case doorDiscoveryFinalCategory | bobDiscoveryFinalCategory:
                print("Bob and door have contacted.")
            let newScene = DisagreementScene()
            newScene.size = self.size
            self.scene?.view?.presentScene(newScene)
             default:
                print("Some other contact occurred")
             }
    }
    
}
