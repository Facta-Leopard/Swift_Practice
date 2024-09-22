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
	@State private var showExitMenu = false
	
	var body: some View
	{	ZStack
		{
			// 게임 배경
			Image("Game_BGIMG")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.all)
				.zIndex(1)
			
			
			// 적군 랜더링
			// 임시지만, 배열형태로 만들었으니까..
			// 향후에 패턴을 만들어보자..
			ForEach($gameEngine.foes, id: \.id)
			{ foe in
				FoeView(gameEngine: gameEngine,
						foes: foe.wrappedValue)
			}
			.zIndex(7)
			
			
			// 플레이어 랜더링
			PlayerView(gameEngine: gameEngine)
				.zIndex(3)
			
			
			// 플레이어 투사체 랜더링
			// 투사체는 배열이므로 이렇게 각각 만들어야 함..
			ForEach($gameEngine.playerMissle, id: \.id)
			{ missile in
				PlayerMissleView(gameEngine: gameEngine,
								 playerMissle: missile.wrappedValue)
			}
			.zIndex(5)
			
			// 아군 체력표시바
			VStack
			{
				Spacer()
				
				HStack
				{
					Text("My HP")
						.foregroundColor(.white)
						.background(Color.blue)
						.cornerRadius(10)
					Spacer()
				}
				.padding(.leading, 40)
				HStack
				{
					Button(String(gameEngine.player.hitPoint))
					{
					}
					.background(Color.blue)
					.foregroundColor(.white)
					.cornerRadius(10)
					Spacer()
				}
				.padding(.leading, 50)
			}
			.zIndex(9)
			.ignoresSafeArea(.keyboard)
			
			// X아이콘 버튼
			if showExitMenu
			{
				Color.black.opacity(0.5)
					.edgesIgnoringSafeArea(.all)
					.onTapGesture {
						withAnimation {
							showExitMenu = false
						}
					}
				
				// 종료창 모달박스
				VStack
				{
					Text("Exit Game?")
						.foregroundColor(.white)
						.padding()
					
					// 모달박스 내 버튼
					// 임시용으로 적군생성 버튼을 달아둔다
					HStack {
						
						// 나가기 버튼
						Button("Exit") {
							gameEngine.isRunning = false
						}
						.padding()
						.background(Color.red)
						.foregroundColor(.white)
						.cornerRadius(10)
						
						// 취소 버튼
						Button("Cancel") {
							withAnimation {
								showExitMenu = false
							}
						}
						.padding()
						.background(Color.blue)
						.foregroundColor(.white)
						.cornerRadius(10)
						
						// 적군 생성 버튼(임시용)
						Button("CreatFoe") {
							withAnimation {
								gameEngine.createFoe()
							}
						}
						.padding()
						.background(Color.cyan)
						.foregroundColor(.white)
						.cornerRadius(10)
					}
				}
				.zIndex(10)
				
			}
		}
		
		// 터치하면 미사일 생성
		.onTapGesture
		{
			gameEngine.createPlayerMissle()
		}
			
		.overlay(
			Button(action: {
				withAnimation {
					showExitMenu.toggle()
				}
			}) {
				Image(systemName: "xmark")
					.imageScale(.large)
					.padding()
					.foregroundColor(.white)
			}
				.padding(),
			alignment: .topLeading
		)
	}
}
