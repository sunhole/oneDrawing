//
//  StageView.swift
//  oneDrawing
//
//  Created by vision on 12/12/24.
//

import SwiftUI
import RealityKit

struct StageView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 배경 색상
                Color.brown
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                VStack(spacing: 20) {
                    
                    Spacer()
                          .frame(height: 20)
                    
                    HeaderView()
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    // 카드 스크롤 뷰
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(CardData.sampleData, id: \.id) { card in
                                CardView(imageName: card.imageName, title: card.title, subtitle: card.subtitle)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.leading, -30)
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.4) // 동적으로 크기 설정
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                .frame(width: geometry.size.width, height: geometry.size.height) // 전체 뷰 크기를 윈도우 크기에 맞춤
            }
        }
    }
}

// 상단 헤더 뷰
struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("한붓 그리기")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("한붓그리기를 하고 싶은 그림을 선택해주세요.")
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// 카드 뷰
struct CardView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 이미지
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400)
                .background(Color.white.opacity(0.4)) 
                .cornerRadius(20)
                .clipped()
            
            // 텍스트
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .frame(width: 300)
    }
}

// 카드 데이터 모델
struct CardData: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    
    static let sampleData = [
        CardData(imageName: "home", title: "나만의 작은집", subtitle: "나만의 작은집을 한붓으로 그려보세요"),
        CardData(imageName: "hart", title: "사랑", subtitle: "타인에게 사랑을 표현하는 한붓그리기."),
        CardData(imageName: "bird", title: "새", subtitle: "하늘을 자유롭게 날아보세요"),
        CardData(imageName: "light", title: "전구", subtitle: "반짝 빛을 내봐요"),
        CardData(imageName: "cat", title: "고양이", subtitle: "야옹~"),
        CardData(imageName: "dog", title: "강아지", subtitle: "멍멍")
    ]
}
