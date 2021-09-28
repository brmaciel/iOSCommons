//
//  DocumentValidatorFactoryTests.swift
//  
//
//  Created by Bruno Maciel on 9/27/21.
//

import XCTest
@testable import iOSCommons

class DocumentValidatorFactoryTests: XCTestCase {
    
    // MARK: Subject under test
    var factory: DocumentValidatorFactory!
    
    
    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        factory = DocumentValidatorFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        factory = nil
    }
    
    
    // MARK: - Tests
    
    func test_create_cpf_validator() {
        // Given
        
        // When
        let validator = factory.create(ofType: .cpf)
        
        // Then
        XCTAssert(validator is CPFValidator,
                  "create() an cpf validator using factory should return an instance of CPFValidator")
    }
    
    func test_create_cnpj_validator() {
        // Given
        
        // When
        let validator = factory.create(ofType: .cnpj)
        
        // Then
        XCTAssert(validator is CNPJValidator,
                  "create() an CNPJ validator using factory should return an instance of CNPJValidator")
    }
    
    func test_create_hybrid_validator() {
        // Given
        
        // When
        let validator = factory.create(ofType: .hybridCPFandCNPJ)
        
        // Then
        XCTAssert(validator is CPFAndCNPJHybridValidator,
                  "create() an hybrid validator using factory should return an instance of CPFAndCNPJHybridValidator")
    }
}

