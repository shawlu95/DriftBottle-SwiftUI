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
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height)
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
                    .padding(.bottom, 50)
                }
                .padding()
            }
            .sheet(isPresented: $viewModel.toDropBottle) {
                DropBottleView(toDropBottle: $viewModel.toDropBottle)
            }
            .sheet(isPresented: $viewModel.didPickupBottle, content: {
                PickupBottleView(message: viewModel.bottle?.message ?? "Nothing")
            })
        }
    }
}

#Preview {
    MainView()
}
