//
//  PlayingView.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/14/23.
//

import SwiftUI

struct PlayingView: View {
    @Environment(ViewModel.self) var viewModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("End Game", systemImage: "xmark.circle", action: viewModel.end)
                    .foregroundStyle(.white)
                    .labelStyle(.iconOnly)
                    .font(.largeTitle)
                    
            }
            .padding(.horizontal)
            QuestionView()
                .id(viewModel.questionNum) // this changes the view rather than the context, it changes the animation
        }
        .bgGradient()
    }
}

