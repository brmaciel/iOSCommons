//
//  Validate_CNPJValidatorTests.swift
//  
//
//  Created by Bruno Maciel on 9/27/21.
//

import XCTest
@testable import iOSCommons

class Validate_CNPJValidatorTests: XCTestCase {
    
    // MARK: Subject under test
     var cnpjValidator: CNPJValidator!


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        cnpjValidator = CNPJValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        cnpjValidator = nil
    }


    // MARK: - Tests
    
    func test_empty_document() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.empty,
                       "validate() an empty CNPJ should return state .empty")
    }
    
    func test_document_with_size_smaller_than_expected_and_only_digits() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("1234567800019")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.incomplete,
                       "validate() a CNPJ with size smaller than document expects should return state .incomplete")
    }
    
    func test_document_with_size_smaller_than_expected_and_invalid_characters() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("abcdefghijklm")
        let validationStatus2 = cnpjValidator.validate("1a34567800019")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validate() a CNPJ with size smaller than document expects and invalid characters should return state .invalid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validate() a CNPJ with size smaller than document expects and invalid characters should return state .invalid")
    }
    
    func test_document_with_size_greater_than_expected() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("12345678000198")
        let validationStatus2 = cnpjValidator.validate("1a345678000198")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validate() a CNPJ with size greater than document expects should return state .invalid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validate() a CNPJ with size greater than document expects should return state .invalid")
    }
    
    func test_invalid_document_with_right_size() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("12345678000198")
        let validationStatus2 = cnpjValidator.validate("11111111111111")
        let validationStatus3 = cnpjValidator.validate("abcdefghijklmn")
        let validationStatus4 = cnpjValidator.validate("123456780001a8")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CNPJ with right size should return state .invalid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CNPJ with right size should return state .invalid")
        XCTAssertEqual(validationStatus3,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CNPJ with right size should return state .invalid")
        XCTAssertEqual(validationStatus4,
                       DocumentValidationStatus.invalid,
                       "validate() an invalid CNPJ with right size should return state .invalid")
    }
    
    func test_valid_document() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("87473719000128")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.valid,
                       "validate() a valid CNPJ should return state .valid")
    }

}
