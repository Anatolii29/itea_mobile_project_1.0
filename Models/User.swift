//
//  User.swift
//  itea_project
//
//  Created by Anatolii on 5/27/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name = ""
    var surname = ""
    var password = ""
    var photo = ""
    var age = 0
    var city = ""
    var birthday = ""
    var email = ""
    var telephone = ""
    var completedCourses: [SubCourse?: Bool] = [:]
    
    init(name: String, password: String, photo: String, surname: String, age: Int, city: String, birthday: String, email: String, telephone: String) {
        self.name = name
        self.password = password
        self.photo = photo
        self.surname = surname
        self.age = age
        self.city = city
        self.birthday = birthday
        self.email = email
        self.telephone = telephone
    }
    
}
