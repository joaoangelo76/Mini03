//
//  BeginningScene.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 06/12/23.
//

import SpriteKit

class BeginningScene: SKScene, SKPhysicsContactDelegate{
    
    let NewScene = LoveCard()
    let transition = SKTransition.fade(with: .black, duration: 2)
    
    let cam = SKCameraNode()
    
    var control: Bool = false
    
    var greyBob = SKShapeNode(circleOfRadius: 30)
    
    let textBoxer = SKLabelNode(text: "In the beginning...")
    let textBoxer2 = SKLabelNode(text: "We are empty shells.")
    let textBoxer3 = SKLabelNode(text: "Ready to be filled.")
    
    override func didMove(to view: SKView) {
        grayBob()
        
        textBox()
        textBox2()
        textBox3()
        
        door()
        
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
        greyBob.fillColor = .gray
        greyBob.position = CGPoint(x: size.width/2, y: size.height/2)
        
        addChild(greyBob)
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
    
    private func door(){
        let door = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
        door.fillColor = .systemPurple
        door.position = CGPoint(x: size.width/2 + 3600, y: size.height/2)
        
        addChild(door)
    }

}

func +(point1:CGPoint,point2:CGPoint) -> CGPoint {
    return CGPoint(x: point1.x + point2.x, y: point1.y + point2.y)
}
