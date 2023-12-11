//
//  ContentView.swift
//  project1
//
//  Created by Jingyi Su on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻","🎃","😈","🕷️","👻","🎃","😈","🕷️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) {index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)

            
            HStack {
                
                Button(action: {
                    cardCount -= 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                
                Spacer()

                Button(action: {
                    cardCount -= 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
     
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) //Circle()
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture { //(count: 2)
            isFaceUp.toggle()
            print("tapped")
        }
    }
}

#Preview {
    ContentView()
}
