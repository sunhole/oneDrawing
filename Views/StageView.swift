//
//  StageView.swift
//  oneDrawing
//
//  Created by vision on 12/12/24.
//

import SwiftUI
import RealityKit

struct StageView: View {
    @State var isActive: Bool
    
    var body: some View {
           ZStack {
               Color.black.ignoresSafeArea()

               VStack {
                   RealityView { content in
                       let box = ModelEntity(mesh: .generateBox(size: 0.5))
                       
                       // 박스에 색상 재질 추가
                       box.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
                       box.position = SIMD3<Float>(0, 1.0, -2.0) // 카메라 앞으로 이동
                       print("Adding box to RealityView")
                       content.add(box)
                   }
                   .frame(width: 300, height: 300)
                   
                   Spacer()
               }
           }
           .gesture(
               DragGesture()
                   .onChanged { value in
                       print("Drag location: \(value.location)")
                   }
           )
       }
   }
