//
//  MathFlashApp.swift
//  MathFlash
//
//  Created by Kimberly Brewer on 12/8/23.
//

import SwiftUI

@main
struct MathFlashApp: App {
    @State private var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
                .preferredColorScheme(.dark)
        }
    }
}
