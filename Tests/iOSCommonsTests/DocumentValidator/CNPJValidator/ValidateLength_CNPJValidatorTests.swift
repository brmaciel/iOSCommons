//
//  ValidateLength_CNPJValidatorTests.swift
//  
//
//  Created by Bruno Maciel on 9/27/21.
//

import XCTest
@testable import iOSCommons

class ValidateLength_CNPJValidatorTests: XCTestCase {
    
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
        let validationStatus = cnpjValidator.validateLength(of: "")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.empty,
                       "validateLength() of an empty CNPJ should return state .empty")
    }
    
    func test_incomplete_document() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validateLength(of: "1")
        let validationStatus2 = cnpjValidator.validateLength(of: "1234567800019")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.incomplete,
                       "validateLength() of a CNPJ with smaller size than document expects should return state .incomplete")
        XCTAssertEqual(validationStatus2,
                       DocumentLengthValidationStatus.incomplete,
                       "validateLength() of a CNPJ with smaller size than document expects should return state .incomplete")
    }
    
    func test_invalid_document() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validateLength(of: "123456780001987")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.invalid,
                       "validateLength() of a CNPJ with size greater than document expects should return state .invalid")
    }
    
    func test_valid_document_size() {
        // Given
        
        // When
        let validationStatus = cnpjValidator.validate("12345678000198")
        let validationStatus2 = cnpjValidator.validate("11111111111111")
        let validationStatus3 = cnpjValidator.validate("abcdefghijklmn")
        let validationStatus4 = cnpjValidator.validate("123456780001a8")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CNPJ with right size should return state .valid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CNPJ with right size should return state .valid")
        XCTAssertEqual(validationStatus3,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CNPJ with right size should return state .valid")
        XCTAssertEqual(validationStatus4,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CNPJ with right size should return state .valid")
    }

}
