//
//  IFF.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation

enum IFFLayer
{
	// 스타일 분류
	case PLAYER
	case FRIEND
	case FOE
	
	// 투사체 분류
	case PLAYERMISSLE
	case FRIENDMISSLE
	case FOEMISSLE
}


// enum은 기본적으로 상수값을 할당하지 않음
// 그러므로, 나중에 루프문으로 쓰기 위해서 CaseIterable 프로토콜을 쓰자
// 주의 !! 향후 Loop조건문에는 allCases 메소드를 써야겠지
enum MissleType : CaseIterable
{
	// 기본 미사일
	case DEFAULT
	
	// 추적 미사일
	case GUIDE
	
	// 쌍발 미사일
	case DOUBLE
}
