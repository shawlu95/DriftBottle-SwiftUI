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
    
    let baseURL = "http://localhost:8080/api/drift_bottle/v1/"
    
    func dropBottle() {
        self.success = false
        if let url = URL(string: baseURL + "drop") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let message = Message(message: title)
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
                    if let message = self.parseJSON(safeData) {
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
