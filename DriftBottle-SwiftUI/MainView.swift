//
//  MainView.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/9.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.5)
            
            VStack {
                Spacer()
                
                Button("Drop a Bottle") {
                    
                }
                .frame(width: 600)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue.opacity(0.7))
                .padding(.bottom, 20)
                
                Button("Pickup a Bottle") {
                    
                }
                .frame(width: 600)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue.opacity(0.7))
                .padding(.bottom, 20)

            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
