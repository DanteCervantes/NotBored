//
//  File.swift
//  NotBored
//
//  Created by Joaquin Gonzalo Chavez Barbaste on 07-09-22.
//

import Foundation


struct ApiResponse: Codable {
    let activity: String
    let accesibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
}
