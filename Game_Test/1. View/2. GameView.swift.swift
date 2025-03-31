//
//  GameView.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import SwiftUI

struct GameView: View
{
	
	@ObservedObject var gameEngine: GameEngine
	@State private var showPauseMenu = false
	
	
	
	var body: some View
	{
		// 화면 전체 컨트롤
		ZStack
		{
			
			// 배경
			ZStack
			{
				Image("Game_BGIMG")
					.aspectRatio(contentMode: .fill)
					.edgesIgnoringSafeArea(.all)
			}
			.position(x: deviceWidth/2, y: deviceHeight/2)
			.zIndex(1)
			
			
			// 플레이어 랜더링
			ZStack
			{
				PlayerView(gameEngine: gameEngine)
			}
			.position(x: deviceWidth/2, y: deviceHeight/2)
			.zIndex(10)
			
			
			// 플레이어 투사체 랜더링
			ZStack
			{
				// 투사체는 배열이므로 이렇게 각각 만들어야 함..
				ForEach($gameEngine.playerMissle, id: \.id)
				{ missile in
					PlayerMissleView(gameEngine: gameEngine,
									 playerMissle: missile.wrappedValue)
				}
			}
			.position(x: deviceWidth/2, y: deviceHeight/2)
			.zIndex(4)
			
			// 적군 랜더링
			ZStack
			{
				// 임시지만, 배열형태로 만들었으니까..
				// 향후에 패턴을 만들어보자..
				ForEach($gameEngine.foes, id: \.id)
				{ foe in
					FoeView(gameEngine: gameEngine,
							foes: foe.wrappedValue)
				}
			}
			.position(x: deviceWidth/2, y: deviceHeight/2)
			.zIndex(3)
			
			
			// UI
			ZStack
			{
				// 플레이어가 죽지 않은 상황에서 작동
				if !GameEngine.shared.isPause || gameEngine.player.isAlive == true
				{
					UIView(gameEngine: gameEngine, showPauseMenu: $showPauseMenu)
				}
				
			}
			.zIndex(9)
			
			
			
			
			
		}
		.ignoresSafeArea(.keyboard)
		
		// 그냥 터치하면 미사일 생성
		.onTapGesture
		{
			if !showPauseMenu
				
			{
				gameEngine.createPlayerMissle()
			}
		}
		
		.overlay(Button(action:{withAnimation{
			if showPauseMenu
			{
				gameEngine.pauseGame()
			}
			else
			{
				gameEngine.resumeGame()
			}
		}
		}
					   )
				 {
			OverlayView(gameEngine: gameEngine, showPauseMenu: $showPauseMenu)
		}
			.padding(), alignment: .topLeading
		)
		
		
		
		
		
		
	}
}
