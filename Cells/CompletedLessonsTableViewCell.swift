//
//  CompletedLessonsTableViewCell.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.

import UIKit

class CompletedLessonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    
    
    var currentSubCourse: SubCourse?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.layer.backgroundColor =
            DesignManager().getMainBackgroundColor().cgColor
        
    }
    
    func update(currSubCourse: SubCourse?) {
        
        currentSubCourse = currSubCourse
        fillData()
    }
    
    func fillData() {
        
        courseImage.image = UIImage(named: currentSubCourse?.photo ?? "default")
        courseName.text = currentSubCourse?.name
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
