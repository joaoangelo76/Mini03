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
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        addBob()
        addDad()
        addMom()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
    
}
