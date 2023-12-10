//
//  MainViewModel.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var bottle: Message?
    @Published var toDropBottle: Bool = false
    @Published var didPickupBottle: Bool = false
    
    func pickupBottle() {
        if let url = URL(string: APIConstants.pickupUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("error: \(String(describing: error))")
                    return
                }
                if let safeData = data {
                    if let message = Message.parseJSON(safeData) {
                        DispatchQueue.main.async {
                            print(self.bottle?.message ?? "none")
                            self.bottle = Message(message: message)
                            self.didPickupBottle = true
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
