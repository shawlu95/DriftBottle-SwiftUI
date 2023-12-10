//
//  Constant.swift
//  DriftBottle-SwiftUI
//
//  Created by main on 2023/12/10.
//

import Foundation

struct APIConstants {
    static let baseUrl = "https://shawlu95-sandbox-a6f73a3d16cd.herokuapp.com/api/drift_bottle/v1/"
//    static let baseUrl = "http://localhost:8080/api/drift_bottle/v1/"
    
    static let pickupUrl = baseUrl + "pickup"
    static let dropUrl = baseUrl + "drop"
}
