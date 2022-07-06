//
//  ContentView.swift
//  Memorize
//
//  Created by Anwar Hajji on 28/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoryGameViewModel
    
    let adaptiveGird: [GridItem] = Array(repeating: .init(.adaptive(minimum: 65)), count: 1)
    
    var body: some View {
        VStack {
            CardViewCollection
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var CardViewCollection: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveGird) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
    }
    
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched{
                shape.opacity(0.0)
            } else {
                shape.fill()
            }
        }
    }
    
}



 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGameViewModel()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
