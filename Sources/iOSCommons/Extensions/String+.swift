//
//  String+.swift
//  
//
//  Created by Bruno Maciel on 8/15/20.
//

import Foundation

public extension String {
    struct IndexOutOfRange: Error {}
    
    private func containsIndex(_ index: Int) -> Bool {
        return index >= 0 && index < self.count
    }
    
    /**
     Return character at an index unsafely. If index doesn't exist, there will be a run time error
     
     - Attention: Only use this subscript if you are sure that the index exists. Otherwise, is recomended to use the `safe` subscript.
     - Returns: Character at informed index.
     */
    subscript (unsafe index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    /**
     Try to return character at an index safely.
     - Returns: Character at informed index. If index doesn't exist, returns nil
     */
    subscript (safe index: Int) -> Character? {
        return containsIndex(index) ? self[unsafe: index] : nil
    }
    
    /**
     Filter string looking for digits. Returns a string containing only digits
     */
    var onlyDigits: String {
        guard !isEmpty else { return "" }
        
        return replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: startIndex..<endIndex)
    }
    
    /**
     Insert a string at a specified index. Throws an error if index doesn't exist.
     - Parameters:
        - string: string to be inserted
        - index: position the new string should be inserted
     */
    mutating func insert(_ string: String, at index: Int) throws {
        guard index >= 0, index <= self.count else { throw IndexOutOfRange() }
        
        self.insert(contentsOf: string, at: self.index(self.startIndex, offsetBy: index))
    }
    
    /**
     Remove the character at a specified index from the string. Throws an error if index doesn't exist.
     - Parameters:
        - index: position of the character to be removed
     */
    @discardableResult
    mutating func remove(at index: Int) throws  -> Character {
        guard containsIndex(index) else { throw IndexOutOfRange() }
        
        return self.remove(at: self.index(self.startIndex, offsetBy: index))
    }
}
