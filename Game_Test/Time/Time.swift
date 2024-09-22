//
//  File.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation
import QuartzCore

class Time
{
    private var lastUpdateTime : Double = 0
    var deltaTime : Double
	
    init()
    {
        lastUpdateTime = CACurrentMediaTime()
		let CURRENT_TIME = CACurrentMediaTime()
		let DELTA = CURRENT_TIME - lastUpdateTime
		lastUpdateTime = CURRENT_TIME
		deltaTime = DELTA
    }
	
}


