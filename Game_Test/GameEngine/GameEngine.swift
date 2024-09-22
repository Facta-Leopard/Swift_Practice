//
//  Engine.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation
import Combine
import CoreMotion
import QuartzCore

class GameEngine : ObservableObject
{
	// 싱글톤 구성
	static let shared = GameEngine()
	
	// 플레이어 생성
	@Published var player: Player = Player()
	
	// 적군 생성
	@Published var foes: Array<Foes> = []
	
	
	// 플레이어 투사체 생성
	@Published var playerMissle: Array<PlayerMissle> = []
	// 위와 같은 의미.. 참고해두자..
	// @Published var playerMissle: [PlayerMissle] = []

	
	@Published var motionPos: Pos = Pos()
	@Published var isRunning : Bool = false
	
	private var motionVelocity: Velocity = Velocity()
	private var accel: Accel = Accel(_x: 0, _y: 0, _z: 0)
	private var timer: AnyCancellable?
	private var lastUpdateTime: Double = 0
	private var collider: Collider = Collider()
	
	private let motionManager = CMMotionManager()
	
	
	private init()
	{
		setupMotionManager()
	}
	
	// 미리보기 전용 생성자
	// 이거 없으면 미리보기가 안됨..
	init(preview: Bool)
	{
		setupMotionManager()
	}
	
	deinit
	{
		motionManager.stopAccelerometerUpdates()
	}
	
	// 게임 시작
	func startGame()
	{
		isRunning = true
		lastUpdateTime = CACurrentMediaTime()
		
		timer = Timer.publish(every: 1.0/60.0, on: .main, in: .common)
			.autoconnect()
			.sink
		{_ in
			self.update()
		}
		
	}
	
	// 게임 상태 업데이트
	func update()
	{
		// 자이로스코프 및 기울기 업데이트 및 좌표 계산
		motionUpdate()
		
		// 플레이어 위치 업데이트
		player.Update(motionPos: motionPos)
		
		// 죽은 상태 적군 제거
		foes.removeAll { !$0.isAlive }

		// 죽은 상태 미사일 제거
		playerMissle.removeAll
		{ !$0.isAlive }
		
		// 살아있는 미사일만 업데이트
		// 그냥 투사하는 것에서 살아있는 것만 업데이트 개량해도 투사체가 씹히네.. 뭐가 문제일까..
		playerMissle.forEach
		{ missile in
			if missile.isAlive
			{
				missile.Update()
			}
		}
		
		// 플레이어 투사체 업데이트
		/* if !playerMissle.isEmpty
		{
			for missile in playerMissle
			{
				missile.Update()
			}
		}
		 */
		
		// 충돌 체크
		collider.ColliderCheck()
		
	}
	
	// 게임 중지
	func stopGame()
	{
		isRunning = false
		timer?.cancel()
	}

	// 적군 생성
	func createFoe()
	{
		foes.append(Foes())
	}
	
	// 플레이어 투사체 생성
	func createPlayerMissle()
	{
		playerMissle.append(PlayerMissle())
	}
	
	
//-----------------------------------------------------------------------------
	
	
	// 게임 업데이트 전용 함수
	// 중력과 기울기 등 계산
	private func motionUpdate()
	{
		guard let motion = motionManager.deviceMotion
		else
		{
			return
		}
		
		let gravity = motion.gravity
		let userAcceleration = motion.userAcceleration
		

		// 기울기 기본값을 조정하기 위한 임시상수
		// 향후, 메뉴에서 조정하게 하는 것도 좋을 듯(감도도 그렇게 하는 게 좋을까?)
		let defaultTiltX: CGFloat = 0 // 원하는 기본값
		let defaultTiltY: CGFloat = 0.5 // 원하는 기본값
		

		// 중력(기울기)와 사용자 가속도를 결합
		let tiltX = -gravity.x + defaultTiltX
		let tiltY = gravity.y + defaultTiltY
		let accelerationX = userAcceleration.x
		let accelerationY = -userAcceleration.y
		
		// 움직임 계산 (감도 조절을 위해 플레이어 프로퍼티의 속도를 곱함)
		motionPos.x = Int(CGFloat(tiltX + accelerationX) * player.speed)
		motionPos.y = Int(CGFloat(tiltY + accelerationY) * player.speed)
	}
	
	// 생성자 전용 함수
	// 중력과 기울기 시작을 위한 함수
	private func setupMotionManager()
	{
		guard motionManager.isDeviceMotionAvailable else
		{
			return
		}
		motionManager.deviceMotionUpdateInterval = 1.0 / 60.0 // 60Hz
		motionManager.startDeviceMotionUpdates()
	}
		
		

}
