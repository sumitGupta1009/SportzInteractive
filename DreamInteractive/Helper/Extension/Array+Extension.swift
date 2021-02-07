//
//  Array+Extension.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 07/02/21.
//

import Foundation

extension Array {
    mutating func remove(safeAt index: Index) {
        guard index >= 0, index < count else {
            print("Index out of bounds while deleting item at index \(index) in \(self). This action is ignored.")
            return
        }
        remove(at: index)
    }

    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
