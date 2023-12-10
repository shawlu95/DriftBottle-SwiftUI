//
//  PickupBottleView.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import SwiftUI

struct PickupBottleView: View {
    var message: String
    var body: some View {
        Text(message)
            .padding()
    }
}

#Preview {
    PickupBottleView(message: "From the heart of Silicon Valley, where dreams are made. Remember, every big journey starts with a simple step.")
}
