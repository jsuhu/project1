//
//  ContentView.swift
//  project1
//
//  Created by Jingyi Su on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(content: "👻", isFaceUp: true)
            CardView(content: "🎃")
            CardView(content: "😈")
            CardView(content: "🕷️")
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
     
    var body: some View {
        ZStack {
            let base = Circle()//RoundedRectangle(cornerRadius: 12)
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
