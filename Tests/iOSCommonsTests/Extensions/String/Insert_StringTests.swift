//
//  Insert_StringTests.swift
//  
//
//  Created by Bruno Maciel on 9/22/21.
//

import XCTest
@testable import iOSCommons

class Insert_StringTests: XCTestCase {
    
    // MARK: Subject under test


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }


    // MARK: - Tests
    
    func test_insert_in_first_position_of_empty_string() {
        // Given
        var string = ""
        
        // When
        
        // Then
        XCTAssert(string.isEmpty)
        XCTAssertNoThrow(try string.insert("a", at: 0),
                         "insert() a string into first position of an empty string should NOT throw an error")
        XCTAssertEqual(string,
                       "a",
                       "insert() is not inserting a string into first position of an empty string")
    }
    
    func test_insert_in_first_position_of_not_empty_string() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertFalse(string.isEmpty)
        XCTAssertNoThrow(try string.insert("d", at: 0),
                         "insert() a string into first position of a string should NOT throw an error")
        XCTAssertEqual(string,
                       "dabc",
                       "insert() is not inserting a string into first position of a string")
    }
    
    func test_insert_in_the_middle() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertNoThrow(try string.insert("d", at: 1),
                         "insert() a string into the middle of a string should NOT throw an error")
        XCTAssertEqual(string,
                       "adbc",
                       "insert() is not inserting a string into the middle of a string")
    }
    
    func test_insert_in_last_position() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertNoThrow(try string.insert("d", at: 3),
                         "insert() a string into last position of a string should NOT throw an error")
        XCTAssertEqual(string,
                       "abcd",
                       "insert() is not inserting a string into last position of a string")
    }
    
    func test_insert_in_negative_position() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertThrowsError(try string.insert("d", at: -1),
                            "insert() a string into a negative position should throw an error")
        XCTAssertEqual(string,
                       "abc",
                       "insert() a string into a negative position should NOT change the string")
    }
    
    func test_insert_beyond_last_position() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertThrowsError(try string.insert("d", at: 4),
                            "insert() a string beyond last position should throw an error")
        XCTAssertEqual(string,
                       "abc",
                       "insert() a string beyond last position should NOT change the string")
    }

}
