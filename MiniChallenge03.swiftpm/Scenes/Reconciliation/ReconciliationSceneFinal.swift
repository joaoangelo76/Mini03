//
//  File.swift
//  
//
//  Created by João Ângelo on 27/12/23.
//

import SpriteKit

class DisagreementSceneFinal: SKScene{
    
    let bob = SKShapeNode(circleOfRadius: 30)
    let dad = SKShapeNode(circleOfRadius: 100)
    let mom = SKShapeNode(circleOfRadius: 100)
    
    var countTaps = 0
    
    let textBoxer = SKLabelNode(text: "LOVE...")
    let textBoxer2 = SKLabelNode(text: "Will always prevail.")
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        addBob()
        addDad()
        addMom()
        door()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        repeat{
            countTaps+=1
            if(countTaps==1){
                addTextBox()
            }
            if(countTaps==2){
                addTextBox2()
                loveBalloon()
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func addBob(){
        bob.position = CGPoint(x: size.width/2 + 300, y: size.height/2)
        bob.fillColor = .purple
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 - 400, y: size.height/2 + 200)
        dad.fillColor = .blue
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 - 120, y: size.height/2 + 200)
        mom.fillColor = .red
        addChild(mom)
    }
    
    func addTextBox(){
        textBoxer.color = .white
        textBoxer.isPaused = false
        textBoxer.position = CGPoint(x: size.width/2 + 300, y: size.height/2 + 60)
        
        addChild(textBoxer)
        
        let disappear = SKAction.fadeOut(withDuration: 6)
        
        textBoxer.run(disappear)
    }
    
    private func addTextBox2(){
        textBoxer2.color = .white
        textBoxer2.isPaused = false
        textBoxer2.position = CGPoint(x: size.width/2 + 300, y: size.height/2 + 60)
        textBoxer2.alpha = 0
        
        addChild(textBoxer2)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 3)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        textBoxer2.run(sequence)
    }
    
    private func door(){
        let door = SKShapeNode(rectOf: CGSize(width: 100, height: 200))
        door.fillColor = .systemPurple
        door.position = CGPoint(x: size.width/2 + 500, y: size.height/2 + 50)
        
        addChild(door)
    }
    
    func loveBalloon(){
        let loveBalloon = SKShapeNode(circleOfRadius: 50)
        loveBalloon.position = CGPoint(x: size.width/2 - 260, y: size.height/2 + 330)
        loveBalloon.fillColor = .white
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        
        
        addChild(loveBalloon)
        
        loveBalloon.run(sequence)
    }
}
