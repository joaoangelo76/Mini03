//
//  File.swift
//  
//
//  Created by João Ângelo on 27/12/23.
//

import SpriteKit

class ReconciliationSceneFinal: SKScene{
    
    var background = SKSpriteNode(imageNamed: "Theater")
    
    let bob = SKSpriteNode(imageNamed: "purpleBob")
    let dad = SKSpriteNode(imageNamed: "DadOneLastTime")
    let mom = SKSpriteNode(imageNamed: "MomOneLastTime")
    
    var countTaps = 0
    
    let textBoxer = SKLabelNode(text: "LOVE...")
    let textBoxer2 = SKLabelNode(text: "Will always prevail.")
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
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
            }
        }while(touches.first!.tapCount < 1)
    }
    
    func addBob(){
        bob.position = CGPoint(x: size.width/2 + 300, y: size.height/2 - 50)
        addChild(bob)
    }
    
    func addDad(){
        dad.position = CGPoint(x: size.width/2 - 400, y: size.height/2 + 100)
        addChild(dad)
    }
    
    func addMom(){
        mom.position = CGPoint(x: size.width/2 - 120, y: size.height/2 + 85)
        addChild(mom)
    }
    
    func addTextBox(){
        textBoxer.color = .white
        textBoxer.isPaused = false
        textBoxer.position = CGPoint(x: size.width/2 + 300, y: size.height/2 + 100)
        
        addChild(textBoxer)
        
        let disappear = SKAction.fadeOut(withDuration: 6)
        
        textBoxer.run(disappear)
    }
    
    private func addTextBox2(){
        textBoxer2.color = .white
        textBoxer2.isPaused = false
        textBoxer2.position = CGPoint(x: size.width/2 + 300, y: size.height/2 + 100)
        textBoxer2.alpha = 0
        
        addChild(textBoxer2)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 3)
        let disappear = SKAction.fadeAlpha(to: 0, duration: 6)
        let sequence = SKAction.sequence([appear, disappear])
        
        textBoxer2.run(sequence)
    }
    
    private func door(){
        let door = SKSpriteNode(imageNamed: "LastDoor")
        door.position = CGPoint(x: size.width/2 + 500, y: size.height/2 + 50)
        
        addChild(door)
    }
}
