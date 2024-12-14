//
//  ARMainViewContainer.swift
//  oneDrawing
//
//  Created by vision on 12/12/24.
//

import SwiftUI

struct ARMainViewContainer: View {
    @State private var isStageViewActive = false
    
    var body: some View {
        ZStack {
            Image("main_screen")
                .resizable()
                .scaledToFill()
                .clipped()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isStageViewActive = true // 상태 변경으로 뷰 전환 트리거
                    }
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                        Text("Start")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    .frame(width: 250, height: 50) // 버튼 크기 설정
                    .background(Color(red: 171/255, green: 60/255, blue: 43/255))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
                .buttonStyle(.plain)
                .padding(.bottom, 40) // 하단에서 20만큼 떨어지도록 설정
            }
            
            if isStageViewActive {
                StageView(isActive: isStageViewActive) // StarModelView에 바인딩 전달
                    .transition(.move(edge: .trailing)) // 화면 오른쪽에서 슬라이드 애니메이션
            }
        }
    }
}
