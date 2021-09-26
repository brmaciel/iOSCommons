//
//  ValidateLength_CPFValidatorTests.swift
//  
//
//  Created by Bruno Maciel on 9/26/21.
//

import XCTest
@testable import iOSCommons

class ValidateLength_CPFValidatorTests: XCTestCase {
    
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
        let validationStatus = cpfValidator.validateLength(of: "")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.empty,
                       "validateLength() of an empty CPF should return state .empty")
    }
    
    func test_incomplete_document() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validateLength(of: "1")
        let validationStatus2 = cpfValidator.validateLength(of: "1234567890")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.incomplete,
                       "validateLength() of a CPF with smaller size than document expects should return state .incomplete")
        XCTAssertEqual(validationStatus2,
                       DocumentLengthValidationStatus.incomplete,
                       "validateLength() of a CPF with smaller size than document expects should return state .incomplete")
    }
    
    func test_invalid_document() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validateLength(of: "123456789019")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.invalid,
                       "validateLength() of a CPF with size greater than document expects should return state .invalid")
    }
    
    func test_valid_document_size() {
        // Given
        
        // When
        let validationStatus = cpfValidator.validate("12345678901")
        let validationStatus2 = cpfValidator.validate("11111111111")
        let validationStatus3 = cpfValidator.validate("abcdefghijk")
        let validationStatus4 = cpfValidator.validate("123456789a2")
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CPF with right size should return state .valid")
        XCTAssertEqual(validationStatus2,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CPF with right size should return state .valid")
        XCTAssertEqual(validationStatus3,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CPF with right size should return state .valid")
        XCTAssertEqual(validationStatus4,
                       DocumentValidationStatus.invalid,
                       "validateLength() of an CPF with right size should return state .valid")
    }

}
