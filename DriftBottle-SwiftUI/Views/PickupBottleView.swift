//
//  PickupBottleView.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import SwiftUI

struct PickupBottleView: View {
    var bottle: Bottle
    var body: some View {
        VStack(alignment: .leading) {
            Text(bottle.message)
                .padding()
            
            HStack {
                Text("from:")
                    .bold()
                Text(bottle.sender)
            }
            .padding()
            
            HStack {
                Text("date:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: bottle.timestamp / 1000).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
    }
}

#Preview {
    PickupBottleView(bottle: Bottle(message: "Hello", sender: "World", timestamp: Date().timeIntervalSince1970))
}
