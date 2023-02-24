//
//  APIClient.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

protocol APIClinet {
    func fetch<T>(url: URL) async throws -> T where T: Decodable
}

final class APIClientImpl: APIClinet {
    func fetch<T>(url: URL) async throws -> T where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}

final class APIClientMock: APIClinet {
    var itunes: iTunes

    init(itunes: iTunes = .init(results: [])) {
        self.itunes = itunes
    }

    func fetch<T>(url: URL) async throws -> T where T: Decodable {
        return itunes as! T
    }
}
