//
//  ApiServices.swift
//  NotBored
//
//  Created by Joaquin Gonzalo Chavez Barbaste on 07-09-22.
//

import Foundation

class ApiServices {
    func activityRequest(type: String) -> ApiResponse {
        return ApiResponse(activity: "Test Activity", accesibility: 1.0, type: "Test Type", participants: 5, price: 0.8, link: "testlink.com", key: "123456")
    }
}
