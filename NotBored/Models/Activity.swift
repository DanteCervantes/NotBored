//
//  Activity.swift
//  NotBored
//
//  Created by Nicolas Alejandro Ferrero on 07/09/2022.
//

import Foundation

struct Activity: Codable {
    var activity: String
    var type: Category
    var participants: Int
    var price: Float
    var link: String?
    var key: String
    var accessibility: Float
    
    var priceToString: String {
        switch price {
            case 0: return "Free"
            case 0..<0.3: return "Low"
            case 0.3..<0.6: return "Medium"
            case 0.6...1: return "High"
            default: return ""
        }
    }
}
