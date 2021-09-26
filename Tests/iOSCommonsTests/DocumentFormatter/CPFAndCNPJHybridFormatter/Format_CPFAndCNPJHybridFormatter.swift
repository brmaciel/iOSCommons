//
//  Format_CPFAndCNPJHybridFormatter.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import XCTest
@testable import iOSCommons

class Format_CPFAndCNPJHybridFormatterTests: XCTestCase {
    
    // MARK: Subject under test
    var hybridFormatter: CPFAndCNPJHybridFormatter!
    
    let cpfFormatter = CPFFormatter()
    let cnpjFormatter = CNPJFormatter()
    
    
    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        hybridFormatter = CPFAndCNPJHybridFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
        
        hybridFormatter = nil
    }
    
    
    // MARK: - Tests
    
    func test_empty_document() {
        // Given
        let document = ""
        
        // When
        let formattedDocument = hybridFormatter.format(document)
        
        // Then
        XCTAssertEqual(formattedDocument,
                       cpfFormatter.format(document),
                       "format() an empty document using HybridFormatter should return the same string as it was formatted by CPFFormatter")
    }
    
    func test_incomplete_cpf_document_number() {
        // Given
        let document = "1"
        let document2 = "1234"
        let document3 = "1234567890"
        
        // When
        let formattedDocument = hybridFormatter.format(document)
        let formattedDocument2 = hybridFormatter.format(document2)
        let formattedDocument3 = hybridFormatter.format(document3)
        
        // Then
        XCTAssertEqual(formattedDocument,
                       cpfFormatter.format(document),
                       "format() an incomplete CPF using the HybridFormatter should return the same string as it was formatted by CPFFormatter")
        XCTAssertEqual(formattedDocument2,
                       cpfFormatter.format(document2),
                       "format() an incomplete CPF using the HybridFormatter should return the same string as it was formatted by CPFFormatter")
        XCTAssertEqual(formattedDocument3,
                       cpfFormatter.format(document3),
                       "format() an incomplete CPF using the HybridFormatter should return the same string as it was formatted by CPFFormatter")
    }
    
    func test_complete_cpf_document_number() {
        // Given
        let document = "12345678901"
        
        // When
        let formattedDocument = hybridFormatter.format(document)
        
        // Then
        XCTAssertEqual(formattedDocument,
                       cpfFormatter.format(document),
                       "format() a complete CPF using the HybridFormatter should return the same string as it was formatted by CPFFormatter")
    }
    
    func test_incomplete_cnpj_document_number() {
        // Given
        let document = "123456789000"
        let document2 = "1234567800019"
        
        // When
        let formattedDocument = hybridFormatter.format(document)
        let formattedDocument2 = hybridFormatter.format(document2)
        
        // Then
        XCTAssertEqual(formattedDocument,
                       cnpjFormatter.format(document),
                       "format() an incomplete CNPJ using the HybridFormatter should return the same string as it was formatted by CNPJFormatter")
        XCTAssertEqual(formattedDocument2,
                       cnpjFormatter.format(document2),
                       "format() an incomplete CNPJ using the HybridFormatter should return the same string as it was formatted by CNPJFormatter")
    }
    
    func test_document_number_with_size_greater_than_expected() {
        // Given
        let document = "123456780001987"

        // When
        let formattedDocument = cnpjFormatter.format(document)

        // Then
        XCTAssertEqual(formattedDocument,
                       cnpjFormatter.format(document),
                       "format() a CNPJ with a size greater than expect when using the HybridFormatter should return the same string as it was formatted by CNPJFormatter")
    }
}
