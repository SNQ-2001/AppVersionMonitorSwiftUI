//
//  File.swift
//  
//  
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//  
//

import Foundation

extension String {
    func match(_ pattern: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let matched = regex.firstMatch(in: self, range: NSRange(location: 0, length: self.count))
        else { return [] }
        return (0 ..< matched.numberOfRanges).map {
            NSString(string: self).substring(with: matched.range(at: $0))
        }
    }
}
