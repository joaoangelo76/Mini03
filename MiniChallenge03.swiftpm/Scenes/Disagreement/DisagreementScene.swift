//
//  DisagreementScene.swift
//  MiniChallenge03
//
//  Created by João Ângelo on 12/12/23.
//

import SpriteKit

class DisagreementScene: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let bob = SKSpriteNode(imageNamed: "purpleBob")
    let dad = SKSpriteNode(imageNamed: "DadLeft")
    let mom = SKSpriteNode(imageNamed: "Mom")
    
    var countTaps = 0
    
    let angryReact = SKSpriteNode(imageNamed: "angryOne")
    let angryReact2 = SKSpriteNode(imageNamed: "angryOne")
    let angryReact3 = SKSpriteNode(imageNamed: "angryOne")
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
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
            else if(countTaps==2){
                let newScene = DisagreementSceneTwo()
                newScene.size = self.size
                self.scene?.view?.presentScene(newScene)
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func angryReaction(){
        
        angryReact.position = CGPoint(x: size.width/2 + 180 , y: size.height/2 + 350)
        angryReact2.position = CGPoint(x: size.width/2 + 460 , y: size.height/2 + 350)
        angryReact3.position = CGPoint(x: size.width/2 - 240, y: size.height/2 + 110)
        
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
        bob.position = CGPoint(x: size.width/2 - 300, y: size.height/2)
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 + 400, y: size.height/2 + 120)
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 + 120, y: size.height/2 + 100)
        addChild(mom)
    }
    
}
