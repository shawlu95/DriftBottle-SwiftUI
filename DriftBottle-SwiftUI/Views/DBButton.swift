//
//  DBButton.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import SwiftUI

struct DBButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .font(.custom("chalkduster", size: 16))
                    .foregroundColor(.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
        .opacity(0.9)
    }}

#Preview {
    DBButton(title: "Button", backgroundColor: .blue) {
        // pass
    }
}
