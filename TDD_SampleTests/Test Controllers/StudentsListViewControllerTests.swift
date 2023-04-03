//
//  StudentsListViewControllerTests.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import XCTest
@testable import TDD_Sample

class StudentsListViewControllerTests: XCTestCase {
    var sut: StudentsListViewController!

    override func setUpWithError() throws {
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentsListViewControllerID") as! StudentsListViewController)
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Nil Checks
    func testTableView_ShouldNotBeNil() {
        XCTAssertNotNil(sut.listTableView)
    }
    
    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.listTableView.dataSource)
        XCTAssertTrue(sut.listTableView.dataSource is StudentsListDataServices)
    }
    
    // MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.listTableView.delegate)
        XCTAssertTrue(sut.listTableView.delegate is StudentsListDataServices)
    }
    
    // MARK: Data Service Assumptions
    func testDataService_ViewDidLoad_SetsSingleDataServiceObject() {
        XCTAssertEqual(sut.listTableView.dataSource as! StudentsListDataServices, sut.listTableView.delegate as! StudentsListDataServices)
        
        XCTAssertTrue(sut.listTableView.dataSource === sut.listTableView.delegate)
    }
}
