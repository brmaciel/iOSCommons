//
//  Validate_CPFAndCNPJHybridValidatorTests.swift
//  
//
//  Created by Bruno Maciel on 9/27/21.
//

import XCTest
@testable import iOSCommons

class Validate_CPFAndCNPJHybridValidatorTests: XCTestCase {
    
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
        let validationStatus = hybridValidator.validate(document)
        
        // Then
        XCTAssertEqual(validationStatus,
                       DocumentValidationStatus.empty,
                       "validate() an empty document using HybridValidator should return .empty")
    }
    
    func test_incomplete_cpf_document_number() {
        // Given
        let document = "1"
        let document2 = "1234"
        let document3 = "1234567890"
        
        // When
        let validationStatus = hybridValidator.validate(document)
        let validationStatus2 = hybridValidator.validate(document2)
        let validationStatus3 = hybridValidator.validate(document3)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cpfValidator.validate(document),
                       "validate() an incomplete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
        XCTAssertEqual(validationStatus2,
                       cpfValidator.validate(document2),
                       "validate() an incomplete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
        XCTAssertEqual(validationStatus3,
                       cpfValidator.validate(document3),
                       "validate() an incomplete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
    }
    
    func test_complete_cpf_document_number() {
        // Given
        let document = "12345678901"
        
        // When
        let validationStatus = hybridValidator.validate(document)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cpfValidator.validate(document),
                       "validate() a complete CPF using the HybridValidator should return the same validation status as it was validated by CPFValidator")
    }
    
    func test_incomplete_cnpj_document_number() {
        // Given
        let document = "123456789000"
        let document2 = "1234567800019"
        
        // When
        let validationStatus = hybridValidator.validate(document)
        let validationStatus2 = hybridValidator.validate(document2)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cnpjValidator.validate(document),
                       "validate() an incomplete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
        XCTAssertEqual(validationStatus2,
                       cnpjValidator.validate(document2),
                       "validate() an incomplete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
    }
    
    func test_complete_cnpj_document_number() {
        // Given
        let validDocument = "87473719000128"
        let invalidDocument = "87473719000127"
        
        // When
        let validationStatus = hybridValidator.validate(validDocument)
        let validationStatus2 = hybridValidator.validate(invalidDocument)
        
        // Then
        XCTAssertEqual(validationStatus,
                       cnpjValidator.validate(validDocument),
                       "validate() a complete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
        XCTAssertEqual(validationStatus2,
                       cnpjValidator.validate(invalidDocument),
                       "validate() a complete CNPJ using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
    }
    
    func test_document_number_with_size_greater_than_expected() {
        // Given
        let document = "123456780001987"

        // When
        let validationStatus = cnpjValidator.validate(document)

        // Then
        XCTAssertEqual(validationStatus,
                       cnpjValidator.validate(document),
                       "validate() a CNPJ with a size greater than expected when using the HybridValidator should return the same validation status as it was validated by CNPJValidator")
    }
}
