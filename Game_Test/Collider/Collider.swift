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
			for playerMissle in playerMissleArrey
			{
				if foe.scale.width - playerMissle.scale.width < foe.scale.width
				{
					if foe.scale.height - playerMissle.scale.height < foe.scale.height
					{
						// 데미지 계산
						foe.hitPoint -= playerMissle.damage
						
						// 투사체 사라짐
						playerMissle.isAlive = false
						
						// 적군 체력 계산 및 사망여부 판정
						if foe.hitPoint <= 0
						{
							foe.isAlive = false
						}
					}
				}
				
				
				/*
				// 상호간 거리 확인
				if Distance(foe.pos, playerMissle.pos) <= 100/* Distance(foe.scale, playerMissle.scale) */
				{
					// 데미지 계산
					foe.hitPoint -= playerMissle.damage
					
					// 투사체 사라짐
					playerMissle.isAlive = false
					 
					// 적군 체력 계산 및 사망여부 판정
					if foe.hitPoint <= 0
					{
						foe.isAlive = false
					}
				}
				 */
				 
				 
			}
			GameEngine.shared.foes = foeArrey
			GameEngine.shared.playerMissle = playerMissleArrey
		}
	}
	
	// 거리 계산(Pos 구조체용)
	func Distance(_ _pos1: Pos, _ _pos2: Pos) -> Double
	{
		let dx = abs(_pos2.x - _pos1.x)
		let dy = abs(_pos2.y - _pos1.y)
		return sqrt(Double(dx * dx + dy * dy))
	}
	
	
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
