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
    
    var controlContact = false
    
    var controlAppear = false
    
    var background = SKSpriteNode(imageNamed: "starSky")
    
    let magicHat = SKSpriteNode(imageNamed: "magicHat")
    
    let bob = SKSpriteNode(imageNamed: "purpleBob")
    
    let friendOne = SKSpriteNode(imageNamed: "Star")
    let friendTwo = SKSpriteNode(imageNamed: "Star")
    let friendThree = SKSpriteNode(imageNamed: "Star")
    let friendFour = SKSpriteNode(imageNamed: "Star")
    
    let invisible = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
    
    var control: Bool = false
    
    let HVM = HomeViewModel()
    
    var countTaps = 0
    
    let cam = SKCameraNode()
    
    let textBoxer = SKLabelNode(text: "Discovery may be scary.")
    let textBoxer2 = SKLabelNode(text: "But it challenges us.")
    let textBoxer3 = SKLabelNode(text: "To go to new places...")
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
        self.camera = cam
        
        addBob()
        
        textBox()
        textBox2()
        textBox3()
        
        invisibleObject()
        
        SKAction.fadeAlpha(to: 0, duration: 4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if controlContact == true{
            repeat{
                countTaps+=1
                if(countTaps==1){
                    print("first touch")
                }
                if(countTaps==2){
                    print("second touch")
                    addFourFriends()
                    addMagicHat()
                }
                if(countTaps==3){
                    let newScene = DiscoverySceneFinal()
                    newScene.size = self.size
                    self.scene?.view?.presentScene(newScene, transition: .fade(withDuration: 3))
                }
            }while(touches.first!.tapCount < 1)
        }
        control = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        if control == true{
            bob.position = bob.position + CGPoint(x: 3, y: 0)
        }
        if controlContact == true{
            control = false
        }
        cam.position = bob.position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    private func addMagicHat(){
        magicHat.position = CGPoint(x: size.width/2 + 3430, y: size.height/2 - 30)
        magicHat.alpha = 0
        
        addChild(magicHat)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        
         magicHat.run(appear)
    }
    
    private func addBob(){
        bob.position = CGPoint(x: size.width/2, y: size.height/2)
        bob.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        bob.physicsBody?.affectedByGravity = false
        bob.physicsBody?.categoryBitMask = bobDiscoveryCategory
        bob.physicsBody?.collisionBitMask = 0
        bob.physicsBody?.contactTestBitMask = invisibleCategory
        
        addChild(bob)
    }
    
    private func addFourFriends(){
        friendOne.position = CGPoint(x: size.width/2 + 3450, y: size.height/2 + 200)
        friendOne.isPaused = false
        friendOne.alpha = 0
        
        friendTwo.position = CGPoint(x: size.width/2 + 3700, y: size.height/2)
        friendTwo.isPaused = false
        friendTwo.alpha = 0
        
        friendThree.position = CGPoint(x: size.width/2 + 3200, y: size.height/2)
        friendThree.isPaused = false
        friendThree.alpha = 0
        
        friendFour.position = CGPoint(x: size.width/2 + 3450, y: size.height/2 - 200)
        friendFour.isPaused = false
        friendFour.alpha = 0
        
        addChild(friendOne)
        addChild(friendTwo)
        addChild(friendThree)
        addChild(friendFour)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        
        friendOne.run(appear)
        friendTwo.run(appear)
        friendThree.run(appear)
        friendFour.run(appear)
    }
    
    private func revelationLight(){
        
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
    
    private func invisibleObject(){
        invisible.isHidden = true
        invisible.position = CGPoint(x: size.width/2 + 3500, y: size.height/2)
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
            controlContact = true
             default:
                print("Some other contact occurred")
             }
    }

}

