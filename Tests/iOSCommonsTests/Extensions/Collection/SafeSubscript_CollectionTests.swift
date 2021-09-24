//
//  SafeSubscript_CollectionTests.swift
//  
//
//  Created by Bruno Maciel on 9/23/21.
//

import XCTest
@testable import iOSCommons

class SafeSubscript_CollectionTests: XCTestCase {
    
    // MARK: Subject under test
    
    
    // MARK: Setup and TearDown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    func test_first_index() {
        // Given
        let array = [1, 2, 3, 4, 5]
        
        // When
        let item = array[safe: 0]
        
        // Then
        XCTAssertEqual(item,
                       1,
                       "[safe: index] when index is 0 should return first item")
    }
    
    func test_middle_index() {
        // Given
        let array = [1, 2, 3, 4, 5]
        
        // When
        let item = array[safe: 2]
        
        // Then
        XCTAssertEqual(item,
                       3,
                       "[safe: index] when index is in middle should return the item in the corresponding position")
    }
    
    func test_end_index() {
        // Given
        let array = [1, 2, 3, 4, 5]
        
        // When
        let item = array[safe: 4]
        
        // Then
        XCTAssertEqual(item,
                       5,
                       "[safe: index] when index is the last index should return last item")
    }
    
    func test_negative_index() {
        // Given
        let array = [1, 2, 3, 4, 5]
        
        // When
        let item = array[safe: -1]
        
        // Then
        XCTAssertNil(item,
                     "[safe: index] when index is negative should always return nil")
    }
    
    func test_index_beyond_collection_size() {
        // Given
        let array = [1, 2, 3, 4, 5]
        
        // When
        let item = array[safe: 5]
        
        // Then
        XCTAssertNil(item,
                     "[safe: index] when index is beyond collection size should always return nil")
    }

}
