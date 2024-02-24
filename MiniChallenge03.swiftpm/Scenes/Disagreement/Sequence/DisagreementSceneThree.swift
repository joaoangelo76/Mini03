//
//  File.swift
//  
//
//  Created by João Ângelo on 13/01/24.
//

import SpriteKit

class DisagreementSceneThree: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let bob = SKSpriteNode(imageNamed: "youngDad")
    let dad = SKSpriteNode(imageNamed: "Grandpa")
    let mom = SKSpriteNode(imageNamed: "Grandma")
    
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
        
        addTextBox()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        repeat{
            countTaps+=1
            if(countTaps==1){
                angryReaction()
            }
            else if(countTaps==2){
                let newScene = DisagreementSceneFour()
                newScene.size = self.size
                self.scene?.view?.presentScene(newScene)
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func angryReaction(){
        
        angryReact.position = CGPoint(x: size.width/2 + 210 , y: size.height/2 + 280)
        angryReact2.position = CGPoint(x: size.width/2 + 490 , y: size.height/2 + 280)
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 10)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(angryReact)
        addChild(angryReact2)
        
        angryReact.run(sequence)
        angryReact2.run(sequence)
    }
    
    func addBob(){
        bob.position = CGPoint(x: size.width/2 - 300, y: size.height/2 - 100)
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 + 400, y: size.height/2 + 90)
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 + 120, y: size.height/2 + 70)
        addChild(mom)
    }
    
    func addTextBox(){
        let textBoxer = SKLabelNode(text: "And with that...")
        textBoxer.fontColor = .white
        textBoxer.position = CGPoint(x: size.width/2 - 300, y: size.height/2 + 50)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer)
        
        textBoxer.run(sequence)
    }
    
}
