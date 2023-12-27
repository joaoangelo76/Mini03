//
//  File.swift
//  
//
//  Created by João Ângelo on 27/12/23.
//

import SpriteKit

class DiscoverySceneFinal: SKScene{
    
    let bob = SKShapeNode(circleOfRadius: 30)
    
    let textBoxer = SKLabelNode(text: "Our discovery comes...")
    let textBoxer2 = SKLabelNode(text: "But not without a cost.")
    
    var countTaps = 0
    
    var control: Bool = false
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
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
        bob.fillColor = .purple
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
    
    private func door(){
        let door = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
        door.fillColor = .systemPurple
        door.position = CGPoint(x: size.width/2 + 1800, y: size.height/2 + 50)
        
        addChild(door)
    }
}
