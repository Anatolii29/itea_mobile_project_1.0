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
    @IBOutlet weak var courseProgramLabel: UILabel!
    
    var currentSubCourse: SubCourse?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fillData()
        editUIDesign()

    }
    
    func update(subCourse: SubCourse?) {
        
        currentSubCourse = subCourse
        
    }
    
    func editUIDesign() {
        
        let designManager = DesignManager()
        designManager.editButton(button: backButton)
        self.view.backgroundColor = designManager.getBackgroundColor()
        programView.backgroundColor = .white
        courseProgramLabel.backgroundColor = designManager.getMainBackgroundColor()
        titleLabel.text = currentSubCourse?.name
        
    }
    
    func fillData() {
        
        programTextView.text = currentSubCourse?.program
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
        
    }
    
}
