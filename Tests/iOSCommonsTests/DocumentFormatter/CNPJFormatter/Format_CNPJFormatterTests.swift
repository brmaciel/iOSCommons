//
//  Format_CNPJFormatterTests.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import XCTest
@testable import iOSCommons

class Format_CNPJFormatterTests: XCTestCase {
    
    // MARK: Subject under test
    var cnpjFormatter: CNPJFormatter!


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        cnpjFormatter = CNPJFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
        
        cnpjFormatter = nil
    }


    // MARK: - Tests
    
    func test_empty_document() {
        // Given
        
        // When
        let formattedDocument = cnpjFormatter.format("")
        
        // Then
        XCTAssert(formattedDocument.isEmpty,
                  "format() an empty CNPJ should return an empty string")
    }
    
    func test_incomplete_document_number() {
        // Given
        
        // When
        let formattedDocument = cnpjFormatter.format("12")
        let formattedDocument2 = cnpjFormatter.format("1234")
        let formattedDocument3 = cnpjFormatter.format("1234567800019")
        
        // Then
        XCTAssertEqual(formattedDocument,
                       "12.",
                       "format() an incomplete CNPJ should return a partially formatted string")
        XCTAssertEqual(formattedDocument2,
                       "12.34",
                       "format() an incomplete CNPJ should return a partially formatted string")
        XCTAssertEqual(formattedDocument3,
                       "12.345.678/0001-9",
                       "format() an incomplete CNPJ should return a partially formatted string")
    }
    
    func test_complete_document_number() {
        // Given
        
        // When
        let formattedDocument = cnpjFormatter.format("12345678000198")
        
        // Then
        XCTAssertEqual(formattedDocument,
                       "12.345.678/0001-98",
                       "format() a complete CNPJ should return a completely formatted string")
    }
    
    func test_document_number_with_size_greater_than_expected() {
        // Given
        
        // When
        let formattedDocument = cnpjFormatter.format("123456780001987")
        
        // Then
        XCTAssertEqual(formattedDocument,
                       "12.345.678/0001-98",
                       "format() a CNPJ with a size greater than expected should truncate the extra characters")
    }
}
