//
//  Collection+.swift
//  
//
//  Created by Bruno Maciel on 10/23/20.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
