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
            if(countTaps==2){
                
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func angryReaction(){
        let angryReact = SKShapeNode(circleOfRadius: 30)
        let angryReact2 = SKShapeNode(circleOfRadius: 30)
        let angryReact3 = SKShapeNode(circleOfRadius: 5)
        
        angryReact.position = CGPoint(x: size.width/2 , y: size.height/2)
        angryReact2.position = CGPoint(x: size.width/2, y: size.height/2)
        angryReact3.position = CGPoint(x: size.width/2 - 200, y: size.height/2 + 10)
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
