//
//  File.swift
//  
//
//  Created by João Ângelo on 21/01/24.
//

import SpriteKit

class DisagreementSceneFour: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let dad = SKSpriteNode(imageNamed: "Dad")
    
    var countTaps = 0
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        
        backgroundColor = .black
        
        addDad()
        
        addTextBox()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        repeat{
            countTaps+=1
            if(countTaps==1){
                loveBalloon()
            }
            else if(countTaps==2){
                let newScene = FlyingSequence()
                newScene.size = self.size
                self.scene?.view?.presentScene(newScene)
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(dad)
    }
    
    func addTextBox(){
        let textBoxer = SKLabelNode(text: "Regret.")
        textBoxer.fontColor = .white
        textBoxer.position = CGPoint(x: size.width/2 - 300, y: size.height/2 + 50)
    
        let appear = SKAction.fadeAlpha(to: 1, duration: 6)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(textBoxer)
        
        textBoxer.run(sequence)
    }
    
    func loveBalloon(){
        let loveBalloon = SKSpriteNode(imageNamed: "Heartbroken")
        loveBalloon.position = CGPoint(x: size.width/2 + 200, y: size.height/2 + 50)
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(loveBalloon)
        
        loveBalloon.run(sequence)
    }
}
