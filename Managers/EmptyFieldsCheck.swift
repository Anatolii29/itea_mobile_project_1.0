//
//  EmptyFieldsCheck.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class EmptyFieldsCheck: NSObject {
    
    func isEmptyFields(fieldArray: [UITextField?]) -> Bool {
        
        var isEmptyFields = false
        for field in fieldArray {
            if !isEmptyFields {
                isEmptyFields = field?.text!.isEmpty ?? true ? true : false
            }
        }
        return isEmptyFields
        
    }
    
}
