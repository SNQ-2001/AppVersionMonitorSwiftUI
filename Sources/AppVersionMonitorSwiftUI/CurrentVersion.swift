//
//  CurrentVersion.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

protocol CurrentVersion {
    var version: String { get }
}

final class CurrentVersionImpl: CurrentVersion {
    var version: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
}

final class CurrentVersionMock: CurrentVersion {
    var version: String

    init(version: String) {
        self.version = version
    }
}
