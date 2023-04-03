//
//  StudentManagerTests.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-13.
//

import XCTest
@testable import TDD_Sample

class StudentManagerTests: XCTestCase {
    var sut: StudentManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = StudentManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    // MARK: Initial Values
    func testInit_Students_ReturnsZero() {
        XCTAssertEqual(sut.studentsCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_Student_ReturnsOne() {
        let student = Student(rollNo: 121, isPresent: true)
        sut.addStudent(student: student)
        
        XCTAssertEqual(sut.studentsCount, 1)
    }
    
    func testQuery_StudentAtIndex() throws {
        let student = Student(rollNo: 121, isPresent: true)
        sut.addStudent(student: student)
        
        //try XCTSkipIf(sut.studentAtIndex(index: 0) == nil, "Nil value detected")
        let studentQueried = try XCTUnwrap(sut.studentAtIndex(index: 0))
        XCTAssertEqual(sut.students[0].rollNo, studentQueried.rollNo)
    }
    
    // MARK: Remove
    func testRemove_Student_ReturnsZero() {
        var student = Student(rollNo: 121, isPresent: true)
        student.isPresent = false
        sut.addStudent(student: student)
        
        sut.removeStudentFromIndex(index: 0)
        XCTAssertEqual(sut.studentsCount, 0)
    }
    
    // MARK: Clearing
    func testClear_Students_ReturnZero() {
        let student1 = Student(rollNo: 121)
        let student2 = Student(rollNo: 122)
        
        sut.addStudent(student: student1)
        sut.addStudent(student: student2)
        XCTAssertEqual(sut.studentsCount, 2)
        
        sut.clearAllStudents()
        XCTAssertEqual(sut.studentsCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicate_StudentNotAdded() {
        let student1 = Student(rollNo: 121)
        sut.addStudent(student: student1)
                       
        let student2 = Student(rollNo: 121)
        sut.addStudent(student: student2)
        
        XCTAssertEqual(sut.studentsCount, 1)
    }
}
