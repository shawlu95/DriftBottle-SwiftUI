//
//  Bottle.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

struct Message: Codable {
    let message: String
    
    static func parseJSON(_ data: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Message.self, from: data)
            return decoded.message
        } catch {
            return nil
        }
    }
}
