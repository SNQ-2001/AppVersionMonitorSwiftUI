//
//  AppVersionMonitorStatus.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

public enum AppVersionMonitorStatus {
    case updateAvailable
    case updateUnavailable
    case failure(Error)
}

extension AppVersionMonitorStatus: Equatable {
    public static func == (lhs: AppVersionMonitorStatus, rhs: AppVersionMonitorStatus) -> Bool {
        switch (lhs, rhs) {
        case (.updateAvailable, .updateAvailable), (.updateUnavailable, .updateUnavailable):
            return true
        case (.failure(let error1), .failure(let error2)):
            return "\(error1)" == "\(error2)"
        default:
            return false
        }
    }
}
