//
//  NetworkManagerAsync.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 30/3/23.
//

import SwiftUI

struct NetworkManagerAsync {
    static func getRequest<T: Decodable>(urlString: String, respnseType: T.Type) async throws -> T {
        guard let removedSpaceURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), //This will fill the spaces with the %20
              let url = URL(string: removedSpaceURL) else {
            throw NetworkErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(respnseType, from: data)
        } catch {
            throw NetworkErrors.invalidData
        }
    }
}
