//
//  PlayerMissle.swift
//  Game_Test
//
//  Created by SHTeosis on 9/22/24.
//

import Foundation

// GameView에서 PlayerMissle를 Each로 View하기 위해서 Identifiable 프로토콜을 썻음
class PlayerMissle: Object, ObservableObject, Identifiable
{
	//Identifiable 프로토콜 준수를 위한 고유 아이디 설정
	var id = UUID()
	
	@Published var viewPos: Pos = Pos()
	
	let iffType = IFFLayer.PLAYERMISSLE
	
	var scale: Scale = Scale(_width: 20, _height: 20)
	var damage = 10
	var isAlive: Bool = true
	
	private let tempEngine: GameEngine
	
	override init()
	{
		// 싱글톤 접근
		self.tempEngine = GameEngine.shared
		// 플레이어 위치로 초기화 및 위치 조정
		self.viewPos = tempEngine.player.pos + Pos(_x: 0, _y: -30)
		
		// 나머지 상속받은 프로퍼티들 생성자로 초기화..
		super.init()
	}

	// 발사위치 수동 조정

	
	func Update()
	{
		// 위로 이동
		viewPos.y -= 10
		
		// 화면 밖으로 나가면 상태 죽은 걸로 설정
		if viewPos.y < 0
		{
			isAlive = false
		}
		
	}
}
