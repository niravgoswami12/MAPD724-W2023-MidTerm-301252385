//
//  PlayerLandscape.swift
//  MAPD724-W2023-MidTerm-301252385
//
//  Created by Nirav Goswami on 2023-02-28.
//

import GameplayKit
import SpriteKit

class PlayerLandscape : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "planeRight", initialScale: 1.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // constrain the player on the bottom boundary
        if(position.y <= -270)
        {
            position.y = -270
        }
        
        // constrain the player on the top boundary
        if(position.y >= 270)
        {
            position.y = 270
        }
    }
    
    override func Reset()
    {
        position.x = -540
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
    
}
