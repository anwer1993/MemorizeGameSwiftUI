//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Anwar Hajji on 28/06/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = MemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
