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
    
//    let baseURL = "https://shawlu95-sandbox-a6f73a3d16cd.herokuapp.com/api/drift_bottle/v1/"
    let baseURL = "http://localhost:8080/api/drift_bottle/v1/"
    
    func pickupBottle() {
        if let url = URL(string: baseURL + "pickup") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("error: \(String(describing: error))")
                    return
                }
                if let safeData = data {
                    if let message = self.parseJSON(safeData) {
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
    
    func parseJSON(_ data: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Message.self, from: data)
            return decoded.message
        } catch {
            return nil
        }
    }
}
