//
//  SplashView.swift
//  oneDrawing
//
//  Created by vision on 12/12/24.
//

import SwiftUI

struct SplashView: View {
    @State private var opacity: Double = 0.5
    
    var body: some View {
        ZStack {
            Color.white // 배경 색
                .ignoresSafeArea()
            
            VStack {
                Image("splash_logo") // 회사 로고 이미지
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200) // 로고 크기
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                            opacity = 1.0
                        }
                    }
            }
        }
    }
}
