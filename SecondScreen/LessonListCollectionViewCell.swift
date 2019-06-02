//
//  LessonListCollectionViewCell.swift
//  itea_project
//
//  Created by Anatolii on 5/20/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class LessonListCollectionViewCell: UICollectionViewCell {
    
//    var delegate: LessonListViewController?
    
    @IBOutlet weak var lessonImage: UIImageView!
    @IBOutlet weak var lessonLabel: UILabel!
    
    func update(currentCourse: Course, index: Int) {
        
        lessonImage.image = UIImage(named: currentCourse.photo)
        lessonLabel.text = currentCourse.name
        self.backgroundColor = coursesBackgroundColors[index]
        lessonLabel.lineBreakMode = .byWordWrapping
        lessonLabel.numberOfLines = 0
        
    }
    
}
