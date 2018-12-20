//
//  CalenderController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/8/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class CalenderController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerCell = "headerCell"
    let calendercell = "calenderCell"
    
    let daysOfMonth = [
    "1","2","3", "4", "5", "6","7","8", "9", "10", "11","12","13", "14", "15","16","17","18", "19", "20","21","22","23", "24", "25", "26","27","28", "29", "30","31"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        collectionView?.register(CalenderheaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCell)
        collectionView?.register(CalenderCellController.self, forCellWithReuseIdentifier: calendercell)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = daysOfMonth[indexPath.item]
        print(item)
        let dailyCalender = DailyCalenderController()
        let nav = CustomNavigation(rootViewController: dailyCalender)
        present(nav, animated: true) {
            print("hello dailly Act")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 0, 5)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCell, for: indexPath)as? CalenderheaderCell
        
        header!.backgroundColor = .white
        
        return header!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysOfMonth.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 8, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendercell, for: indexPath) as? CalenderCellController
        let path = daysOfMonth[indexPath.item]
        cell?.days.text = path
        
        return cell!
    }
    
}
