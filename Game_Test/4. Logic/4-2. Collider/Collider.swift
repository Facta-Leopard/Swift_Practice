//
//  Collider.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation


class Collider
{
	var foeArrey: [Foes] = []
	var playerMissleArrey: [PlayerMissle] = []
	
	init()
	{
	}
	
	// 충돌 체크
	func ColliderCheck()
	{
		foeArrey = GameEngine.shared.foes
		playerMissleArrey = GameEngine.shared.playerMissle
		
		for foe in foeArrey
		{
			// 적군과 플레이어와의 충돌 체크
			
			if IsColliding(GameEngine.shared.player.pos, foe.pos, GameEngine.shared.player.scale, foe.scale)
			{
				// 상호간 충각데미지 적용
				GameEngine.shared.player.hitPoint -= foe.impactDamage
				foe.hitPoint -= GameEngine.shared.player.impactDamage
				
				// 적 사망여부 판정
				if foe.hitPoint <= 0
				{
					foe.isAlive = false
				}
				
				// 플레이어 사망여부 판정
				if GameEngine.shared.player.hitPoint <= 0
				{
					GameEngine.shared.player.isAlive = false
				}
			}
			
			
			// 적군과 플레이어 투사체와의 충돌 체크
			for playerMissle in playerMissleArrey
			{
				// 상호간 거리 확인
				if IsColliding(playerMissle.viewPos, foe.pos, playerMissle.scale, foe.scale)
				{
					// 데미지 계산
					foe.hitPoint -= playerMissle.damage
					
					// 투사체 사라짐
					playerMissle.isAlive = false
							
					// 적군 체력 계산 및 사망여부 판정
					if foe.hitPoint <= 0
					{
						foe.isAlive = false
						
						break
					}
				}
			}
			
			
			
		}
		
	}
	// 충돌 안되서 다시 함수 개량
	// 두 객체의 중심점 사이의 거리 계산
	func IsColliding(_ pos1: Pos, _ pos2: Pos, _ scale1: Scale, _ scale2: Scale) -> Bool {
		// 두 객체의 중심점 사이의 거리 계산
		let centerDistanceX = abs(pos2.x - pos1.x)
		let centerDistanceY = abs(pos2.y - pos1.y)
		
		// 충돌 범위 계산 (scale의 절반을 사용)
		let collisionRangeX = (scale1.width + scale2.width) / 2
		let collisionRangeY = (scale1.height + scale2.height) / 2
		
		// x축과 y축 모두에서 충돌 범위 내에 있는지 확인
		return centerDistanceX <= collisionRangeX && centerDistanceY <= collisionRangeY
	}
	
	/*
	// 아씨.. 왜 안 되지.. 맞는데..
	// 코드 정리버전
	func Distance(_ pos1: Pos, _ pos2: Pos, _ scale1: Scale, _ scale2: Scale) -> Bool
	{
		let dx = abs(pos2.x - pos1.x)
		let dy = abs(pos2.y - pos1.y)
		
		// 충돌 범위를 각 scale합의 절반으로 설정
		return (dx <= ((scale1.width + scale2.width) / 2)) && (dy <= ((scale1.height + scale2.height) / 2))
	}
	 */
			
			/*
			 // 거리 계산(Scale 구조체용)
			 func Distance(_ _scale1: Scale, _ _scale2: Scale) -> Double
			 {
			 let dx = sqrt(abs(_scale2.width) + abs(_scale1.width))
			 let dy = sprt(abs(_scale2.height) + abs(_scale1.height))
			 return sqrt(Double(dx * dx + dy * dy))
			 }
			 */
}
