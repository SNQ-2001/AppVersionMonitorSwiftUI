//
//  Version.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

struct Version {
    let major: Int
    let minor: Int
    let patch: Int

    init(_ major: Int, _ minor: Int, _ patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    init?(_ string: String) {
        let pattern = #"([0-9]+)\.([0-9]+)\.([0-9]+)"#
        let versions = string.match(pattern)
            .compactMap(Int.init)
        guard versions.count == 3 else { return nil }

        self.major = versions[0]
        self.minor = versions[1]
        self.patch = versions[2]
    }
}

extension Version: CustomStringConvertible {
    var description: String {
        "\(major).\(minor).\(patch)"
    }
}

extension Version: Comparable {
    static func < (lhs: Version, rhs: Version) -> Bool {
        lhs.major < rhs.major ||
            lhs.major == rhs.major && lhs.minor < rhs.minor ||
            lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch < rhs.patch
    }
}
