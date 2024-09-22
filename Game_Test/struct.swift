//
//  Pos.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import Foundation
import SwiftUI

// 핸드폰 기기에 따른 전체화면 크기 확인
// SwiftUI 프레임워크는 UIScreen으로 어떤 기기든 화면크기 확인하기 위함
let screenBounds = UIScreen.main.bounds

// 전체화면 가로 길이
let deviceWidth = screenBounds.width

// 전체화면 세로 길이
let deviceHeight = screenBounds.height

// 좌표
struct Pos
{
	var x: Int
	var y: Int
	var z: Int = 0
	
	// 화면 중앙 좌표 초기화
	init()
	{
		x = Int(deviceWidth / 2)
		y = Int(deviceHeight / 2)
	}
	init(_x: Any, _y: Any)
	{
		x = _x as? Int ?? 0
		y = _y as? Int ?? 0
	}
	
	// 좌표계 업데이트
	// 구조체 값을 바꾸려면 mutating을 붙혀야 한다는 걸 처음 알았네.. 이거 떄문에 또 몇시간 삽질...
	mutating func Update(_Pos : Pos)
	{
		
		x += _Pos.x
		y += _Pos.y
	}
}

// 크기
struct Scale
{
	var width: Int
	var height: Int
	
	init()
	{
		width = 75
		height = 75
	}
	init(_width: Int, _height: Int)
	{
		width = _width
		height = _height
	}
	
}

// 속도
struct Velocity
{
	var x: Double
	var y: Double
	var z: Double = 0
	
	init()
	{
		x = 0
		y = 0
	}
	init(_x : Double, _y: Double)
	{
		x = _x
		y = _y
	}
	
}

// 가속도계 구조체(자이로스코프 및 가속계 사용용도)
struct Accel
{
	var x: Double
	var y: Double
	var z: Double
	
	init()
	{
		x = 0
		y = 0
		z = 0
	}
	init(_x: Double, _y: Double, _z: Double)
	{
		x = _x
		y = _y
		z = _z
	}
}


// 연산자 오버로딩
// 연산자 오버로딩시 초기값이 들어간 것이 들어가면 에러나는군..
// 거기다가 라벨 형식도 기존 구조체나 클래스 라벨을 따라가야되고..
func + (_pos1: Pos, _pos2: Pos) -> Pos
{
	return Pos(_x: _pos1.x + _pos2.x, _y: _pos1.y + _pos2.y)
}

func - (_pos1: Pos, _pos2: Pos) -> Pos
{
	return Pos(_x: _pos1.x - _pos2.x, _y: _pos1.y - _pos2.y)
}

func * (_pos1: Pos, _pos2: Pos) -> Pos
{
	return Pos(_x: _pos1.x * _pos2.y, _y: _pos1.y * _pos2.y)
}

func / (_pos1: Pos, _pos2: Pos) -> Pos
{
	if _pos2.x != 0 || _pos2.y != 0
	{
		return Pos(_x: _pos1.x / _pos2.x, _y: _pos1.y / _pos2.y)
	}
	else
	{
		return Pos(_x: _pos1.x, _y: _pos1.y)
	}
}


