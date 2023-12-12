//
//  ReconciliationCard.swift
//  MyFirstPlaygroundApp
//
//  Created by João Ângelo on 12/12/23.
//

import SpriteKit

class ReconciliationCard: SKScene{
    
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        self.camera = cam
        
        DiscoveryCard()
    }
    
    private func DiscoveryCard(){
        let reconciliationCard = SKLabelNode(text: "RECONCILIATION")
        reconciliationCard.fontSize = 70
        reconciliationCard.fontColor = .white
        
        addChild(reconciliationCard)
    }
}
