//
//  Bundle+.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

extension Bundle {
    var cfBundleShortVersionString: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
}
