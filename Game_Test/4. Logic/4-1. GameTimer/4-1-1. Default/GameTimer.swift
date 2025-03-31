//
//  Timer.swift
//  Game_Test
//
//  Created by SHTeosis on 9/25/24.
//

import Foundation
import Combine

// Timer라는 클래스가 이미 Combine에 포함되어 있는 기본클래스라서 이름을 바꿔서 정의함
// 이거 떔에 한참 헤맷네
class GameTimer : ObservableObject
{
	// 싱글톤 구성
	static let shared = GameTimer()
	
	@Published var timer: AnyCancellable!
	
	// 타이머 시작
	func start()
	{
			timer = Timer.publish(every: 1.0/60.0, on: .main, in: .common)

				// 퍼블리셔가 자동으로 연결되어 이벤트를 방출 시작
				.autoconnect()
				
				// 여기서는 1/60초마다 이벤트를 발생시킴
				// sink는 퍼블리셔에서 방출된 이벤트를 구독하고, 이벤트가 발생할 때마다 클로저 내부의 코드를 실행함
				.sink{_ in
					// 게임 엔진의 업데이트 메소드 작동
					GameEngine.shared.update()
			}
		GameEngine.shared.isPause = false
	}
	
	// 타이머 중지
	func stop()
	{
		timer.cancel()
		GameEngine.shared.isPause = true
	}
}
