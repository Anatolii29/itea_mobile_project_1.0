//
//  LoginScreenViewController.swift
//  itea_project
//
//  Created by Anatolii on 5/20/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var userArray: [User] = []
    var coursesArray: [Course] = []
    var currentUser: User?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = DesignManager().getMainBackgroundColor()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.hideKeyboardWhenTapped()
        
        allProjectDataManager()
        
    }
    
    func allProjectDataManager() {
        
        userArray = GlobalManager().userManager()
        coursesArray = GlobalManager().coursesManager()
        
    }
    
    func showAlert(alertType: AlertType, needToShow: Bool) {
        
        if needToShow {
            if alertType == .userNotFound {
                self.presentWarningTwoActions(message: alertType.rawValue) { (result) in
                    if result {
                        self.createNewUser()
                    }
                }
            }
            else {
                self.presentWarningOneAction(message: alertType.rawValue)
            }
        }
        
    }
    
    func createNewUser() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.delegate = self
        vc.update(currUser: newUser(), newUser: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func newUser() -> User {
        
        let newUser = User(name: "",
                           password: "",
                           photo: "default-photo-1",
                           surname: "",
                           age: 0,
                           city: "",
                           birthday: "",
                           email: "",
                           telephone: "")
        userArray.append(newUser)
        return newUser
        
    }
    
    func userValidation() -> Bool {
        
        var userFound = false
        var wrongPassword = false
        for user in userArray {
            if user.name == usernameTextField.text! {
                userFound = true
                wrongPassword = user.password != passwordTextField.text! ? true : false
                showAlert(alertType: .wrongPass, needToShow: wrongPassword)
                currentUser = user
                return wrongPassword ? false : true
            }
        }
        showAlert(alertType: .userNotFound,
                  needToShow: userFound ? false : true)
        return userFound
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let fieldsArray = [usernameTextField, passwordTextField]
        let isEmptyFields = EmptyFieldsCheck().isEmptyFields(fieldArray: fieldsArray)
        showAlert(alertType: .isEmptyFields, needToShow: isEmptyFields)
        
        if !isEmptyFields {
            if userValidation() {
                let vc = storyboard?.instantiateViewController(withIdentifier: "LessonListViewController") as! LessonListViewController
                vc.update(currentArray: coursesArray, currUser: currentUser ?? nil)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
}

extension LoginScreenViewController: ProfileViewControllerDelegate {
    
    func saveNewUser(newUser: User) {
        userArray.append(newUser)
    }
    
}

extension UIViewController {
    
    func hideKeyboardWhenTapped() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
}
