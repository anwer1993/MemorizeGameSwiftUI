//
//  ContentView.swift
//  Memorize
//
//  Created by Anwar Hajji on 28/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    var Vehicles = ["🚕", "🚞", "🚁", "🛳","🚠", "🛵", "🚐", "🛶","🛴", "🏎", "🚌", "🚔","🚂", "⛵️", "🚀", "🚤"]
    
    var flags = ["🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇫", "🇿🇦", "🇦🇱", "🇩🇿", "🇩🇪", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇮🇴", "🇧🇭", "🇧🇩", "🇨🇦", "🇧🇷", "🇰🇷", "🇬🇹", "🇵🇹"]
    
    var objects = ["⌚️", "📱", "💻", "⌨️","🖥", "🖨", "🖱", "🕹","📹", "📺", "🧭", "☎️","🧯", "📡", "🎙", "📟", "📸"]
    
    @State var selectedTheme: [String] = []
    @State var random: Int = 0
    
    let adaptiveGird: [GridItem] = Array(repeating: .init(.adaptive(minimum: 65)), count: 1)
    
    var body: some View {
        VStack {
            title
            CardViewCollection
            Spacer()
            menu
        }
        .padding(.horizontal)
    }
    
    var CardViewCollection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: adaptiveGird) {
                if selectedTheme.isEmpty {
                    buildCardView(themeList: Vehicles, random: Int.random(in: 4...Vehicles.count))
                } else {
                    buildCardView(themeList: selectedTheme, random: random)
                }
            }
        }
        .foregroundColor(.red)
    }
    
    @ViewBuilder
    func buildCardView (themeList: [String], random: Int) -> some View {
        ForEach(themeList[0..<random], id: \.self) { emoji in
                return CardView(content: emoji)
                .aspectRatio(2/3, contentMode: .fit)
        }
    }
    
    var menu: some View {
        HStack(spacing: 60) {
            VehiclesTheme
            FlagsTheme
            ObjectsTheme
        }
        .foregroundColor(.blue)
    }
    
    var VehiclesTheme: some View {
        VStack {
            Button {
                selectedTheme = Vehicles.shuffled()
                random = Int.random(in: 4...Vehicles.count)
            } label: {
                Image(systemName: "car.fill")
            }
            .font(.largeTitle)
            Text("Vehicles")
        }
    }
    
    var FlagsTheme: some View {
        VStack {
            Button {
                selectedTheme = flags.shuffled()
                random = Int.random(in: 4...flags.count)
            } label: {
                Image(systemName: "flag.fill")
            }
            .font(.largeTitle)
            Text("Flags")
        }
        
    }
    
    var ObjectsTheme: some View {
        VStack {
            Button {
                selectedTheme = objects.shuffled()
                random = Int.random(in: 4...objects.count)
            } label: {
                Image(systemName: "display")
            }
            .font(.largeTitle)
            Text("Objects")
        }
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
}






struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
