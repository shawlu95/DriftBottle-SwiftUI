//
//  DBButton.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import SwiftUI

struct DBButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title) {
            action()
        }
        .frame(width: 600)
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .background(Color.blue.opacity(0.7))
        .padding(.bottom, 20)
    }
}

#Preview {
    DBButton(title: "Button") {
        // pass
    }
}
