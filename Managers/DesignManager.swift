//
//  DesignManager.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class DesignManager: NSObject {
    
    var mainBackgroundColor = UIColor(hexString: "#CD152B")
    var buttonBackgroundColor = UIColor(hexString: "#E48A87")
    var textFieldBackgroundColor = UIColor(hexString: "#E48A87")
    var buttonTextColor = UIColor(hexString: "#EFEFF4")
    var textFieldBackgroundColorNew = UIColor(hexString: "#EFEFF4")
    var mainBackground = UIColor(patternImage: UIImage(named: "pat2")!)
    var cornerRadius = CGFloat(4)
    var cornerRadiusTableView = CGFloat(8)
    var viewColor = UIColor.white
    
    var coursesBackgroundColors = [0: UIColor(hexString: "#EE7616"),
                                   1: UIColor(hexString: "#F59919"),
                                   2: UIColor(hexString: "#2768A8"),
                                   3: UIColor(hexString: "#2E88AA"),
                                   4: UIColor(hexString: "#AF96FF")]
    
    func getMainBackgroundColor() -> UIColor {
        
        return mainBackgroundColor
    }
    
    func getCorenrRadiusForButtons() -> CGFloat {
        
        return cornerRadius
    }
    
    func getCorenrRadiusForTableView() -> CGFloat {
        
        return cornerRadiusTableView
    }
    
    func editButton(button: UIButton) {
    
        button.layer.cornerRadius = cornerRadius
        button.layer.backgroundColor = buttonBackgroundColor.cgColor
        button.titleLabel?.textColor = buttonTextColor
        
    }
    
    func getBackgroundColor() -> UIColor {
        
        return mainBackground
        
    }
    
    func getColorForView() -> UIColor {
        
        return viewColor
        
    }
    
    func getBackgroundColorForCourse(index: Int) -> CGColor {
        
        return coursesBackgroundColors[index]?.cgColor ?? mainBackgroundColor.cgColor
        
    }
    
    func getColorForTextField() -> UIColor {
        
        return textFieldBackgroundColor
        
    }
    
    func getColorForTextFieldNew() -> UIColor {
        
        return textFieldBackgroundColorNew
        
    }
    
}
