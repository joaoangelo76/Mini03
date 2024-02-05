//
//  File.swift
//  
//
//  Created by João Ângelo on 13/01/24.
//

import SpriteKit

class DisagreementSceneTwo: SKScene{
    
    let dad = SKSpriteNode(imageNamed: "Dad")
    let textBoxer = SKLabelNode(text: "Memories will be awaken.")
    
    var countTaps = 0
    
    override func didMove(to view: SKView) {
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
                let newScene = DisagreementSceneThree()
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
        textBoxer.color = .white
        textBoxer.isPaused = false
        textBoxer.position = CGPoint(x: size.width/2, y: size.height/2 + 130)
        
        addChild(textBoxer)
        
        let disappear = SKAction.fadeOut(withDuration: 6)
        
        textBoxer.run(disappear)
    }
    
    func loveBalloon(){
        let loveBalloon = SKShapeNode(circleOfRadius: 50)
        loveBalloon.position = CGPoint(x: size.width/2 + 200, y: size.height/2 + 50)
        loveBalloon.fillColor = .white
        
        let appear = SKAction.fadeIn(withDuration: 2)
        let disappear = SKAction.fadeOut(withDuration: 2)
        let sequence = SKAction.sequence([appear, disappear])
        
        addChild(loveBalloon)
        
        loveBalloon.run(sequence)
    }
    
}
