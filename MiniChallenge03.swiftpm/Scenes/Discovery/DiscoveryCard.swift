//
//  DiscoveryCard.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 08/12/23.
//

import SpriteKit

class DiscoveryCard: SKScene{
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        self.camera = cam
        
        DiscoveryCard()
    }
    
    private func DiscoveryCard(){
        let discoveryCard = SKLabelNode(text: "DISCOVERY")
        discoveryCard.fontSize = 70
        discoveryCard.fontColor = .systemBlue
        
        addChild(discoveryCard)
    }
}
