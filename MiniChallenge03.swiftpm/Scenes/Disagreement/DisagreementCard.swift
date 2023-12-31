//
//  DisagreementCard.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 12/12/23.
//

import SpriteKit

class DisagreementCard: SKScene{
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        self.camera = cam
        
        DiscoveryCard()
    }
    
    private func DiscoveryCard(){
        let disagreementCard = SKLabelNode(text: "DISAGREEMENT")
        disagreementCard.fontSize = 70
        disagreementCard.fontColor = .systemRed
        
        addChild(disagreementCard)
    }
}
