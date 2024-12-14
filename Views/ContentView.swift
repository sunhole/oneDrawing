//
//  ContentView.swift
//  oneDrawing
//
//  Created by vision on 12/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                if showSplash {
                    SplashView()
                } else {
                    ARMainViewContainer()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showSplash = false
                    }
                }
            }
        }
    }
}

