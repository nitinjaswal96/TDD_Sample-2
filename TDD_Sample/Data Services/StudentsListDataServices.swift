//
//  StudentsListDataServices.swift
//  TDD_Sample
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import UIKit

class StudentsListDataServices: NSObject {
    var studentManager: StudentManager?
}

extension StudentsListDataServices: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let studentManager = studentManager else { return 0 }
        return studentManager.studentsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCellID", for: indexPath) as! StudentCell
        guard let studentManager = studentManager else { fatalError() }
        
        cell.configStudentData(studentData: studentManager.students[indexPath.row])
        return cell
    }
}

extension StudentsListDataServices: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let studentManager = studentManager else { fatalError() }
        
        studentManager.removeStudentFromIndex(index: indexPath.row)
        tableView.reloadData()
    }
}
