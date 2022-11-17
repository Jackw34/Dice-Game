//
//  ContentView.swift
//  Dice Game
//
//  Created by Jack W on 11/17/22.
//

import SwiftUI
// add a scoring system
// add a multiplayer function
// add a instruction view
// plays sound once dice is rolled
// both dice display different dice
struct ContentView: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    @State private var secondRandomValue = 0
    @State private var secondRotation = 0.0
    var body: some View {
        NavigationView {
            
            NavigationLink(destination: Text("In order to roll tap on the dice.")){
                Text("Instructions")
                
            }
            .navigationTitle("Roll The Dice Game")
        }
        VStack {
            
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
                }
            Spacer()
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
                }
        }
        
        
    }
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
    }
    func secondChooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                secondRandomValue = Int.random(in: 1...6)
                secondChooseRandom(times: times - 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
