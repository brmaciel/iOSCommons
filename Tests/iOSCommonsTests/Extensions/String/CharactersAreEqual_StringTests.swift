//
//  CharactersAreEqual_StringTests.swift
//  
//
//  Created by Bruno Maciel on 9/26/21.
//

import XCTest
@testable import iOSCommons

class CharactersAreEqual_StringTests: XCTestCase {
    
    // MARK: Subject under test


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }


    // MARK: - Tests
    
    func test_empty_string() {
        // Given
        
        // When
        let areEqual = "".charactersAreAllEqual
        
        // Then
        XCTAssertFalse(areEqual,
                       ".charactersAreAllEqual when string is empty should always return false")
    }
    
    func test_one_character_string() {
        // Given
        
        // When
        let areEqual = "a".charactersAreAllEqual
        
        // Then
        XCTAssert(areEqual,
                  ".charactersAreAllEqual when string has only one character should always return true")
    }
    
    func test_only_equal_characters_string() {
        // Given
        
        // When
        let areEqual = "aa".charactersAreAllEqual
        let areEqual2 = "bbbbb".charactersAreAllEqual
        
        // Then
        XCTAssert(areEqual,
                  ".charactersAreAllEqual when string has all characters equal should return true")
        XCTAssert(areEqual2,
                  ".charactersAreAllEqual when string has all characters equal should return true")
    }
    
    func test_one_different_character_string() {
        // Given
        
        // When
        let areEqual = "aaab".charactersAreAllEqual
        let areEqual2 = "baaa".charactersAreAllEqual
        let areEqual3 = "aAaa".charactersAreAllEqual
        
        // Then
        XCTAssertFalse(areEqual,
                       ".charactersAreAllEqual when string has one character different should return true")
        XCTAssertFalse(areEqual2,
                       ".charactersAreAllEqual when string has one character different should return true")
        XCTAssertFalse(areEqual3,
                       ".charactersAreAllEqual when string has one character different should return true")
    }
    
    func test_more_than_one_different_character_string() {
        // Given
        
        // When
        let areEqual = "abcd".charactersAreAllEqual
        let areEqual2 = "aabcd".charactersAreAllEqual
        let areEqual3 = "aabc".charactersAreAllEqual
        let areEqual4 = "aáà".charactersAreAllEqual
        
        // Then
        XCTAssertFalse(areEqual,
                       ".charactersAreAllEqual when string has more than one character different should return true")
        XCTAssertFalse(areEqual2,
                       ".charactersAreAllEqual when string has more than one character different should return true")
        XCTAssertFalse(areEqual3,
                       ".charactersAreAllEqual when string has more than one character different should return true")
        XCTAssertFalse(areEqual4,
                       ".charactersAreAllEqual when string has more than one character different should return true")
    }

}
