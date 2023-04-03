//
//  StudentCellTests+Extension.swift
//  TDD_SampleTests
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import XCTest

extension StudentCellTests {
    class StudentDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
