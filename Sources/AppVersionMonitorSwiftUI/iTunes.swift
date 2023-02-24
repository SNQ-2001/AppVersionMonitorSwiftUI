//
//  iTunes.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

// MARK: iTunes

struct iTunes: Decodable {
    let results: [iTunesResults]
}

// MARK: iTunesResults

struct iTunesResults: Decodable {
    let version: String
}
