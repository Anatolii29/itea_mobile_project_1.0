//
//  LessonTableViewController.swift
//  itea_project
//
//  Created by Anatolii on 6/1/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class LessonTableViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseTableView: UITableView!
    
    var currentSubCourseArray: [SubCourse]?
    var courseTitle = ""
    var currentUser: User?
    var sectionNames = ["Completed courses", "Subscribed courses"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseTableView.delegate = self
        courseTableView.dataSource = self
        courseName.text = courseTitle
        
    }
    
    func update(subCourseArray: [SubCourse]?,
                currUser: User?) {
        
        currentSubCourseArray = subCourseArray
        currentUser = currUser
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension LessonTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentSubCourseArray?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = courseTableView.dequeueReusableCell(withIdentifier: "LessonTableViewCell", for: indexPath) as! LessonTableViewCell
        cell.update(currSubCourse: currentSubCourseArray?[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.update(subCourse: currentSubCourseArray?[indexPath.row],
                  currUser: currentUser ?? nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
