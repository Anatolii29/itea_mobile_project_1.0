//
//  SignInViewController.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

enum Location {
    
    case rightBank
    case leftBank
    case policy
    
}

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var leftBankOutsideView: UIView!
    @IBOutlet weak var leftBankInsideView: UIView!
    @IBOutlet weak var rightBankOutsideView: UIView!
    @IBOutlet weak var rightBankInsideView: UIView!
    @IBOutlet weak var policyOutsideView: UIView!
    @IBOutlet weak var policyInsideView: UIView!
   
    var currentSubCourse: SubCourse?
    var currentUser: User?
    
    var arrayOffsideView: [UIView] = []
    var insideViewDictionary: [Location: UIView] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
        cornerRadius()
        editUIDesign()
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailtextField.delegate = self
        telephoneTextField.delegate = self
        
        self.hideKeyboardWhenTapped()
        
    }
    
    func editUIDesign() {
        
        let designManager = DesignManager()
        designManager.editButton(button: backButton)
        self.view.backgroundColor = designManager.getBackgroundColor()
        signInView.backgroundColor = .white
        courseNameLabel.text = currentSubCourse?.name
        locationView.layer.cornerRadius  = designManager.getCorenrRadiusForButtons()
        commentTextView.layer.cornerRadius = designManager.getCorenrRadiusForButtons()
        signInButton.layer.cornerRadius = designManager.getCorenrRadiusForButtons()
        courseNameLabel.layer.cornerRadius = designManager.getCorenrRadiusForButtons()
        
        nameTextField.isEnabled = false
        surnameTextField.isEnabled = false
        emailtextField.isEnabled = false
        telephoneTextField.isEnabled = false
        
    }
    
    func update(subCourse: SubCourse?, currUser: User?) {
        
        currentSubCourse = subCourse
        currentUser = currUser
        
    }
    
    func fillData() {
        
        courseNameLabel.text = currentSubCourse?.name
        nameTextField.text = currentUser?.name
        surnameTextField.text = currentUser?.surname
        emailtextField.text = currentUser?.email
        telephoneTextField.text = currentUser?.telephone
        
        arrayOffsideView = [leftBankOutsideView, rightBankOutsideView, policyOutsideView]
        insideViewDictionary = [.rightBank: rightBankInsideView,
                                .leftBank: leftBankInsideView,
                                .policy: policyInsideView]
        
    }
    
    func cornerRadius() {
        
        for view in arrayOffsideView {
            
            view.clipsToBounds =  true
            view.layer.cornerRadius = view.frame.size.height / 2
            view.layer.borderWidth = 0.5
            view.layer.borderColor = UIColor.black.cgColor
        }
        
        for view in insideViewDictionary {
            
            view.value.clipsToBounds = true
            view.value.layer.cornerRadius = view.value.frame.size.height / 2
            view.value.isHidden = true
            
        }
        
    }
    
    func locationIsHidden(location: Location) {
        
        for view in insideViewDictionary {
            view.value.isHidden = view.key == location ? false : true
        }
        
    }
    
    func checkEmptyFields() -> Bool {
        
        var isEmptyFields = false
        isEmptyFields = telephoneTextField.text!.isEmpty ? true : false
        if isEmptyFields {
            self.presentWarningOneAction(message: AlertType.telephoneIsEmpty.rawValue)
        }
        isEmptyFields = policyInsideView.isHidden ? true : false
        if isEmptyFields {
            self.presentWarningOneAction(message: AlertType.policyUnmarked.rawValue)
        }
        return isEmptyFields
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        if !checkEmptyFields() {
            currentUser?.completedCourses.updateValue(false, forKey: currentSubCourse)
            self.navigationController?.popViewController(animated: true)
            self.presentWarningOneAction(message: AlertType.courseIsSubscribed.rawValue)
        }
        
    }
    
    @IBAction func policyButtonPressed(_ sender: Any) {
        
        policyInsideView.isHidden = !policyInsideView.isHidden
        
    }
    
    @IBAction func rightBankButtonPressed(_ sender: Any) {
        
        locationIsHidden(location: .rightBank)
        
    }
    
    @IBAction func leftBankButtonPressed(_ sender: Any) {
        
        locationIsHidden(location: .leftBank)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
