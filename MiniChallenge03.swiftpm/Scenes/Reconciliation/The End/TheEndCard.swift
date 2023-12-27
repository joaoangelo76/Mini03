//
//  File.swift
//  
//
//  Created by João Ângelo on 27/12/23.
//

import SpriteKit

class TheEndCard: SKScene{
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        self.camera = cam
        
        LoveCard()
    }
    
    private func LoveCard(){
        let loveCard = SKLabelNode(text: "The End")
        loveCard.fontSize = 70
        loveCard.fontColor = .white
        
        addChild(loveCard)
    }
}
