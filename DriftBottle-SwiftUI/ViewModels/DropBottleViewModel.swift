//
//  DropBottleViewModel.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

class DropBottleViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var success: Bool = false
    
    func dropBottle() {
        self.success = false
        if let url = URL(string: APIConstants.dropUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let message = Bottle(
                message: title,
                sender: "Anonymous",
                timestamp: Date().timeIntervalSince1970 * 1000)
            let encoder = JSONEncoder()
            guard let jsonData = try? encoder.encode(message) else {
                return
            }
            
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("error: \(String(describing: error))")
                    return
                }
                if let safeData = data {
                    if let bottle = Bottle.parseJSON(safeData) {
                        DispatchQueue.main.async {
                            print(message)
                            self.success = true
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
