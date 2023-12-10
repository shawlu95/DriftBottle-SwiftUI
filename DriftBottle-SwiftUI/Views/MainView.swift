//
//  MainView.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/9.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
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
                    viewModel.dropBottle(message: "TEST")
                }
                .frame(width: 600)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue.opacity(0.7))
                .padding(.bottom, 20)
                
                Button("Pickup a Bottle") {
                    viewModel.pickupBottle()
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
