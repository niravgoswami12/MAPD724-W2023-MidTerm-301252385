//
//  CloudLandscape.swift
//  MAPD724-W2023-MidTerm-301252385
//
//  Created by Nirav Goswami on 2023-02-28.
//

import GameplayKit
import SpriteKit

class CloudLandscape : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 0.7)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -902)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed: 5 to 10
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the horizontal speed: -2 to 2
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        // get a pseudo random number for the Y position: -262 to 262
        let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.y = CGFloat(randomY)
        
        // get a pseudo random number for the X position: 902 to 932
        let randomX:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.x = CGFloat(randomX)
        
        isColliding = false
    }
    
    
    func Move()
    {
        position.y -= verticalSpeed!
        position.x -= horizontalSpeed!
    }
}

