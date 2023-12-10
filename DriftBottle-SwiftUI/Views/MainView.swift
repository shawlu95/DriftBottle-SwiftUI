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
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                VStack {
                    Spacer()
                    
                    DBButton(title: "Drop a Bottle") {
                        viewModel.toDropBottle = true
                    }
                    
                    DBButton(title: "Pickup a Bottle") {
                        viewModel.pickupBottle()
                    }
                }
                .padding()
            }
            .sheet(isPresented: $viewModel.toDropBottle) {
                DropBottleView(toDropBottle: $viewModel.toDropBottle)
            }
        }
    }
}

#Preview {
    MainView()
}
