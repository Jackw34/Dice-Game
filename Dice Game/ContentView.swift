//
//  ContentView.swift
//  Dice Game
//
//  Created by Jack W on 11/17/22.
//

import SwiftUI
// fix socring
// fix UI in intructions
// move the scoring for die up
// add better UI for content view
struct ContentView: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    @State private var secondRandomValue = 0
    @State private var secondRotation = 0.0
    @State private var winner = ""
    
    //Sounds
    @ObservedObject private var soundScore = AudioPlayer(name: "HighScore", type: "wav")
    @ObservedObject private var soundLose = AudioPlayer(name: "Lose", type: "wav")
    
    var body: some View {
        // Titile and Instructions view
        NavigationView {
            VStack {
                NavigationLink(destination: Instructions()) {
                    Text("Instructions For The Game")
                        .font(.system(size: 25))
                }
                //first Image
               
                // Second Image
                Image("Second \(secondRandomValue)")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .rotationEffect(.degrees(secondRotation))
                    .rotation3DEffect(.degrees(secondRotation), axis: (x: 1, y: 1, z: 0))
                    .padding()
                    .onTapGesture {
                        secondChooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            secondRotation += 360
                        }
                        // determines winner
                        if randomValue != 0 && secondRandomValue != 0 {
                            if randomValue < secondRandomValue {
                                winner = "Player 1 won"
                                playSound(name: "HighScore")
                            } else if randomValue == secondRandomValue {
                                winner = "Tie"
                                playSound(name: "Lose")
                            }
                        }
                    }
                Spacer()
                Image("pips \(randomValue)")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                    .padding()
                    .onTapGesture {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation += 360
                        }
                        
                        // determines winner
                        if randomValue != 0 && secondRandomValue != 0 {
                            if randomValue > secondRandomValue {
                                winner = "Player 2 won"
                                playSound(name: "HighScore")
                            } else if randomValue == secondRandomValue {
                                winner = "Tie"
                                playSound(name: "Lose")
                            }
                        }
                    }
                Text(winner)
                // Display for the score
                Text("Score")
                    .font(.largeTitle)
                Text("\(secondRandomValue)")
                    .font(.largeTitle)
                Text("\(randomValue)")
                    .font(.largeTitle)
                
                
            }
            .navigationTitle("Roll The Dice Game")
        }
        
    }
    // First random interger generator
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
    }
    // Second random interger generator
    func secondChooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                secondRandomValue = Int.random(in: 1...6)
                secondChooseRandom(times: times - 1)
            }
        }
    }
    func playSound(name : String) {
        switch (name) {
        case "HighScore":
            soundScore.start()
        case "Lose":
            soundLose.start()
        default:
            return
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// end of code 
