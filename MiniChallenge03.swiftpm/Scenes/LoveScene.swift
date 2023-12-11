//
//  GameScene.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 23/11/23.
//

import SpriteKit

class LoveScene: SKScene{
    
    let bob = SKShapeNode(circleOfRadius: 30)
    let dad = SKShapeNode(circleOfRadius: 100)
    let mom = SKShapeNode(circleOfRadius: 100)
    
    let cam = SKCameraNode()
    
    var control: Bool = false
    
    var countTaps = 0
    
    override func didMove(to view: SKView) {
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
        bob.fillColor = .purple
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 + 200, y: size.height/2 + 200)
        dad.fillColor = .blue
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 - 170, y: size.height/2 + 200)
        mom.fillColor = .red
        addChild(mom)
    }
    
    func loveBalloon(){
        let loveBalloon = SKShapeNode(circleOfRadius: 50)
        loveBalloon.position = CGPoint(x: size.width/2, y: size.height/2 + 200)
        loveBalloon.fillColor = .white
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        
        
        addChild(loveBalloon)
        
        loveBalloon.run(sequence)
    }
    
    func addTextBox(){
        let textBoxer = SKLabelNode(text: "We are loved.")
        textBoxer.fontColor = .white
        textBoxer.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer)
        
        textBoxer.run(sequence)
    }
    
    func addTextBox2(){
        let textBoxer2 = SKLabelNode(text: "But the time comes.")
        textBoxer2.fontColor = .white
        textBoxer2.position = CGPoint(x: size.width/2 + 1200, y: size.height/2 + 100)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 12)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer2)
        
        textBoxer2.run(sequence)
    }
    
    func addTextBox3(){
        let textBoxer3 = SKLabelNode(text: "For us to discover ourselves.")
        textBoxer3.fontColor = .white
        textBoxer3.position = CGPoint(x: size.width/2 + 2400, y: size.height/2 + 100)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 12)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer3)
        
        textBoxer3.run(sequence)
    }
    
    private func bruh(){
        
    }
    
    private func door(){
        let door = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
        door.fillColor = .systemPurple
        door.position = CGPoint(x: size.width/2 + 3600, y: size.height/2)
        
        addChild(door)
    }
}
