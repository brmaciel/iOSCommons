//
//  UnsafeSubscript_StringTests.swift
//  
//
//  Created by Bruno Maciel on 9/26/21.
//

import XCTest
@testable import iOSCommons

class UnsafeSubscript_StringTests: XCTestCase {
    
    // MARK: Subject under test
    
    
    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    func test_first_index() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[unsafe: 0]
        
        // Then
        XCTAssertEqual(character,
                       "a",
                       "[unsafe: index] when index is 0 should return first character")
    }
    
    func test_middle_index() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[unsafe: 2]
        
        // Then
        XCTAssertEqual(character,
                       "c",
                       "[unsafe: index] when index is in middle should return the character in the corresponding position")
    }
    
    func test_end_index() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[unsafe: 4]
        
        // Then
        XCTAssertEqual(character,
                       "e",
                       "[unsafe: index] when index is the last index should return last character")
    }
}
