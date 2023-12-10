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
                .padding(.top, 70)
            
            Spacer()
            TextEditor(text: $viewModel.title)
                .frame(minHeight: 200)
                .textFieldStyle(.roundedBorder)
                .background(Color.gray.opacity(0.2))
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/) // To visually delineate the text editor's frame
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

#Preview {
    DropBottleView(toDropBottle: .constant(true))
}
