//
//  GameOverView.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/18/23.
//

import SwiftUI

struct GameOverView: View {
    @Environment(ViewModel.self) private var viewModel
    var body: some View {
        VStack {
            Text("Game Over!")
                .titleStyle()
            Text("You scored: \(viewModel.questionNum - 1).")
                .subtitleStyle()
            Button("Play Again", action: viewModel.end)
                .buttonStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .bgGradient()
    }
}

#Preview {
    GameOverView()
        .environment(ViewModel())
}
