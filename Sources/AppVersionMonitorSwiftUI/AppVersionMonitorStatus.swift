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
