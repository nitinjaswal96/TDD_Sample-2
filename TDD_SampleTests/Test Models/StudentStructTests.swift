//
//  StudentStructTests.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-13.
//

import XCTest
@testable import TDD_Sample

class StudentStructTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Initial Values
    func testInit_StudentWithRolloNo() {
        let student = Student(rollNo: 121)
        
        XCTAssertNotNil(student)
        XCTAssertEqual(student.rollNo, 121)
    }
    
    func testInit_StudentIsPresent() {
        let student = Student(rollNo: 121, isPresent: true)
        
        XCTAssertNotNil(student)
        XCTAssertEqual(student.isPresent, true)
    }
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        let student1 = Student(rollNo: 121)
        let student2 = Student(rollNo: 121)
        
        XCTAssertEqual(student1, student2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentRollNo() {
        let student1 = Student(rollNo: 121)
        let student2 = Student(rollNo: 122)
        
        XCTAssertNotEqual(student1, student2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentPresentStatus() {
        let student1 = Student(rollNo: 121, isPresent: false)
        let student2 = Student(rollNo: 121, isPresent: true)
        
        XCTAssertNotEqual(student1, student2)
    }
}
