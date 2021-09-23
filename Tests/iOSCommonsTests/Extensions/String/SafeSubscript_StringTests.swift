//
//  SafeSubscript_StringTests.swift
//  
//
//  Created by Bruno Maciel on 9/22/21.
//

import XCTest
@testable import iOSCommons

class SafeSubscript_StringTests: XCTestCase {
    
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
        let character = string[safe: 0]
        
        // Then
        XCTAssertEqual(character,
                       "a",
                       "[safe: index] when index is 0 should return first character")
    }
    
    func test_middle_index() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[safe: 2]
        
        // Then
        XCTAssertEqual(character,
                       "c",
                       "[safe: index] when index is in middle should return the character in the corresponding position")
    }
    
    func test_end_index() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[safe: 4]
        
        // Then
        XCTAssertEqual(character,
                       "e",
                       "[safe: index] when index is the last index should return last character")
    }
    
    func test_negative_index() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[safe: -1]
        
        // Then
        XCTAssertNil(character,
                     "[safe: index] when index is negative should always return nil")
    }
    
    func test_index_beyond_string_size() {
        // Given
        let string = "abcde"
        
        // When
        let character = string[safe: 5]
        
        // Then
        XCTAssertNil(character,
                     "[safe: index] when index is beyond string size should always return nil")
    }
}
