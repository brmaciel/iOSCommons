//
//  Format_CPFFormatterTests.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import XCTest
@testable import iOSCommons

class Format_CPFFormatterTests: XCTestCase {

    // MARK: Subject under test
    var cpfFormatter: CPFFormatter!


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
        
        cpfFormatter = CPFFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
        
        cpfFormatter = nil
    }


    // MARK: - Tests
    
    func test_empty_document() {
        // Given
        
        // When
        let formattedDocument = cpfFormatter.format("")
        
        // Then
        XCTAssert(formattedDocument.isEmpty,
                  "format() an empty CPF should return an empty string")
    }
    
    func test_incomplete_document_number() {
        // Given
        
        // When
        let formattedDocument = cpfFormatter.format("123")
        let formattedDocument2 = cpfFormatter.format("1234")
        let formattedDocument3 = cpfFormatter.format("1234567890")
        
        // Then
        XCTAssertEqual(formattedDocument,
                       "123.",
                       "format() an incomplete CPF should return a partially formatted string")
        XCTAssertEqual(formattedDocument2,
                       "123.4",
                       "format() an incomplete CPF should return a partially formatted string")
        XCTAssertEqual(formattedDocument3,
                       "123.456.789-0",
                       "format() an incomplete CPF should return a partially formatted string")
    }
    
    func test_complete_document_number() {
        // Given
        
        // When
        let formattedDocument = cpfFormatter.format("12345678901")
        
        // Then
        XCTAssertEqual(formattedDocument,
                       "123.456.789-01",
                       "format() a complete CPF should return a completely formatted string")
    }
    
    func test_document_number_with_size_greater_than_expected() {
        // Given
        
        // When
        let formattedDocument = cpfFormatter.format("123456789012")
        
        // Then
        XCTAssertEqual(formattedDocument,
                       "123.456.789-01",
                       "format() a CPF with a size greater than expected should truncate the extra characters")
    }
}
