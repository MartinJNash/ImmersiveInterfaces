//
//  MarblesScene.swift
//  Marble Trails
//
//  Created by Hal Mueller on 11/2/15.
//  Copyright © 2015 Hal Mueller. All rights reserved.
//

import SpriteKit
import CoreMotion

class MarblesScene: SKScene {

    var motionManager: CMMotionManager?

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func didMoveToView(view: SKView) {
        motionManager = CMMotionManager()
        motionManager?.startDeviceMotionUpdatesUsingReferenceFrame(.XTrueNorthZVertical)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)

            let sprite = SKShapeNode(circleOfRadius: 10.0)
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: 10.0)
            sprite.physicsBody?.affectedByGravity = true
            sprite.physicsBody?.dynamic = true
            sprite.fillColor = SKColor.yellowColor()
            sprite.position = location
            self.addChild(sprite)
        }
    }

    override func update (currentTime: NSTimeInterval) {
        if let motion = motionManager?.deviceMotion {
            let gravity = motion.gravity
            //			let attitude = motion.attitude
            //			print ("attitude", attitude.pitch, attitude.roll, attitude.yaw)
            let adjustment = 1.0
            self.physicsWorld.gravity.dx = CGFloat(adjustment * gravity.x)
            self.physicsWorld.gravity.dy = CGFloat(adjustment * gravity.y)
        }
    }
}
