//
//  ApiCaller.swift
//  NotBored
//
//  Created by Nicolas Alejandro Ferrero on 07/09/2022.
//

import Foundation

class ApiCaller {
    private static let BASE_URL = "http://www.boredapi.com/api/activity?"
    static let shared = ApiCaller()
    
    func getActivity(participants: Int?, price: Float?, type: Category?, completion: @escaping (Result<Activity, Error>) -> Void) {
        let participantsQuery = participants != nil ? "participants=\(participants!)&" : ""
        let priceQuery = price != nil ? "price=\(price!)&" : ""
        let typeQuery = type != nil ? "type=\(type!)&" : ""
        let urlQuery = "\(ApiCaller.BASE_URL)\(typeQuery)\(priceQuery)\(participantsQuery)"
        guard let url = URL(string: urlQuery) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(Activity.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
