//
//  APIClient.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

final class APIClient {
    static func fetch<T>(url: URL) async throws -> T where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}
