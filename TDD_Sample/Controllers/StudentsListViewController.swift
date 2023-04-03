//
//  StudentsListViewController.swift
//  TDD_Sample
//
//  Created by Nitin Jaswal on 2023-03-13.
//

import UIKit

class StudentsListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var dataService: StudentsListDataServices!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.studentManager = StudentManager()
        listTableView.dataSource = dataService
        listTableView.delegate = dataService
        
        addStudents()
    }
    
    func addStudents() {
        let student1 = Student(rollNo: 121)
        let student2 = Student(rollNo: 122, isPresent: true)
        let student3 = Student(rollNo: 123, isPresent: true)
        let student4 = Student(rollNo: 124)
        
        guard let studentManager = dataService.studentManager else { return }
        studentManager.addStudent(student: student1)
        studentManager.addStudent(student: student2)
        studentManager.addStudent(student: student3)
        studentManager.addStudent(student: student4)
        
        listTableView.reloadData()
    }
}

