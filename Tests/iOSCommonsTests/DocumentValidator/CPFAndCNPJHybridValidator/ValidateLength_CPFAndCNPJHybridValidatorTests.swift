//
//  ValidateLength_CPFAndCNPJHybridValidatorTests.swift
//  
//
//  Created by Bruno Maciel on 9/27/21.
//

import XCTest
@testable import iOSCommons

class ValidateLength_CPFAndCNPJHybridValidatorTests: XCTestCase {
    
    // MARK: Subject under test
    var hybridValidator: CPFAndCNPJHybridValidator!
    
    let cpfValidator = CPFValidator()
    let cnpjValidator = CNPJValidator()
    
    
    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        hybridValidator = CPFAndCNPJHybridValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        
        hybridValidator = nil
    }
    
    
    // MARK: - Tests
    
    func test_empty_document() {
        // Given
        let document = ""
        
        // When
        let validationStatus = hybridValidator.validateLength(of: document)
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentLengthValidationStatus.empty,
                       "validateLength() an empty document using HybridValidator should return .empty")
    }
    
    func test_incomplete_cpf_document_number() {
        // Given
        let document = "1"
        let document2 = "1234567890"
        
        // When
        let validationStatus = hybridValidator.validateLength(of: document)
        let validationStatus2 = hybridValidator.validateLength(of: document2)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cpfValidator.validateLength(of: document),
                       "validateLength() an incomplete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
        XCTAssertEqual(validationStatus2,
                       cpfValidator.validateLength(of: document2),
                       "validateLength() an incomplete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
    }
    
    func test_complete_cpf_document_number() {
        // Given
        let document = "12345678901"
        
        // When
        let validationStatus = hybridValidator.validateLength(of: document)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cpfValidator.validateLength(of: document),
                       "validateLength() a complete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
    }
    
    func test_incomplete_cnpj_document_number() {
        // Given
        let document = "123456789000"
        let document2 = "1234567800019"
        
        // When
        let validationStatus = hybridValidator.validateLength(of: document)
        let validationStatus2 = hybridValidator.validateLength(of: document2)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cnpjValidator.validateLength(of: document),
                       "validateLength() an incomplete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
        XCTAssertEqual(validationStatus2,
                       cnpjValidator.validateLength(of: document2),
                       "validateLength() an incomplete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
    }
    
    func test_complete_cnpj_document_number() {
        // Given
        let validDocument = "87473719000128"
        let invalidDocument = "87473719000127"
        
        // When
        let validationStatus = hybridValidator.validateLength(of: validDocument)
        let validationStatus2 = hybridValidator.validateLength(of: invalidDocument)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cnpjValidator.validateLength(of: validDocument),
                       "validateLength() a complete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
        XCTAssertEqual(validationStatus2,
                       cnpjValidator.validateLength(of: invalidDocument),
                       "validateLength() a complete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
    }
    
    func test_document_number_with_size_greater_than_expected() {
        // Given
        let document = "123456780001987"

        // When
        let validationStatus = cnpjValidator.validateLength(of: document)

        // Then
        XCTAssertEqual(validationStatus,
                       cnpjValidator.validateLength(of: document),
                       "validateLength() a CNPJ with a size greater than expected when using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
    }
}
