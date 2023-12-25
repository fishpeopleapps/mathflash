//
//  MenuView.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/18/23.
//

import SwiftUI

struct MenuView: View {
    @Environment(ViewModel.self) var viewModel
    @AppStorage("LastScore") private var lastScore = 0
    var body: some View {
        VStack {
            Spacer()
            Image(.logo)
                .clipShape(.rect(cornerRadius: 40))
                .padding(.bottom)
                .phaseAnimator([false, true]) { content, phase in
                    content // this is our image
                        .shadow(color: .mint, radius: phase ? 15 : 30)
                } animation: { _ in
                        .easeInOut(duration: 1)
                }
            Text("FLASH MATH")
                .titleStyle()
            Text("Last Score: \(lastScore)")
                .subtitleStyle()
            Button("New Game", action: viewModel.start)
                .buttonStyle(.primary)
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .bgGradient()
    }
}

#Preview {
    MenuView()
        .environment(ViewModel() )
}
