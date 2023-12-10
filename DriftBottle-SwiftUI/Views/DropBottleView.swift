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
            
            VStack {
                Text("Drop a Bottle")
                    .bold()
                    .font(.custom("chalkduster", size: 24))
                    .foregroundColor(.black)
                    .padding(.top, 70)
                
                Spacer()
                
                HStack {
                    Text("From:")
                        .font(.custom("chalkduster", size: 16))
                    TextField("Anonymous", text: $viewModel.sender)
                        .font(.custom("chalkduster", size: 16))
                }
                .padding()
                
                
                TextEditor(text: $viewModel.title)
                    .frame(minHeight: 200, maxHeight: 200)
                    .font(.custom("chalkduster", size: 16))
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(.clear)
                    .cornerRadius(10)
                    .padding()
                
                DBButton(title: "Send") {
                    viewModel.dropBottle()
                }
                
                DBButton(title: "Cancel") {
                    toDropBottle = false
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
