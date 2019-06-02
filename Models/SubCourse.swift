//
//  SubCourse.swift
//  itea_project
//
//  Created by Anatolii on 6/1/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class SubCourse: NSObject {
    
    var name = ""
    var about = ""
    var afterCourse = ""
    var photo = ""
    var program = ""
    
    init(name: String, about: String, afterCourse: String, photo: String, program: String) {
       
        self.name = name
        self.about = about
        self.afterCourse = afterCourse
        self.photo = photo
        self.program = program
        
    }

}
