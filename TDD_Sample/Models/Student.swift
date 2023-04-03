//
//  Student.swift
//  TDD_Sample
//
//  Created by Nitin Jaswal on 2023-03-13.
//

import Foundation


struct Student: Equatable {
    let rollNo: Int
    var isPresent: Bool
    
    init(rollNo: Int, isPresent: Bool = false) {
        self.rollNo = rollNo
        self.isPresent = isPresent
    }
}

func == (lhs: Student, rhs: Student) -> Bool {
    if lhs.rollNo != rhs.rollNo {
        return false
    } else if lhs.isPresent != rhs.isPresent {
        return false
    }
    return true
}
