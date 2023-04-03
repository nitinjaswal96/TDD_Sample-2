//
//  StudentsListDataServiceTests.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import XCTest
@testable import TDD_Sample

class StudentsListDataServiceTests: XCTestCase {
    let sut: StudentsListDataServices = StudentsListDataServices()
    var listTableView: UITableView!
    var studentsListVC: StudentsListViewController!
    var tableViewMock: TableViewMock!
    
    let student1 = Student(rollNo: 121)
    let student2 = Student(rollNo: 122)

    override func setUpWithError() throws {
        sut.studentManager = StudentManager()
        studentsListVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentsListViewControllerID") as! StudentsListViewController)
        _ = studentsListVC.view
        
        listTableView = studentsListVC.listTableView
        // datasource and delegate value updated
        listTableView.dataSource = sut
        listTableView.delegate = sut
        
        // mock tableview is used when we override the
        tableViewMock = TableViewMock.initMock(dataSource: sut)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testTableViewSections_Count_ReturnsOne() {
        let sections = listTableView.numberOfSections
        XCTAssertEqual(sections, 1)
    }

    func testTableViewRow_Count_ReturnsStudentsCount() {
//        guard let studentManager = sut.studentManager else { return }
//        studentManager.addStudent(student: student1)
//        studentManager.addStudent(student: student2)
//
//        XCTAssertEqual(studentManager.studentsCount, 2)
//        XCTAssertEqual(listTableView.numberOfRows(inSection: 0), studentManager.studentsCount)
//
//        // adding one more student to list
//        let student3 = Student(rollNo: 123)
//        studentManager.addStudent(student: student3)
//        XCTAssertEqual(studentManager.studentsCount, 3)
//
//        listTableView.reloadData()
//        XCTAssertEqual(listTableView.numberOfRows(inSection: 0), studentManager.studentsCount)
//
//        // removing one student from list
//        studentManager.removeStudentFromIndex(index: 0)
//        XCTAssertEqual(studentManager.studentsCount, 2)
//
//        listTableView.reloadData()
//        XCTAssertEqual(listTableView.numberOfRows(inSection: 0), studentManager.studentsCount)
    }
    
    // MARK: Cells
    func testTableViewCell_RowAtIndex_ReturnsStudentCell() {
        guard let studentManager = sut.studentManager else { return }
        studentManager.addStudent(student: student1)
        
        listTableView.reloadData()
        let cell = listTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is StudentCell)
    }
    
    func testTableViewCell_ShouldDequeCell() {
        guard let studentManager = sut.studentManager else { return }
        studentManager.addStudent(student: student1)
        
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequedCompleted)
    }
    
    func testTableViewCell_SectionConfig_ShouldSetData() {
        guard let studentManager = sut.studentManager else { return }
        studentManager.addStudent(student: student1)
        tableViewMock.reloadData()
        
        // cellForRow is used while reading/fetching data
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! StudentCellMock
        
        XCTAssertEqual(cell.studentData, student1)
    }
    
    func testTableViewCell_Selection_ChangeRowsCount() {
        let student1 = Student(rollNo: 121, isPresent: false)
        let student2 = Student(rollNo: 122, isPresent: true)
        
        guard let studentManager = sut.studentManager else { return }
        studentManager.addStudent(student: student1)
        studentManager.addStudent(student: student2)
        listTableView.reloadData()
        
        XCTAssertEqual(listTableView.numberOfRows(inSection: 0), 2)
        listTableView.delegate?.tableView!(listTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(listTableView.numberOfRows(inSection: 0), 1)
        
        let cell = listTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! StudentCell
        XCTAssertEqual(cell.detailTextLabel?.text, "Present")
    }
}
