//
//  AppVersionMonitorSwiftUI.swift
//
//
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//
//

import SwiftUI

public extension View {
    func appVersionMonitor(id: Int, perform: ((AppVersionMonitorStatus) -> Void)?) -> some View {
        self.onAppear {
            if let perform {
                Task.detached {
                    let status = await AppVersionMonitorSwiftUI.appVersionMonitor(id: id)
                    perform(status)
                }
            }
        }
    }
}

final class AppVersionMonitorSwiftUI {
    static func appVersionMonitor(
        apiClient: APIClinet = APIClientImpl(),
        currentVersion: CurrentVersion = CurrentVersionImpl(),
        id: Int
    ) async -> AppVersionMonitorStatus {
        do {
            guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(id)") else {
                return .failure(AppVersionMonitorError.invalidURL)
            }
            let itunes = try await apiClient.fetch(url: url) as iTunes
            guard let itunesResult = itunes.results.first else {
                return .failure(AppVersionMonitorError.invalidID)
            }
            guard let itunesVersion = Version(itunesResult.version) else {
                return .failure(AppVersionMonitorError.invalidVersionFormat)
            }
            guard let currentVersion = Version(currentVersion.version) else {
                return .failure(AppVersionMonitorError.invalidVersionFormat)
            }
            if currentVersion == itunesVersion {
                return .updateUnavailable
            } else if currentVersion > itunesVersion {
                return .updateUnavailable
            } else if currentVersion < itunesVersion {
                return .updateAvailable
            } else {
                return .failure(AppVersionMonitorError.unknown)
            }
        } catch {
            return .failure(AppVersionMonitorError.networkError)
        }
    }
}
