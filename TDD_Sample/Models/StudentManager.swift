//
//  StudentManager.swift
//  TDD_Sample
//
//  Created by Nitin Jaswal on 2023-03-13.
//

import Foundation

class StudentManager {
    var studentsCount: Int { students.count }
    var students: [Student] = []
    
    func addStudent(student: Student) {
        guard !students.contains(student) else { return }
        students.append(student)
    }
    
    func studentAtIndex(index: Int) -> Student? {
        guard index < studentsCount else { return nil }
        return students[index]
    }
    
    func removeStudentFromIndex(index: Int) {
        guard index < studentsCount else { return }
        students.remove(at: index)
    }
    
    func clearAllStudents() {
        students.removeAll()
    }
}
