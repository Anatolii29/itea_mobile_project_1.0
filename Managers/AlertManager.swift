//
//  AlertManager.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

enum AlertType: String {
    
    case isEmptyFields = "Login or password field is empty. Please fill all empty fileds"
    case wrongPass = "Wrong password!"
    case userNotFound =  "User not found! Do you want to create new user?"
    case userSaved =  "User saved!"
    case policyUnmarked =  "Please mark the policy information"
    case telephoneIsEmpty =  "Please fill the telephone number"
    case courseIsSubscribed =  "You have successfuly subscribed on course"
    case courseIsCompleted =  "You have successfuly comleted the course. Congratulations!"
    
}

