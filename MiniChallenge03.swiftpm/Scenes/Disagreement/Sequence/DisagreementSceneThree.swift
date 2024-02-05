//
//  File.swift
//  
//
//  Created by João Ângelo on 13/01/24.
//

import SpriteKit

class DisagreementSceneThree: SKScene{
    
    
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
        
        angryReact.fillColor = .green
        angryReact2.fillColor = .green
        
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
        bob.position = CGPoint(x: size.width/2 - 200, y: size.height/2)
        bob.fillColor = .blue
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 + 400, y: size.height/2 + 200)
        dad.fillColor = .systemTeal
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 + 120, y: size.height/2 + 200)
        mom.fillColor = .systemPink
        addChild(mom)
    }
    
    func addTextBox(){
        let textBoxer = SKLabelNode(text: "And with that...")
        textBoxer.fontColor = .white
        textBoxer.position = CGPoint(x: size.width/2 - 200, y: size.height/2 + 50)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer)
        
        textBoxer.run(sequence)
    }
    
}
