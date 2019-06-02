//
//  DetailViewController.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit


protocol DetailViewControllerDelegate {
    
    func updateInfoInTableView()
    
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var afterCourseView: UIView!
    @IBOutlet weak var afterCourseTextView: UITextView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var programButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var aboutTextView: UITextView!
    
    var currentSubCourse: SubCourse?
    var currentUser: User?
    var isCourseCompleted = false
    var delegate: ComletedLessonsViewController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fillData()
        signInButton.setTitle(isCourseCompleted ? "Complete the course" : "Sign in on course", for: .normal)
    }
    
    func update(subCourse: SubCourse?, currUser: User?) {
        
        currentSubCourse = subCourse
        currentUser = currUser
        
    }
    
    func fillData() {
        
        aboutTextView.text = currentSubCourse?.about
        afterCourseTextView.text = currentSubCourse?.afterCourse
        
    }
    
    func comleteTheCourse() {
        
        currentUser?.completedCourses[currentSubCourse] = true
        delegate?.updateInfoInTableView()
        self.navigationController?.popViewController(animated: true)
        self.presentWarningOneAction(message: AlertType.courseIsCompleted.rawValue)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        delegate?.updateInfoInTableView()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func programButtonPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LessonProgramViewController") as! LessonProgramViewController
        vc.update(subCourse: currentSubCourse)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        if isCourseCompleted {
            comleteTheCourse()
        }
        else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            vc.update(subCourse: currentSubCourse, currUser: currentUser)
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
}
