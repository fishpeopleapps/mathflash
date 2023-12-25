//
//  ContentView.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) var viewModel
    var body: some View {
        switch viewModel.playState {
        case .menu:
            MenuView()
        case .playing:
            PlayingView()
        case .gameOver:
            GameOverView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
