//
//  OverloadingFunction.swift
//  Game_Test
//
//  Created by SHTeosis on 9/24/24.
//

import Foundation

// 구조체 연산자 오버로딩
// 연산자 오버로딩시 초기값이 들어간 것이 들어가면 에러나는군..
// 거기다가 라벨 형식도 기존 구조체나 클래스 라벨을 따라가야되고..
func + (_ _pos1: Pos, _ _pos2: Pos) -> Pos
{
	return Pos(_x: _pos1.x + _pos2.x, _y: _pos1.y + _pos2.y)
}

func - (_ _pos1: Pos, _ _pos2: Pos) -> Pos
{
	return Pos(_x: _pos1.x - _pos2.x, _y: _pos1.y - _pos2.y)
}

func * (_ _pos1: Pos, _ _pos2: Pos) -> Pos
{
	return Pos(_x: _pos1.x * _pos2.y, _y: _pos1.y * _pos2.y)
}

func * (_ _pos1: Pos, _ _int: Int) -> Pos
{
	return Pos(_x: _pos1.x * _int, _y: _pos1.y * _int)
}

func / (_ _pos1: Pos, _ _pos2: Pos) -> Pos
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

func / (_ _pos1: Pos, _ _int: Int) -> Pos
{
	if _int != 0
	{
		return Pos(_x: _pos1.x / _int, _y: _pos1.y / _int)
	}
	else
	{
		return Pos(_x: _pos1.x, _y: _pos1.y)
	}
}


// 스케일 연산자 오버로딩
func + (_ _scale1: Scale, _ _scale2: Scale) -> Scale
{
	return Scale(_width: (_scale1.width + _scale2.width), _height: (_scale1.height + _scale2.height))
}

func - (_ _scale1: Scale, _ _scale2: Scale) -> Scale
{
	return Scale(_width: (_scale1.width - _scale2.width), _height: (_scale1.height - _scale2.height))
}

func * (_ _scale1: Scale, _ _scale2: Scale) -> Scale
{
	return Scale(_width: (_scale1.width * _scale2.width), _height: (_scale1.height * _scale2.height))
}

func * (_ _scale1: inout Scale, _ _double: Double) -> Scale
{
	return Scale(_width: Int(Double(_scale1.width) * _double), _height: Int(Double(_scale1.height) * _double))
}

func / (_ _scale1: Scale, _ _scale2: Scale) -> Scale
{
	if _scale2.width != 0 || _scale2.height != 0
	{
		return Scale(_width: _scale1.width / _scale2.width, _height: _scale1.height / _scale2.height)
	}
	else
	{
		return Scale(_width: _scale1.width, _height: _scale1.height)
	}
}

func / (_ _scale1: inout Scale, _ _double: Double) -> Scale
{
	if _double != 0
	{
		return Scale(_width: Int(Double(_scale1.width) / _double), _height: Int(Double(_scale1.height) / _double))
	}
	else
	{
		return Scale(_width: _scale1.width, _height: _scale1.height)
	}
}
