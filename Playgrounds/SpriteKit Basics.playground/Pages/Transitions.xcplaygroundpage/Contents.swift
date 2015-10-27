//: [TOC](TOC) - [Previous](@previous) - [Next](@next)

import Foundation
import SpriteKit
import XCPlayground

//: #### Basic SpriteKit setup for playgrounds:
let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))

XCPlaygroundPage.currentPage.liveView = sceneView

func imageNodeFromURLString (urlString: String) -> SKSpriteNode? {
	
	if let URL = NSURL(string: urlString),
		let image = NSImage(contentsOfURL: URL) {
			let text = SKTexture(image: image)
			let result = SKSpriteNode(texture: text)
			return result
	}
	return nil
}
func imageNodeFromMonthName (month: String) -> SKSpriteNode {
	let fullname = "Mt Rainier/\(month)_800x600.jpg"
	let result = SKSpriteNode(imageNamed: fullname)
	result.position = CGPointMake(400, 300)
	return result
}


//: images from http://www.nps.gov/mora/learn/photosmultimedia/2015-background-photos.htm
//: US NPS images, public domain, photo credits on images
let imageNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"]
let rainierSprites = imageNames.map {
	imageNodeFromMonthName($0)
}

let scenes = rainierSprites.map { (sprite) -> SKScene in
	let scene = SKScene(size: CGSize(width: 800, height: 600))
	scene.addChild(sprite)
	return scene
}
sceneView.presentScene(scenes[0])

var counter = 1
func enqueueTransitionDemo(transition: SKTransition) {
	let scenesIndex = counter % scenes.count
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(8 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
		sceneView.presentScene(scenes[scenesIndex], transition: transition)
	}
	counter++
}

let transitions = [
	SKTransition.moveInWithDirection(.Down, duration: 5),
	SKTransition.moveInWithDirection(.Up, duration: 5),
	SKTransition.pushWithDirection(.Left, duration: 5),
	SKTransition.revealWithDirection(.Up, duration: 5),
	SKTransition.doorsCloseHorizontalWithDuration(5),
	SKTransition.doorsCloseVerticalWithDuration(5),
	SKTransition.doorsOpenHorizontalWithDuration(5),
	SKTransition.doorsOpenVerticalWithDuration(5),
	SKTransition.doorwayWithDuration(5),
	SKTransition.fadeWithColor(SKColor.yellowColor(), duration:3),
	SKTransition.fadeWithDuration(3),
	SKTransition.crossFadeWithDuration(5),
	SKTransition.flipHorizontalWithDuration(5),
	SKTransition.flipVerticalWithDuration(5)
]

transitions.map({enqueueTransitionDemo($0)})
