//
//  Filters.swift
//  itea_project
//
//  Created by Anatolii on 5/31/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

enum CourseTime: String {
    
    case dayTime = "Day course"
    case eveningTime = "Evening course"
    case online = "Online"
    case defaultTime = "No time"
}

enum CourseType: String {
    
    case frontend = "Frontend"
    case programming = "Programming"
    case design = "Design"
    case mobile = "Mobile development"
    case other = "Other"
    case QA = "QA"
}

enum CourseAge: String {
    
    case adult = "For adults"
    case kids = "For kids"
    
}

class FilterDate {
    var filterValue: CourseTime?
    var isActive = false
}

class FilterType {
    var filterValue: CourseType?
    var isActive = false
}

class FilterAge {
    var filterValue: CourseAge?
    var isActive = false
}

