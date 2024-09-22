//
//  View.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import SwiftUI
@main
struct Game_TestApp: App
{
	// 싱글톤 형식이므로 생성 자체도 이렇게 접근
	// 객체가 없는데 객체 생성하는 특이한 싱글톤 형식이므로 이 형식은 외워야겠음
	@StateObject private var gameEngine: GameEngine = GameEngine.shared
	
	// 싱글턴 형식 이전에는 이렇게 작동시켰음
	// @StateObject private var gameEngine: GameEngine = .init
	
	var body: some Scene
    {
        WindowGroup
        {
            MainView(gameEngine: gameEngine)
        }
    }
}
struct MainView: View
{
	@ObservedObject var gameEngine: GameEngine
	
    var body: some View
	{
		NavigationStack
		{
			VStack
			{
				
				Text("슈팅게임 테스트용")
					.font(.title2)
					.fontWeight(.bold)
					.foregroundColor(.white)
					.opacity(0.8)
					.padding(.top, 40)
				Spacer()
				
				// 게임시작 버튼
				Button(action:
								{
									if !gameEngine.isRunning
									{
										gameEngine.isRunning = true
										gameEngine.startGame()
									}
								}
						)
				{
					Text("Game_Start")
						.font(.title)
						.fontWeight(.bold)
						.padding()
						.frame(width: 200, height: 60)
						.background(Color.mint)
						.foregroundColor(.white)
						.cornerRadius(15)
						.shadow(radius: 5)
						.opacity(0.7)
				}
				.navigationDestination(isPresented: $gameEngine.isRunning)
				{
					GameView(gameEngine: gameEngine)
						.navigationBarBackButtonHidden(true)
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			// 메인화면 배경이미지
			.background(
				Image("MainView_BGIMG")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.edgesIgnoringSafeArea(.vertical)
			)
			
		}
	}
}





#Preview {
	MainView(gameEngine: GameEngine(preview: true))
}

// 기존 프리뷰는 게임엔진 싱글톤화 하니 작동을 안해서 위와 같이 바꿈
/* #Preview {
	MainView(gameEngine: GameEngine())
		
}
*/
