//
//  Bottle.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

struct Bottle: Codable {
    let message: String
    
    static func parseJSON(_ data: Data) -> Bottle? {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Bottle.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }
}
