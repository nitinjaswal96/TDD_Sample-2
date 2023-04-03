//
//  StudentsListDataServiceTests+Extension.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import XCTest
@testable import TDD_Sample

extension StudentsListDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequedCompleted = false
                
        class func initMock(dataSource: UITableViewDataSource) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(StudentCellMock.self, forCellReuseIdentifier: "StudentCellID")

            return mock
        }

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequedCompleted = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class StudentCellMock: StudentCell {
        var studentData: Student?
        
        override func configStudentData(studentData: Student) {
            self.studentData = studentData
            
            super.configStudentData(studentData: studentData)
        }
    }
}
