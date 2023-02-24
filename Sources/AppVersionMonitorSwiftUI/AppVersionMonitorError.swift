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
    case invalidVersionFormat
    case networkError
    case unknown

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .invalidID:
            return "The provided ID is invalid."
        case .invalidVersionFormat:
            return "The specified version format is invalid. Please use Semantic Versioning format."
        case .networkError:
            return "An error occurred while attempting to access the network."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
