//
//  DisagreementScene.swift
//  MiniChallenge03
//
//  Created by João Ângelo on 12/12/23.
//

import SpriteKit

class DisagreementScene: SKScene{
    
    let bob = SKShapeNode(circleOfRadius: 30)
    let dad = SKShapeNode(circleOfRadius: 100)
    let mom = SKShapeNode(circleOfRadius: 100)
    
    var countTaps = 0
    
    let angryReact = SKShapeNode(circleOfRadius: 30)
    let angryReact2 = SKShapeNode(circleOfRadius: 30)
    let angryReact3 = SKShapeNode(circleOfRadius: 15)
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        addBob()
        addDad()
        addMom()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        repeat{
            countTaps+=1
            if(countTaps==1){
                angryReaction()
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func angryReaction(){
        
        angryReact.fillColor = .green
        angryReact2.fillColor = .green
        angryReact3.fillColor = .green
        
        angryReact.position = CGPoint(x: size.width/2 + 210 , y: size.height/2 + 280)
        angryReact2.position = CGPoint(x: size.width/2 + 490 , y: size.height/2 + 280)
        angryReact3.position = CGPoint(x: size.width/2 - 180, y: size.height/2 + 30)
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 10)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(angryReact)
        addChild(angryReact2)
        addChild(angryReact3)
        
        angryReact.run(sequence)
        angryReact2.run(sequence)
        angryReact3.run(sequence)
    }
    
    func addBob(){
        bob.position = CGPoint(x: size.width/2 - 200, y: size.height/2)
        bob.fillColor = .purple
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 + 400, y: size.height/2 + 200)
        dad.fillColor = .blue
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 + 120, y: size.height/2 + 200)
        mom.fillColor = .red
        addChild(mom)
    }
    
}
