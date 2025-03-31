//
//  Debugging_View.swift
//  Game_Test
//
//  Created by SHTeosis on 9/23/24.
//

import SwiftUI

struct Debugging_PlayerMissleView: View
{
		// 게임엔진 인스턴스 접근
		@ObservedObject var gameEngine: GameEngine
		// 개별 미사일에 대한 참조 추가
		let playerMissle: PlayerMissle
		
		var body: some View
		{
			Circle()
				.frame(width: CGFloat(playerMissle.scale.width),
					   height: CGFloat(playerMissle.scale.height))
				.foregroundColor(.orange)
				.background(Color.clear)
				.opacity(0.8)
				.shadow(radius: 10)
				.position(x: CGFloat(playerMissle.viewPos.x), y: CGFloat(playerMissle.viewPos.y))
		}
}

struct Debugging_FoeView: View
{
	// 게임엔진 인스턴스 접근
	@ObservedObject var gameEngine: GameEngine
	// 개별 미사일에 대한 참조 추가
	let foes: Foes
	
	var body: some View
	{
		Rectangle()
			.frame(width: CGFloat(foes.scale.width), height: CGFloat(foes.scale.height))
			.position(x: CGFloat(foes.pos.x), y: CGFloat(foes.pos.y))
	}
}
