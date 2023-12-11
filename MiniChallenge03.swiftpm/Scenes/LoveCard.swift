//
//  File.swift
//
//
//  Created by João Ângelo on 07/12/23.
//

import SpriteKit

class LoveCard: SKScene{
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        self.camera = cam
        
        LoveCard()
    }
    
    private func LoveCard(){
        let loveCard = SKLabelNode(text: "LOVE")
        loveCard.fontSize = 70
        loveCard.fontColor = .systemPurple
        
        addChild(loveCard)
    }
}
