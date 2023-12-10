//
//  MainViewModel.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var bottle: Bottle?
    @Published var toDropBottle: Bool = false
    @Published var didPickupBottle: Bool = false
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func pickupBottle() {
        alertMessage = ""
        if let url = URL(string: APIConstants.pickupUrl) {
            var request = URLRequest(url: url)
            request.timeoutInterval = 3
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, err) in
                guard err == nil else {
                    DispatchQueue.main.async {
                        self.showAlert = true
                        self.alertMessage = "Found nothing, try again later!"
                    }
                    return
                }
                if let safeData = data {
                    if let bottle = Bottle.parseJSON(safeData) {
                        DispatchQueue.main.async {
                            self.bottle = bottle
                            self.didPickupBottle = true
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
