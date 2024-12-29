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
        
        NavigationView {
            ZStack {
                Image("main_screen")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: StageView()) {
                        HStack {
                            Image(systemName: "play.circle.fill")
                                .font(.title)
                            Text("Start")
                                .font(.title2)
                                .bold()
                        }
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color(red: 171/255, green: 60/255, blue: 43/255))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                    .buttonStyle(.plain)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

