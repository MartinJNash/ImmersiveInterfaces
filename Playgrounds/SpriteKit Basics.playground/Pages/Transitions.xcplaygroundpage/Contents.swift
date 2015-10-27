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
	print (fullname)
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
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.crossFadeWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.doorsCloseHorizontalWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.doorsCloseVerticalWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.doorsOpenHorizontalWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.doorsOpenVerticalWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.doorwayWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.fadeWithColor(SKColor.yellowColor(), duration:5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.fadeWithDuration(5))
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
	sceneView.presentScene(scenes[counter++], transition: SKTransition.flipHorizontalWithDuration(5))
}
//dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
//	sceneView.presentScene(scenes[counter++], transition: SKTransition.flipVerticalWithDuration(5))
//}
//dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
//	sceneView.presentScene(scenes[counter++], transition: SKTransition.WithDuration(5))
//}
//dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
//	sceneView.presentScene(scenes[counter++], transition: SKTransition.WithDuration(5))
//}
//dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * UInt64(counter) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
//	sceneView.presentScene(scenes[counter++], transition: SKTransition.WithDuration(5))
//}
