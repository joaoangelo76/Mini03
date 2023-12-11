//
//  File.swift
//
//
//  Created by João Ângelo on 08/12/23.
//

import SpriteKit
import CoreMotion

class DiscoveryScene: SKScene{
    
    let HVM = HomeViewModel()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        addBob()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    private func addBob(){
        let bob = SKShapeNode(circleOfRadius: 30)
        bob.fillColor = .systemPurple
        bob.position = CGPoint(x: size.width/2, y: size.height/2)
        
        addChild(bob)
    }
    
    private func rotation(){
       
    }
}
