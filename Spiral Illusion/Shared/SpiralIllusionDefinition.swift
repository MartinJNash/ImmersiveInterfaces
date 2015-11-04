//
//  SpiralIllusionDefinition.swift
//  Spiral Illusion
//
//  Created by Hal Mueller on 10/23/15.
//  Copyright © 2015 Hal Mueller. All rights reserved.
//

import SpriteKit

struct SpiralIllusionDefinition {
    let numberOfRings = 6
	let squareSize = 16.0
	let squareSeparation = 6.0
	let innerRingRotationRate = 0.25 * 10 * M_PI
	let ringRotationRateIncrement = -0.1 * 10 * M_PI
	let rotationDuration = 20.0
	let oddColor = SKColor(white: 0.88, alpha: 1.0)
	let evenColor = SKColor(white: 0.0, alpha: 1.0)
	let backgroundColor = SKColor(white: 0.46, alpha: 1.0)
}