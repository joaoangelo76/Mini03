//
//  File.swift
//
//
//  Created by João Ângelo on 08/12/23.
//

import SpriteKit
import CoreMotion

class FlyingSequence: SKScene{
    
    let dad = SKShapeNode(circleOfRadius: 100)
    
    let bob = SKShapeNode(circleOfRadius: 30)
    
    var countTaps = 0
    
    var control: Bool = false
    
    let HVM = HomeViewModel()
    
    let cam = SKCameraNode()
    
    let textBoxer = SKLabelNode(text: "However, even though there are conflicts.")
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        self.camera = cam
        
        addDad()
        
        addBob()
        
        textBox()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = true
        if(dad.position == CGPoint(x: size.width/2 + 1300, y: size.height/2)){
            control = false
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if control == true{
            dad.position = dad.position + CGPoint(x: 3, y: 0)
        }
        cam.position = dad.position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        control = false
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2, y: size.height/2)
        dad.fillColor = .blue
        addChild(dad)
    }
    
    private func addBob(){
        bob.fillColor = .systemPurple
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
    
}
