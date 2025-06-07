//
//  LaunchScreenView.swift
//  Proj4-Memory Game
//
//  Created by Brandon Christian on 10/15/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var backgroundColor: Color = .orange
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("Artboard_1_3")
                        .resizable() // Make the image resizable
                        .scaledToFit() // Maintain the aspect ratio
                        .frame(width: 300, height: 700) // Set the desired size
                        .padding()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.3)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                        withAnimation{
                            self.isActive = true
                        }
                        
                    }
                }
                
                .padding()
                
                Spacer()
                
                Text("Name: Brandon Christian")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.bottom, -5)
                Text("Znumber: Z23551360 ")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.bottom, 15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
            .edgesIgnoringSafeArea(.all)
        }
        }
        
        
    
}

#Preview {
    LaunchScreenView()
}
