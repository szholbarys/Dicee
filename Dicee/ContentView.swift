//
//  ContentView.swift
//  Dicee
//
//  Created by Zholbarys on 11.10.2024.
//

import SwiftUI

struct ContentView: View {
    // State variables to hold the dice images
    @State private var leftDiceNumber = 1
    @State private var rightDiceNumber = 1

    var body: some View {
        VStack {
            Spacer()
            
            // Display two dice images
            HStack {
                Image("dice\(leftDiceNumber)")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                Image("dice\(rightDiceNumber)")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }
            .padding()
            
            Spacer()
            
            // Button to roll the dice
            Button(action: {
                // Randomizing dice numbers
                leftDiceNumber = Int.random(in: 1...6)
                rightDiceNumber = Int.random(in: 1...6)
            }) {
                Text("Roll Dice")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
