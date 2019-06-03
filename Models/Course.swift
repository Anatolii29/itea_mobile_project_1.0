//
//  Course.swift
//  itea_project
//
//  Created by Anatolii on 5/27/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class Course: NSObject {
    
    var name = ""
    var photo = ""
    var time: CourseTime
    var type: CourseType
    var age: CourseAge
    var subCourseArray: [SubCourse]?
    
    init(name: String, photo: String, time: CourseTime, type: CourseType, age: CourseAge) {
        self.name = name
        self.photo = photo
        self.time = time
        self.type = type
        self.age = age
//        self.subCourseArray = subCourseArray
    }

}
