//
//  PlayerMissle.swift
//  Game_Test
//
//  Created by SHTeosis on 9/22/24.
//

import SwiftUI

struct PlayerMissleView: View
{
	// 게임엔진 인스턴스 접근
	@ObservedObject var gameEngine: GameEngine
	
	// 개별 미사일에 대한 참조 추가
	let playerMissle: PlayerMissle
	
	var body: some View
	{
		// 미사일 종류에 따른 뷰 설정 바꿈
		// 스위치문에는 _를 이용한 매개변수 이름 생략이 안 먹힘..
		// 거기에다가 모든 enum의 프로퍼티를 케이스로 설정해야됨
		// 이거땜에 또 고생했네
		switch playerMissle.missleType
		{
			case .DEFAULT:
				Circle()
					.frame(width: CGFloat(playerMissle.scale.width),
						   height: CGFloat(playerMissle.scale.height))
					.background(.orange)
					.opacity(0.8)
					.shadow(radius: 10)
					.position(x: CGFloat(playerMissle.viewPos.x), y: CGFloat(playerMissle.viewPos.y))
				
			// 추적 미사일(구현중)
			case .GUIDE:
				Image("Bullet_Player")
					.frame(width: CGFloat(playerMissle.scale.width),
						   height: CGFloat(playerMissle.scale.height))
					.opacity(0.8)
					.shadow(radius: 10)
					.position(x: CGFloat(playerMissle.viewPos.x), y: CGFloat(playerMissle.viewPos.y))
				
			// 쌍발 미사일(구현중)
			case .DOUBLE:
				Image("Bullet_Player")
					.frame(width: CGFloat(playerMissle.scale.width),
						   height: CGFloat(playerMissle.scale.height))
					.background(.orange)
					.opacity(0.8)
					.shadow(radius: 10)
					.position(x: CGFloat(playerMissle.viewPos.x - 20), y: CGFloat(playerMissle.viewPos.y))

				Image("Bullet_Player")
					.frame(width: CGFloat(playerMissle.scale.width),
						   height: CGFloat(playerMissle.scale.height))
					.background(.orange)
					.opacity(0.8)
					.shadow(radius: 10)
					.position(x: CGFloat(playerMissle.viewPos.x + 20), y: CGFloat(playerMissle.viewPos.y))

		}
	}
}
