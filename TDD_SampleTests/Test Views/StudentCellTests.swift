//
//  StudentCellTests.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import XCTest
@testable import TDD_Sample

class StudentCellTests: XCTestCase {
    var studentsListVC: StudentsListViewController!
    var listTableView: UITableView!
    var studentDataSource: UITableViewDataSource = StudentDataSource()

    override func setUpWithError() throws {
        studentsListVC = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentsListViewControllerID") as! StudentsListViewController)
        _ = studentsListVC.view
        
        listTableView = studentsListVC.listTableView
        listTableView.dataSource = studentDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewCell_SectionConfig_ShouldSetLabelsToStudentData() {
        // dequeueReusableCell is used while setting/assigning data
        let cell = listTableView.dequeueReusableCell(withIdentifier: "StudentCellID", for: IndexPath(row: 0, section: 0)) as! StudentCell
        
        cell.configStudentData(studentData: Student(rollNo: 121))
        
        XCTAssertEqual(cell.textLabel?.text, "121")
        XCTAssertEqual(cell.detailTextLabel?.text, "Absent")
    }
}
