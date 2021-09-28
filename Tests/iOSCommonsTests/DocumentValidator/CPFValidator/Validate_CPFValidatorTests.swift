//
//  Validate_CPFValidatorTests.swift
//  
//
//  Created by Bruno Maciel on 9/26/21.
//

import XCTest
@testable import iOSCommons

class Validate_CPFValidatorTests: XCTestCase {
    
    // MARK: Subject under test
     var cpfValidator: CPFValidator!


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        cpfValidator = CPFValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        cpfValidator = nil
    }


    // MARK: - Tests
    
    func test_empty_document() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.empty,
                       "validate() an empty CPF should return state .empty")
    }
    
    func test_document_with_size_smaller_than_expected_and_only_digits() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("1234567890")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.incomplete,
                       "validate() a CPF with size smaller than document expects should return state .incomplete")
    }
    
    func test_document_with_size_smaller_than_expected_and_invalid_characters() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("abcdefghij")
        let validationStatus2 = cpfValidator.validate("1a34567890")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validate() a CPF with size smaller than document expects and invalid characters should return state .invalid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validate() a CPF with size smaller than document expects and invalid characters should return state .invalid")
    }
    
    func test_document_with_size_greater_than_expected() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("123456789019")
        let validationStatus2 = cpfValidator.validate("1a3456789019")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validate() a CPF with size greater than document expects should return state .invalid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validate() a CPF with size greater than document expects should return state .invalid")
    }
    
    func test_invalid_document_with_right_size() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("12345678901")
        let validationStatus2 = cpfValidator.validate("11111111111")
        let validationStatus3 = cpfValidator.validate("abcdefghijk")
        let validationStatus4 = cpfValidator.validate("123456789a2")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CPF with right size should return state .invalid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CPF with right size should return state .invalid")
        XCTAssertEqual(validationStatus3,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CPF with right size should return state .invalid")
        XCTAssertEqual(validationStatus4,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CPF with right size should return state .invalid")
    }
    
    func test_valid_document() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("12345678909")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.valid,
                       "validate() a valid CPF should return state .valid")
    }

}
