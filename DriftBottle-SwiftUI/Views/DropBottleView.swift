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
        VStack {
            Text("Drop a Bottle")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100)
            
            Spacer()
            TextField("Message", text: $viewModel.title)
                .padding() 
                .frame(height: 250)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding()

            DBButton(title: "Save") {
                viewModel.dropBottle()
            }
            .padding()
            Spacer()
        }
        .padding(20)
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

#Preview {
    DropBottleView(toDropBottle: .constant(true))
}
