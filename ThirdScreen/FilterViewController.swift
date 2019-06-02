//
//  FilterViewController.swift
//  itea_project
//
//  Created by Anatolii on 5/29/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate {
    
    func filterUpdate(filterDate: FilterDate, filterType: FilterType, filterAge: FilterAge)
    
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var courseTimeView: UIView!
    @IBOutlet weak var courseTypeView: UIView!
    @IBOutlet weak var courseAgeView: UIView!
    @IBOutlet weak var outsideViewDayTime: UIView!
    @IBOutlet weak var insideViewDayTime: UIView!
    @IBOutlet weak var outsideViewEveningTime: UIView!
    @IBOutlet weak var insideViewEveningTime: UIView!
    @IBOutlet weak var outsideViewOnline: UIView!
    @IBOutlet weak var insideViewOnline: UIView!
    @IBOutlet weak var outsideViewFrontend: UIView!
    @IBOutlet weak var insideViewFrontend: UIView!
    @IBOutlet weak var outsideViewProgramming: UIView!
    @IBOutlet weak var insideViewProgramming: UIView!
    @IBOutlet weak var outsideViewDesign: UIView!
    @IBOutlet weak var insideViewDesign: UIView!
    @IBOutlet weak var outsideViewQA: UIView!
    @IBOutlet weak var insideViewQA: UIView!
    @IBOutlet weak var outsideViewMobileDev: UIView!
    @IBOutlet weak var insideViewMobileDev: UIView!
    @IBOutlet weak var outsideViewOther: UIView!
    @IBOutlet weak var insideViewOther: UIView!
    @IBOutlet weak var outsideViewAdults: UIView!
    @IBOutlet weak var insideViewAdults: UIView!
    @IBOutlet weak var outsideViewKids: UIView!
    @IBOutlet weak var insideViewKids: UIView!
    
    var arrayOffsideView: [UIView] = []
    var dateInsideViewDictionary: [CourseTime: UIView] = [:]
    var typeInsideViewDictionary: [CourseType: UIView] = [:]
    var ageInsideViewDictionary: [CourseAge: UIView] = [:]
    
    var delegate: LessonListViewController?
    var filterByDate = FilterDate()
    var filterByType = FilterType()
    var filterByAge = FilterAge()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        arrayOffsideView = [outsideViewDayTime,
                            outsideViewEveningTime,
                            outsideViewOnline,
                            outsideViewFrontend,
                            outsideViewProgramming,
                            outsideViewDesign,
                            outsideViewQA,
                            outsideViewMobileDev,
                            outsideViewOther,
                            outsideViewAdults,
                            outsideViewKids]
        dateInsideViewDictionary = [.dayTime: insideViewDayTime,
                                    .eveningTime: insideViewEveningTime,
                                    .online: insideViewOnline]
        typeInsideViewDictionary = [.frontend: insideViewFrontend,
                                    .programming: insideViewProgramming,
                                    .design: insideViewDesign,
                                    .QA: insideViewQA,
                                    .mobile: insideViewMobileDev,
                                    .other: insideViewOther]
        ageInsideViewDictionary = [.adult: insideViewAdults,
                                   .kids: insideViewKids]
        cornerRadius()
        
    }
    
    func update(filterDate: FilterDate, filterType: FilterType, filterAge: FilterAge) {
        
        filterByDate = filterDate
        filterByType = filterType
        filterByAge = filterAge
        
    }
    
    func cornerRadius() {
        
        for view in arrayOffsideView {
            
            view.clipsToBounds =  true
            view.layer.cornerRadius = view.frame.size.height / 2
            view.layer.borderWidth = 0.5
            view.layer.borderColor = UIColor.black.cgColor
        }
        
        for view in dateInsideViewDictionary {
            
            insideViewRadius(view: view.value)
            view.value.isHidden = filterByDate.isActive && filterByDate.filterValue == view.key ? false : true
            
        }
        
        for view in typeInsideViewDictionary {
            
            insideViewRadius(view: view.value)
            view.value.isHidden = filterByType.isActive && filterByType.filterValue == view.key ? false : true
            
        }
        
        for view in ageInsideViewDictionary {
            
            insideViewRadius(view: view.value)
            view.value.isHidden = filterByAge.isActive && filterByAge.filterValue == view.key ? false : true
            
        }
        
    }
    
    func insideViewRadius(view: UIView) {
        
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.size.height / 2
        
    }
    
    func dateInsideViewIsHidden(key: CourseTime) {
        
        for view in dateInsideViewDictionary {
            if view.key == key {
                view.value.isHidden = !view.value.isHidden
                filterByDate.filterValue = key
                filterByDate.isActive = !view.value.isHidden
            }
            else {
                view.value.isHidden = true
            }
        }
        
    }
    
    func typeInsideViewIsHidden(key: CourseType) {
        
        for view in typeInsideViewDictionary {
            if view.key == key {
                view.value.isHidden = !view.value.isHidden
                filterByType.filterValue = key
                filterByType.isActive = !view.value.isHidden
            }
            else {
                view.value.isHidden = true
            }
        }
        
    }
    
    func ageInsideViewIsHidden(key: CourseAge) {
        
        for view in ageInsideViewDictionary {
            if view.key == key {
                view.value.isHidden = !view.value.isHidden
                filterByAge.filterValue = key
                filterByAge.isActive = !view.value.isHidden
            }
            else {
                view.value.isHidden = true
            }
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        delegate?.filterUpdate(filterDate: filterByDate, filterType: filterByType, filterAge: filterByAge)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func dayTimeButtonPressed(_ sender: Any) {
        
        dateInsideViewIsHidden(key: .dayTime)
        
    }
    
    @IBAction func eveningTimeButtonPressed(_ sender: Any) {
        
        dateInsideViewIsHidden(key: .eveningTime)
        
    }
    
    @IBAction func onlineButtonPressed(_ sender: Any) {
        
        dateInsideViewIsHidden(key: .online)
        
    }
    
    @IBAction func frontendButtonPressed(_ sender: Any) {
        
        typeInsideViewIsHidden(key: .frontend)
        
    }
    
    @IBAction func programmingButtonPressed(_ sender: Any) {
        
        typeInsideViewIsHidden(key: .programming)
        
    }
    
    @IBAction func designButtonPressed(_ sender: Any) {
        
        typeInsideViewIsHidden(key: .design)
        
    }
    
    @IBAction func qaButtonPressed(_ sender: Any) {
        
        typeInsideViewIsHidden(key: .QA)
        
    }
    
    @IBAction func mobileButtonPressed(_ sender: Any) {
        
        typeInsideViewIsHidden(key: .mobile)
        
    }
    
    @IBAction func otherButtonPressed(_ sender: Any) {
        
        typeInsideViewIsHidden(key: .other)
        
    }
    
    @IBAction func adultsButtonPressed(_ sender: Any) {
        
        ageInsideViewIsHidden(key: .adult)
        
    }
    
    @IBAction func kidsButtonPressed(_ sender: Any) {
        
        ageInsideViewIsHidden(key: .kids)
        
    }
    
}
