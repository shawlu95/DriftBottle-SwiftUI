//
//  DropBottleView.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import SwiftUI

struct DropBottleView: View {
    @ObservedObject var viewModel: DropBottleViewModel = DropBottleViewModel()
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
                
                if !viewModel.alertMessage.isEmpty && !viewModel.success {
                    Text(viewModel.alertMessage)
                        .foregroundColor(.red)
                }
                
                HStack {
                    Text("From:")
                    TextField("Anonymous", text: $viewModel.sender)
                }
                .padding()
                
                TextEditor(text: $viewModel.message)
                    .frame(minHeight: 200, maxHeight: 200)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(.clear)
                    .cornerRadius(10)
                    .padding()
                
                DBButton(title: "Send", backgroundColor: .blue) {
                    viewModel.dropBottle()
                }
                
                DBButton(title: "Cancel", backgroundColor: .gray) {
                    toDropBottle = false
                }
                
                Spacer()
            }
            
            .font(.custom("chalkduster", size: 16))
            .alert(isPresented: $viewModel.success) {
                Alert(
                    title: Text("Thank You"),
                    message: Text($viewModel.alertMessage.wrappedValue),
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
