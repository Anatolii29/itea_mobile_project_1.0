//
//  LessonTableViewController.swift
//  itea_project
//
//  Created by Anatolii on 6/1/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class ComletedLessonsViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var courseTableView: UITableView!
    
    var completedCourseArray: [SubCourse?] = []
    var subscribedCourseArray: [SubCourse?] = []
    var courseTitle = ""
    var currentUser: User?
    var sectionNames = ["Completed courses", "Subscribed courses"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseTableView.delegate = self
        courseTableView.dataSource = self
        editUIDesign()
        
    }
    
    func update(currUser: User?) {
        
        currentUser = currUser
        fillArrays()
        
    }
    
    func editUIDesign() {
        
        DesignManager().editButton(button: backButton)
    
    }
    
    func fillArrays() {
        
        completedCourseArray.removeAll()
        subscribedCourseArray.removeAll()
        for course in currentUser?.completedCourses ?? [:] {
            if course.value == true {
                completedCourseArray.append(course.key ?? nil)
            }
            else {
                subscribedCourseArray.append(course.key ?? nil)
            }
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension ComletedLessonsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
        view.backgroundColor = DesignManager().getMainBackgroundColor()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 30, height: view.bounds.height * 0.37))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.white
        label.text = sectionNames[section]
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 0
        if section == 0 {
            numberOfRows = completedCourseArray.count
        }
        else {
            numberOfRows = subscribedCourseArray.count
        }
        return numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = courseTableView.dequeueReusableCell(withIdentifier: "CompletedLessonsTableViewCell", for: indexPath) as! CompletedLessonsTableViewCell
        cell.layer.backgroundColor =
            DesignManager().getMainBackgroundColor().cgColor
        cell.update(currSubCourse:  indexPath.section == 0 ? completedCourseArray[indexPath.row] : subscribedCourseArray[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.isCourseCompleted = indexPath.section == 0 ? false : true
        vc.delegate = self
        vc.update(subCourse: indexPath.section == 0 ? completedCourseArray[indexPath.row] : subscribedCourseArray[indexPath.row],
                  currUser: currentUser ?? nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ComletedLessonsViewController: DetailViewControllerDelegate {
    
    func updateInfoInTableView() {
        
        fillArrays()
        courseTableView.reloadData()
        
    }
    
}
