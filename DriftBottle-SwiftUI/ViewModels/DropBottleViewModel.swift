//
//  DropBottleViewModel.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

class DropBottleViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var sender: String = "Anonymous"
    @Published var success: Bool = false
    @Published var alertMessage: String = ""
    
    func dropBottle() {
        guard validate() else {
            return
        }
        
        self.success = false
        if let url = URL(string: APIConstants.dropUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let message = Bottle(
                message: message,
                sender: sender,
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
                    if let resp = Bottle.parseJSON(safeData) {
                        DispatchQueue.main.async {
                            self.success = true
                            self.alertMessage = resp.message
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    private func validate() -> Bool{
        guard message.count > 20 else {
            alertMessage = "Write at least 20 character!"
            return false
        }
        
        guard !sender.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMessage = "Please enter sender!"
            return false
        }
        return true
    }
}
