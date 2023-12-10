//
//  DropBottleView.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import SwiftUI

struct DropBottleView: View {
    @StateObject var viewModel: DropBottleViewModel = DropBottleViewModel()
    @Binding var toDropBottle: Bool
    var body: some View {
        ZStack {
            Image("paper")
                .resizable()
                .scaledToFill()
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .opacity(0.5)
            
            VStack {
                Text("Drop a Bottle")
                    .bold()
                    .font(.custom("chalkduster", size: 24))
                    .padding(.top, 70)
                
                Spacer()
                TextEditor(text: $viewModel.title)
                    .frame(minHeight: 200)
                    .font(.custom("chalkduster", size: 16))
                    .lineSpacing(25)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding()
                
                DBButton(title: "Save") {
                    viewModel.dropBottle()
                }
                
                Spacer()
            }
            .alert(isPresented: $viewModel.success) {
                Alert(
                    title: Text("Success"),
                    message: Text("Drop a bottle successfully"),
                    dismissButton: .default(Text("OK")) {
                        toDropBottle = false
                    })
            }
        }
    }
}

#Preview {
    DropBottleView(toDropBottle: .constant(true))
}
