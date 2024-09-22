//
//  Monster.swift
//  Game_Test
//
//  Created by SHTeosis on 9/22/24.
//

import Foundation


// 임시로 쓰는 테스트용 적군이므로, 제목을 임시인 Temp로 함


class Foes : Object, ObservableObject, Identifiable
{
	
	//Identifiable 프로토콜 준수를 위한 고유 아이디 설정
	var id = UUID()
	
	let iffType = IFFLayer.FOE
	var imageName: String = "Fight_Aerocraft_Foe"
	var scale: Scale = Scale(_width: 250, _height: 250)
	var hitPoint: Int = 300
	var velocity: Double = 5.0
	var speed: Double = 5.0
	var isAlive: Bool = true
	
	override init()
	{
		// pos는 상속받은 거라 쓰기 전에 먼저 부모 클래스 생성자로 초기화..
		super.init()
		
		self.pos.x = Int(deviceWidth / 2)
		self.pos.y = Int(deviceHeight * 1 / 5)
		speed += velocity
	}
}
