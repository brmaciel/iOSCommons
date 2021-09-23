//
//  ApplyMask_MaskerTests.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import XCTest
@testable import iOSCommons

class ApplyMask_MaskerTests: XCTestCase {

    // MARK: Subject under test
    var masker: Masker!


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        masker = Masker(characterToBeReplaced: "_")
    }
    
    override func tearDown() {
        super.tearDown()
        
        masker = nil
    }


    // MARK: - Tests
    
    func test_string_size_equal_to_what_mask_expects() {
        // Given
        
        // When
        let result = masker.applyMask("___.___", to: "123456")
        let result2 = masker.applyMask("___.___-", to: "123456")
        let result3 = masker.applyMask("-___.___-", to: "123456")
        
        // Then
        XCTAssertEqual(result,
                       "123.456",
                       "applyMask() when string has same size as expected in mask should be right")
        XCTAssertEqual(result2,
                       "123.456-",
                       "applyMask() when string has same size as expected in mask should be right")
        XCTAssertEqual(result3,
                       "-123.456-",
                       "applyMask() when string has same size as expected in mask should be right")
    }
    
    func test_string_size_greater_than_mask_expects() {
        // Given
        
        // When
        let result = masker.applyMask("___.___", to: "1234567")
        let result2 = masker.applyMask("___.___-", to: "1234567")
        
        // Then
        XCTAssertEqual(result,
                       "123.4567",
                       "applyMask() when string has more characters than expected in mask should add extra characters in the end")
        XCTAssertEqual(result2,
                       "123.456-7",
                       "applyMask() when string has more characters than expected in mask should add extra characters in the end")
    }
    
    func test_string_size_smaller_than_mask_expects() {
        // Given
        
        // When
        let result = masker.applyMask("___.___-__", to: "1234567")
        
        // Then
        XCTAssertEqual(result,
                       "123.456-7",
                       "applyMask() when string has less characters than expected in mask should apply mask to only existing characters")
    }
    
    func test_empty_mask() {
        // Given
        
        // When
        let result = masker.applyMask("", to: "1234567")
        
        // Then
        XCTAssertEqual(result,
                       "1234567",
                       "applyMask() when mask is empty should return the input string")
    }
    
    func test_empty_string() {
        // Given
        
        // When
        let result = masker.applyMask("___.___", to: "")
        
        // Then
        XCTAssertEqual(result,
                       "",
                       "applyMask() when input string is empty should return an empty string")
    }
}
