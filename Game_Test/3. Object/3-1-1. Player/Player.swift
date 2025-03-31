//
//  Player.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation

class Player: ObservableObject
{
	@Published var pos: Pos = Pos()
	let iffType = IFFLayer.PLAYER
	var imageName: String = "Fight_Aerocraft_Player"
	var scale: Scale = Scale(_width: 150, _height: 150)
	var hitPoint: Int
	var impactDamage: Int = 100
	// 플레이어 속도는 엔진의 자이로스코프 및 기울기 쪽에 변수로 삽입
	var velocity: Double = 5.0
	var speed: Double = 10.0
	var isAlive: Bool = true
	
	init()
	{
		hitPoint = 100
		pos.x = Int(deviceWidth / 2)
		pos.y = Int(deviceHeight * 4 / 5)
		speed += velocity
	}
	
	func Update(motionPos: Pos) {
		// x좌표의 화면 범위 안에서 못 벗어나게 조정
		pos.x += motionPos.x
		if pos.x < 10
		{
			pos.x = 10
		} else if pos.x > Int(deviceWidth) - 10
		{
			pos.x = Int(deviceWidth) - 10
		}
		
		// y좌표의 화면 범위 안에서 못 벗어나게 조정
		pos.y += motionPos.y
		if pos.y < 10
		{
			pos.y = 10
		} else if pos.y > Int(deviceHeight) - 100
		{
			pos.y = Int(deviceHeight) - 100
		}
	}
}

