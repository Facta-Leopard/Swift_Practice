//
//  PlayerView.swift
//  Game_Test
//
//  Created by SHTeosis on 9/21/24.
//

import SwiftUI

struct PlayerView: View
{
	@ObservedObject var gameEngine: GameEngine
    var body: some View
	{
		Image(gameEngine.player.imageName)
			.resizable()
			.frame(width: CGFloat(gameEngine.player.scale.width),
				   height: CGFloat(gameEngine.player.scale.height))
			.position(x: CGFloat(gameEngine.player.pos.x), y: CGFloat(gameEngine.player.pos.y))
	}
}
