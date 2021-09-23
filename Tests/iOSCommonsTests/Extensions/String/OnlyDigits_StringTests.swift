//
//  OnlyDigits_StringTests.swift
//  
//
//  Created by Bruno Maciel on 9/22/21.
//

import XCTest
@testable import iOSCommons

class OnlyDigits_StringTests: XCTestCase {
    
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
        let string = ""
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssert(digits.isEmpty,
                  ".onlyDigits when string is empty should always return an empty string")
    }
    
    func test_only_digits_string() {
        // Given
        let string = "1234567890"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssertEqual(string,
                       digits,
                       ".onlyDigits when string has all character digits should always return the string")
    }
    
    func test_string_starts_with_letter() {
        // Given
        let string = "a1234567890"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssertEqual(digits,
                       "1234567890",
                       ".onlyDigits is not returning the right string when string starts with a nonDigit character")
    }
    
    func test_string_ends_with_letter() {
        // Given
        let string = "1234567890a"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssertEqual(digits,
                       "1234567890",
                       ".onlyDigits is not returning the right string when string ends with a nonDigit character")
    }
    
    func test_string_has_one_letter_in_middle() {
        // Given
        let string = "1234a567890"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssertEqual(digits,
                       "1234567890",
                       ".onlyDigits is not returning the right string when string has a nonDigit character in middle")
    }
    
    func test_string_has_many_letters() {
        // Given
        let string = "12b34a567c890d"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssertEqual(digits,
                       "1234567890",
                       ".onlyDigits is not returning the right string when string has many nonDigit characters")
    }
    
    func test_string_has_only_letters() {
        // Given
        let string = "abcdefgh"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssert(digits.isEmpty,
                  ".onlyDigits when string has all character letters should always return an empty string")
    }
    
    func test_string_has_emojis() {
        // Given
        let string = "123😀4567😡890"
        
        // When
        let digits = string.onlyDigits
        
        // Then
        XCTAssertEqual(digits,
                       "1234567890",
                       ".onlyDigits when string has all character letters should always return an empty string")
    }

}
