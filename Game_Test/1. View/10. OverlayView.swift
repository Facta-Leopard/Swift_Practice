//
//  10. OverlayView.swift
//  Game_Test
//
//  Created by SHTeosis on 9/26/24.
//

import SwiftUI

struct OverlayView: View
{
	@ObservedObject var gameEngine: GameEngine
	@Binding var showPauseMenu: Bool
	
	var body: some View
	{
		ZStack
		{
			if showPauseMenu
			{
				// 모달 박스
				VStack(spacing: 20)
				{
					Text("Pause Menu")
						.foregroundColor(.white)
						.padding()
					
					// 나가기 버튼
					Button("Exit")
					{
						gameEngine.isRunning = false
						gameEngine.player.isAlive = false
						gameEngine.foes.removeAll()
						gameEngine.playerMissle.removeAll()
					}
					.font(.title)
					.frame(width: 150, height: 50)
					.background(Color.red)
					.foregroundColor(.white)
					.cornerRadius(10)
					
					if gameEngine.player.isAlive
					{
						// 취소 버튼
						Button("Cancel")
						{
							withAnimation
							{
								showPauseMenu = false
								gameEngine.resumeGame()
							}
						}
						.font(.title)
						.frame(width: 150, height: 50)
						.background(Color.blue)
						.foregroundColor(.white)
						.cornerRadius(10)
						
						// 적군 생성 버튼
						Button("Create Foe")
						{
							withAnimation {
								gameEngine.createFoe()
							}
						}
						.font(.title)
						.frame(width: 150, height: 50)
						.background(Color.cyan)
						.foregroundColor(.white)
						.cornerRadius(10)
					}
				}
				.frame(width: 250, height: 500)
				.background(Color.black)
				.opacity(0.5)
				.cornerRadius(20)
				.shadow(radius: 10)
			}
		}

	}
}

