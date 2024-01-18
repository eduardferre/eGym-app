//
//  Extensions.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 18/1/24.
//

import Foundation

// Converts encodable structure to dictionary.
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
