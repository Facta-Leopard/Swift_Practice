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
	var scale: Scale = Scale(_width: 120, _height: 120)
	var hitPoint: Int = 50
	var impactDamage = 10
	var velocity: Double = 5.0
	var speed: Double = 5.0
	var isAlive: Bool = true
	
	override init()
	{
		// pos는 상속받은 거라 쓰기 전에 먼저 부모 클래스 생성자로 초기화..
		super.init()
		
		self.pos.x = Int(deviceWidth / 2)
		self.pos.y = Int(deviceHeight * 1 / 5)
		self.viewScale = scale * 1.2
		
		speed += velocity
	}
	
	// 임의의 좌표 값이 입력시 그 좌표로 생성되게 생성자 오버로딩
	// 앞으로는 오버로딩시, 부모 클래스에 패러미터가 있는 가상함수가 있는지 확인하자..
	// 적군 만드는 버튼이랑 연관지음
	init(_ _x: Int, _ _y: Int)
	{
		super.init()
		self.pos.x = _x
		self.pos.y = _y
		self.viewScale = scale * 1.2
		
		speed += velocity
	}
	
	
}
