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
		Image("Bullet_Player")
			.frame(width: CGFloat(playerMissle.scale.width),
				   height: CGFloat(playerMissle.scale.height))
			.foregroundColor(.orange)
			.background(Color.clear)
			.opacity(0.8)
			.shadow(radius: 10)
			.position(x: CGFloat(playerMissle.viewPos.x), y: CGFloat(playerMissle.viewPos.y))
	}
}
