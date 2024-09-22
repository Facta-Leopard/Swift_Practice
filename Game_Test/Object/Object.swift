//
//  Object.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation


class Object
{
	// 후에 상속받을 객체들이 Identifiable 프로토콜울 준수해서 View에 쓸 UUID를 쓸텐데..
	// 굳이 이름을 유니크하게 만드는 걸 할 필요가 있을까 싶은데.. 향후 생각해봐야지.. 처음만든 코드라..
	var nameCount: Int = 0
	var isDead: Bool = true
	let tempName: String
	var pos: Pos = Pos()
	
	
	init()
	{
		tempName = "Object \(nameCount)"
		nameCount += 1
	}
	
	init(_x: Any, _y: Any)
	{
		// Any로 받으면 String도 들어와서 런타임 크래쉬 날 수가 있으니 as문법으로 받아줌
		pos.x = _x as? Int ?? 0
		pos.y = _y as? Int ?? 0
		tempName = "Object \(nameCount)"
		nameCount += 1
	}

	init(_pos: Pos)
	{
		pos.x = _pos.x
		pos.y = _pos.y
		
		tempName = "Object \(nameCount)"
		nameCount += 1
	}
	
}
