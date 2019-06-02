//
//  ProfileViewController.swift
//  itea_project
//
//  Created by Anatolii on 6/1/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate {
    
    func saveNewUser(newUser: User)
    
}

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var updatePhotoButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var lastCoursesButton: UIButton!
    @IBOutlet weak var userPhotoImage: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userSurnameTextField: UITextField!
    @IBOutlet weak var userPhotoTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var userBirtdayTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userTelephoneTextField: UITextField!
    @IBOutlet weak var userCurrentCourseTextField: UITextField!
    
    var currentUser: User?
    var arrayTextFiled: [UITextField] = []
    var isNewUser = false
    var editingEnabled = false
    var delegate: LoginScreenViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
        editFields()
        
    }
    
    func update(currUser: User?, newUser: Bool) {
        
        isNewUser = newUser
        currentUser = currUser
        
    }
    
    func editFields() {
        
        backButton.isHidden = isNewUser
        userPhotoTextField.isHidden = !isNewUser
        lastCoursesButton.isHidden = isNewUser
        updatePhotoButton.isHidden = !isNewUser
        
        isEnabledFields(isActive: isNewUser)
        
    }
    
    func isEnabledFields(isActive: Bool) {
        
        for field in arrayTextFiled {
            field.isEnabled = isActive
            field.backgroundColor = isActive ? UIColor.green : UIColor.red
        }
        editButton.setTitle(isActive ? "save" : "edit", for: .normal)
        
    }
    
    func fillData() {
        
        let photoName = currentUser?.photo == nil ? "default-photo-1" : currentUser?.photo
        userPhotoImage.image = UIImage(named: photoName!)
        userNameTextField.text = currentUser?.name
        userSurnameTextField.text = currentUser?.surname
        userSurnameTextField.text = currentUser?.surname
        let isAge = currentUser?.age ?? nil
        let  age = isAge == nil ? "No age" : String(isAge!)
        userAgeTextField.text = age
        userCityTextField.text = currentUser?.city
        userBirtdayTextField.text = currentUser?.birthday
        userEmailTextField.text = currentUser?.email
        userTelephoneTextField.text = currentUser?.telephone
        passwordTextField.text = currentUser?.password
        
        arrayTextFiled.append(userNameTextField)
        arrayTextFiled.append(userSurnameTextField)
        arrayTextFiled.append(passwordTextField)
        arrayTextFiled.append(userAgeTextField)
        arrayTextFiled.append(userCityTextField)
        arrayTextFiled.append(userBirtdayTextField)
        arrayTextFiled.append(userEmailTextField)
        arrayTextFiled.append(userTelephoneTextField)
        arrayTextFiled.append(userCurrentCourseTextField)
    }
    
    func checkEmptyFields() -> Bool {
        
        var isEmptyFields = false
        isEmptyFields = userNameTextField.text!.isEmpty ? true : false
        isEmptyFields = passwordTextField.text!.isEmpty ? true : false
        if isEmptyFields {
            self.presentWarningOneAction(message: AlertType.isEmptyFields.rawValue)
        }
        return isEmptyFields
        
    }
        
    func saveChangesInCurrentUser() {
        
        currentUser?.name = userNameTextField.text ?? ""
        currentUser?.surname = userSurnameTextField.text ?? ""
        currentUser?.password = passwordTextField.text ?? ""
        currentUser?.age = Int(userAgeTextField.text ?? "0")!
        currentUser?.city = userCityTextField.text ?? ""
        currentUser?.birthday = userBirtdayTextField.text ?? ""
        currentUser?.email = userEmailTextField.text ?? ""
        currentUser?.telephone = userTelephoneTextField.text ?? ""
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        if isNewUser {
            if !checkEmptyFields() {
                saveChangesInCurrentUser()
                self.navigationController?.popViewController(animated: true)
                self.presentWarningOneAction(message: AlertType.userSaved.rawValue)
            }
        }
        else {
            editingEnabled = !editingEnabled
            if !editingEnabled {
                if !checkEmptyFields() {
                saveChangesInCurrentUser()
                }
                else {
                  editingEnabled = true
                }
            }
            isEnabledFields(isActive: editingEnabled)
        }
        
    }
    
    @IBAction func lastCoursesButtonPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ComletedLessonsViewController") as! ComletedLessonsViewController
        vc.update(currUser: currentUser)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func updatePhotoButtonPressed(_ sender: Any) {
        
        let currImage = UIImage(named: userPhotoTextField.text ?? "default-photo-1")
        userPhotoImage.image = currImage == nil ? UIImage(named: "default-photo-1") : currImage
        
    }
    
    
}
