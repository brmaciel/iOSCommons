//
//  Remove_StringTests.swift
//  
//
//  Created by Bruno Maciel on 9/22/21.
//

import XCTest
@testable import iOSCommons

class Remove_StringTests: XCTestCase {
    
    // MARK: Subject under test


    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }


    // MARK: - Tests
    
    func test_remove_from_empty_string() {
        // Given
        var string = ""
        
        // When
        
        // Then
        XCTAssert(string.isEmpty)
        XCTAssertThrowsError(try string.remove(at: 0),
                         "remove() a character from an empty string should throw an error")
    }
    
    func test_remove_from_first_position() {
        // Given
        var string = "abc"
        
        // When
        var removedChar: Character?
        do {
            removedChar = try string.remove(at: 0)
        } catch  {
            XCTFail("remove() a character from first position of a string should NOT throw an error")
        }
        
        // Then
        XCTAssertFalse(string.isEmpty)
        XCTAssertEqual(string,
                       "bc",
                       "remove() is not removing a character from first position of a string")
        XCTAssertEqual(removedChar,
                       "a",
                       "remove() is not returning the right character from first position of a string")
    }
    
    func test_remove_from_the_middle() {
        // Given
        var string = "abc"
        
        // When
        var removedChar: Character?
        do {
            removedChar = try string.remove(at: 1)
        } catch  {
            XCTFail("remove() a character from the middle of a string should NOT throw an error")
        }
        
        // Then
        XCTAssertEqual(string,
                       "ac",
                       "remove() is not removing a character from the middle of a string")
        XCTAssertEqual(removedChar,
                       "b",
                       "remove() is not returning the right character from middle position of a string")
    }
    
    func test_remove_from_last_position() {
        // Given
        var string = "abc"
        
        // When
        var removedChar: Character?
        do {
            removedChar = try string.remove(at: 2)
        } catch  {
            XCTFail("remove() a character from last position of a string should NOT throw an error")
        }
        
        // Then
        XCTAssertEqual(string,
                       "ab",
                       "remove() is not removing a character from last position of a string")
        XCTAssertEqual(removedChar,
                       "c",
                       "remove() is not returning the right character from last position of a string")
    }
    
    func test_remove_in_negative_position() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertThrowsError(try string.remove(at: -1),
                            "remove() a string from a negative position should throw an error")
        XCTAssertEqual(string,
                       "abc",
                       "remove() a string from a negative position should NOT change the string")
    }
    
    func test_remove_beyond_last_position() {
        // Given
        var string = "abc"
        
        // When
        
        // Then
        XCTAssertThrowsError(try string.remove(at: 4),
                            "remove() a string beyond last position should throw an error")
        XCTAssertEqual(string,
                       "abc",
                       "remove() a string beyond last position should NOT change the string")
    }

}
