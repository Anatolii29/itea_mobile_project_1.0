//
//  LessonProgramViewController.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class LessonProgramViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var programView: UIView!
    @IBOutlet weak var programTextView: UITextView!
    
    var currentSubCourse: SubCourse?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fillData()

    }
    
    func update(subCourse: SubCourse?) {
        
        currentSubCourse = subCourse
        
    }
    
    func fillData() {
        
        programTextView.text = currentSubCourse?.program
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
        
    }
    
}
