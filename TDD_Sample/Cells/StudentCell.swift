//
//  StudentCell.swift
//  TDD_Sample
//
//  Created by Nitin Jaswal on 2023-03-14.
//

import UIKit

class StudentCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configStudentData(studentData: Student) {
        textLabel?.text = "\(studentData.rollNo)"
        detailTextLabel?.text = studentData.isPresent ? "Present" : "Absent"
    }

}
