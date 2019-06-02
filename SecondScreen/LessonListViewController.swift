//
//  LessonListViewController.swift
//  itea_project
//
//  Created by Anatolii on 5/20/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class LessonListViewController: UIViewController {
    
    @IBOutlet weak var headerBar: UIView!
    @IBOutlet weak var myProfileButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lessonCollectionView: UICollectionView!
    
    var currentUser: User?
    var coursesArray: [Course] = []
    var filterCourseArray: [Course] = []
    var searchCourseArray: [Course] = []
    var filterSearchCourseArray: [Course] = []
    var isSearch = false
    var isFilter = false
    
    var filterByDate = FilterDate()
    var filterByType = FilterType()
    var filterByAge = FilterAge()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        lessonCollectionView.delegate = self
        lessonCollectionView.dataSource = self
        searchBar.delegate = self
        
    }
    
    func update(currentArray: [Course]?, currUser: User?) {
        
        coursesArray = currentArray ?? []
        currentUser  = currUser
    }
    
    @IBAction func myProfileButtonPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//        vc.delegate = self
        vc.update(currUser: currentUser, newUser: false)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        vc.delegate = self
        vc.update(filterDate: filterByDate, filterType: filterByType, filterAge: filterByAge)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension LessonListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (isFilter || isSearch ? filterSearchCourseArray.count : coursesArray.count)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = lessonCollectionView.dequeueReusableCell(withReuseIdentifier: "LessonListCollectionViewCell", for: indexPath) as! LessonListCollectionViewCell
        let currentCourse = isFilter || isSearch ? filterSearchCourseArray[indexPath.row] : coursesArray[indexPath.row]
        item.update(currentCourse: currentCourse, index: indexPath.row)
        return item
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "LessonTableViewController") as! LessonTableViewController
        vc.courseTitle = coursesArray[indexPath.row].name
        vc.update(subCourseArray: coursesArray[indexPath.row].subCourseArray ?? [],
                  currUser: currentUser ?? nil)
        self.navigationController?.pushViewController(vc, animated: true)
  
    }
    
    
}

extension LessonListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        performSearch()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        performSearch()
        
    }
    
    func performSearch() {
        
        searchCourseArray = isFilter ? filterCourseArray : coursesArray
        searchCourseArray = searchBar.text!.isEmpty ? searchCourseArray : searchCourseArray.filter { $0.name.contains(searchBar.text!) }
        isSearch = searchBar.text!.isEmpty ? false : true
        filterSearchCourseArray = searchCourseArray
        if !isSearch {
            performFilter()
        }
        lessonCollectionView.reloadData()
        
    }
    
}

extension LessonListViewController: FilterViewControllerDelegate {
    
    func filterUpdate(filterDate: FilterDate, filterType: FilterType, filterAge: FilterAge) {
        
        filterByDate = filterDate
        filterByType = filterType
        filterByAge = filterAge
        performFilter()
        
    }
    
    func performFilter() {
        
        isFilter = false
        filterCourseArray = isSearch ? searchCourseArray : coursesArray
        performFilterByDate()
        performFilterByType()
        performFilterByAge()
        
        let filterIsActive = [filterByDate.isActive, filterByType.isActive, filterByAge.isActive]
        isFilter =  filterIsActive.contains(true)
        filterSearchCourseArray = filterCourseArray
        if isSearch {
            performSearch()
        }
        lessonCollectionView.reloadData()
        
    }
    
    func performFilterByDate() {
        
        if filterByDate.isActive {
            if filterByDate.filterValue != nil {
                filterCourseArray = filterCourseArray.filter { $0.time == filterByDate.filterValue }
            }
        }
        
    }
    
    func performFilterByType() {
        
        if filterByType.isActive {
            if filterByType.filterValue != nil {
                filterCourseArray = filterCourseArray.filter { $0.type == filterByType.filterValue }
            }
        }
        
    }
    
    func performFilterByAge() {
        
        if filterByAge.isActive {
            if filterByAge.filterValue != nil {
                filterCourseArray = filterCourseArray.filter { $0.age == filterByAge.filterValue }
            }
        }
        
    }
    
}
