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
                
                VStack {
                    Spacer()
                    
                    DBButton(title: "Drop a Bottle", backgroundColor: .blue) {
                        viewModel.toDropBottle = true
                    }
                    
                    DBButton(title: "Pickup a Bottle", backgroundColor: .blue) {
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
                if $viewModel.bottle.wrappedValue != nil {
                    PickupBottleView(viewModel: viewModel)
                }
            })
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Ooops!"),
                    message: Text($viewModel.alertMessage.wrappedValue),
                    dismissButton: .default(Text("OK")) {
                        // automatically set showAlert to false
                    })
            }
        }
    }
}

#Preview {
    MainView()
}
