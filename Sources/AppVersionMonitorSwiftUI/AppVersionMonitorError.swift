//
//  AppVersionMonitorError.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

public enum AppVersionMonitorError: Error, LocalizedError {
    case invalidURL
    case invalidID
    case networkError
    case parseError
    case unknown

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .invalidID:
            return "The provided ID is invalid."
        case .networkError:
            return "An error occurred while attempting to access the network."
        case .parseError:
            return "An error occurred while attempting to parse the data."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
