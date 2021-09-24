//
//  DocumentFormatterFactoryTests.swift
//  
//
//  Created by Bruno Maciel on 9/23/21.
//

import XCTest
@testable import iOSCommons

class DocumentFormatterFactoryTests: XCTestCase {
    
    // MARK: Subject under test
    var factory: DocumentFormatterFactory!
    
    
    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        factory = DocumentFormatterFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        factory = nil
    }
    
    
    // MARK: - Tests
    
    func test_create_cpf_formatter() {
        // Given
        
        // When
        let formatter = factory.create(ofType: .cpf)
        
        // Then
        XCTAssert(formatter is CPFFormatter,
                  "create() an cpf formatter using factory should return an instance of CPFFormatter")
    }
    
    func test_create_cnpj_formatter() {
        // Given
        
        // When
        let formatter = factory.create(ofType: .cnpj)
        
        // Then
        XCTAssert(formatter is CNPJFormatter,
                  "create() an CNPJ formatter using factory should return an instance of CNPJFormatter")
    }
    
    func test_create_hybrid_formatter() {
        // Given
        
        // When
        let formatter = factory.create(ofType: .hybridCPFandCNPJ)
        
        // Then
        XCTAssert(formatter is CPFAndCNPJHybridFormatter,
                  "create() an hybrid formatter using factory should return an instance of CPFAndCNPJHybridFormatter")
    }
}
