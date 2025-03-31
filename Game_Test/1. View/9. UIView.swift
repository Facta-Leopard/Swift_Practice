//
//  UIView.swift
//  Game_Test
//
//  Created by SHTeosis on 9/26/24.
//

import SwiftUI

struct UIView: View
{
	// 게임엔진 인스턴스 접근
	@ObservedObject var gameEngine: GameEngine
	@Binding var showPauseMenu: Bool
	
	
	var body: some View {
		VStack
		{
			HStack()
			{
				Button("Pause") {
					withAnimation {
						showPauseMenu = true
						gameEngine.pauseGame()
					}
				}
				.fontWeight(.bold)
				.foregroundColor(.white)
			}
			
			Spacer() // 위쪽 여백
			
			HStack
			{
				HStack
				{
					// 플레이어 체력 타이틀
					Text("My HP")
						.frame(width: 60, height: 30)
						.foregroundColor(.white)
						.background(Color.blue)
						.cornerRadius(10)
				}
				.padding(.leading, 20)
				Spacer()
				HStack
				{
					// 플레이어 미사일 종류 타이틀
					Text("MissleType")
						.frame(width: 150, height: 30)
						.foregroundColor(.black)
						.background(Color.red)
						.cornerRadius(20)
				}
				.padding(.trailing, 35)
				
			}
			
			HStack
			{
				HStack
				{
					// 플레이어 체력 수치 표시
					Button("\(gameEngine.player.hitPoint)")
					{
					}
					.frame(width: 60, height: 30)
					.background(Color.blue)
					.foregroundColor(.white)
					.cornerRadius(10)
				}
				.padding(.leading, 20)
				
				Spacer()
				
				// 이렇게 스페이싱 넣는 건 처음 알았네 ㅋ
				HStack(spacing: 5)
				{
					// 플레이어 미사일 버튼 종류별 나열
					Button("Default")
					{
						// 유의! 이건 루프문을 돌리는 게 아니고, 배열안의 객체안 속성에 접근하는 문법임
						for missile in gameEngine.playerMissle
						{
							missile.missleType = .DEFAULT
						}				}
					.frame(width: 60, height: 30)
					.background(Color.red)
					.foregroundColor(.black)
					.cornerRadius(10)
					
					Button("Guide")
					{
// 구현아직
						//						gameEngine.playerMissle.missleType = .GUIDE
					}
					.frame(width: 60, height: 30)
					.background(Color.red)
					.foregroundColor(.black)
					.cornerRadius(10)
					
					Button("Double")
					{
						for missile in gameEngine.playerMissle
						{
							missile.missleType = .DOUBLE
						}
					}
					.frame(width: 60, height: 30)
					.background(Color.red)
					.foregroundColor(.black)
					.cornerRadius(10)
				}
				.padding(.trailing, 20)
			}
			.padding(.bottom, 10)
		}
	}
	
}
