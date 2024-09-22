//
//  FoeView.swift
//  Game_Test
//
//  Created by SHTeosis on 9/22/24.
//

import SwiftUI

struct FoeView: View
{
	// 게임엔진 인스턴스 접근
	@ObservedObject var gameEngine: GameEngine
	// 개별 미사일에 대한 참조 추가
	let foes: Foes
	
	var body: some View
	{
		Image("Fight_Aerocraft_Foe")
			.resizable()
			.frame(width: CGFloat(foes.scale.width), height: CGFloat(foes.scale.height))
			.position(x: CGFloat(foes.pos.x), y: CGFloat(foes.pos.y))
	}
}
