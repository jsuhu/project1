//
//  ContentView.swift
//  project1
//
//  Created by Jingyi Su on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    let halloween_emojis = ["👻","🎃","😈","🕷️","👻","🎃","😈","🕷️"]
    let animals_emojis = ["🐱","🐶","🐠","🐯","🐦","🐔","🦁","🐊","🐱","🐶","🐠","🐯","🐦","🐔","🦁","🐊"]
    let sports_emojis = ["🏀","⚽️","⚾️","🏸","🏓","🥌","🏈","🏒","🏀","⚽️","⚾️","🏸","🏓","🥌","🏈","🏒"]

    @State var emojis: Array<String> = []
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                cards
            }
            //Spacer()
            //cardCountAdjusters
            Spacer()
            themeAdjusters
        }
        .padding()
    }
    
    var themeAdjusters: some View {
        HStack {
            theme1
            Spacer()
            theme2
            Spacer()
            theme3
        }
        .imageScale(.medium)
        .font(.largeTitle)
        
    }
    
    func cardThemeAdjuster(by themecards: Array<String>, symbol: String) -> some View {
        Button(action: {
            emojis = []
            emojis += themecards.shuffled()
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(emojis == themecards)
    }
    
    var theme1: some View {
        VStack {
            cardThemeAdjuster(by: halloween_emojis, symbol: "moon.circle.fill")
            Text("Halloween").font(.footnote)
        }
    }
    
    var theme2: some View {
        VStack {
            cardThemeAdjuster(by: animals_emojis, symbol: "pawprint.circle.fill")
            Text("Animal").font(.footnote)
        }
    }
    
    var theme3: some View {
        VStack {
            cardThemeAdjuster(by: sports_emojis, symbol: "football.circle.fill")
            Text("Sports").font(.footnote)
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(0..<emojis.count, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")

    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
     
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) //Circle()
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture { //(count: 2)
            isFaceUp.toggle()
            //print("tapped")
        }
    }
}

#Preview {
    ContentView()
}
