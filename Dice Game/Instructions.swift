//
//  Instructions.swift
//  Dice Game
//
//  Created by Jack W on 11/18/22.
//

import SwiftUI

struct Instructions: View {
    var body: some View {
        // Instructions
        ZStack {
            Text("In order to play the game one player must roll one of the die and the other rolls the second one. In order to win, the player with the highest number after their first roll wins. If you both get the same number that would result in a tie and another game would have to be played for a winnter to be decided.")
                .padding(40)
                .font(.system(size: 25))
                .minimumScaleFactor(0.01)
        }
    }
}
struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
