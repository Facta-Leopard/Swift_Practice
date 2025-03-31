//
//  PlayerView.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import SwiftUI

struct PlayerView: View
{
	@ObservedObject var gameEngine: GameEngine
	var body: some View
	{
		// 플레이어가 살아있을 때
		if gameEngine.player.isAlive
		{
			Image(gameEngine.player.imageName)
				.resizable()
				.frame(width: CGFloat(gameEngine.player.scale.width),
					   height: CGFloat(gameEngine.player.scale.height))
				.position(x: CGFloat(gameEngine.player.pos.x), y: CGFloat(gameEngine.player.pos.y))
			
			
		}
		else
		{
			// 플레이어가 죽었을 때
			Rectangle()
				.frame(width: CGFloat(deviceWidth),
					   height: CGFloat(deviceHeight))
				.background(Color.black)
				.opacity(0.9)
			
			VStack(spacing: 30)
			{
				Text("Game Over")
					.font(.largeTitle)
					.fontWeight(.heavy)
					.foregroundColor(.red)
					.opacity(0.7)
					.cornerRadius(30)
				
				// 나가기 버튼
				Button("Exit")
				{
					gameEngine.isRunning = false
					gameEngine.player.isAlive = false
					gameEngine.foes.removeAll()
					gameEngine.playerMissle.removeAll()
				}
				.font(.title)
				.frame(width: 90, height: 50)
				.background(Color.red)
				.foregroundColor(.white)
				.cornerRadius(10)
			}
		}
	}
}
