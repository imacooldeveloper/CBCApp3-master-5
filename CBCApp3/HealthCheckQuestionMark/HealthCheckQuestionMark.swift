//
//  HealthCheckQuestionMark.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 9/19/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class HealthCheckQuestionMark: UICollectionViewController, UICollectionViewDelegateFlowLayout,HusbandryHealthFlagCellDelegate {
    func addHealthcCheckPlace(date: String, cageNum: String, roomPlace: String, locationPlace: String, rackPlace: String, notePlace: String) {
        print("'yer'")
    }
    
    func addEmailView(view: UIViewController) {
        
    }
    
    func healthQuestion(view: UIViewController) {
         present(view, animated: true, completion: nil)
    }
    
    let healthQuestionCell = "questionMark"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Health Checks"
        collectionView?.backgroundColor = .white
        collectionView?.register(HealthQuestionCell.self, forCellWithReuseIdentifier: healthQuestionCell)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServeces.instance.healthConcernsData.count
    }
//    let healthConditionArray = [
////    HealthConcerns(mouseTitle: "Fightsss Wounds", mouseImage: [#imageLiteral(resourceName: "fightWounds2"),#imageLiteral(resourceName: "fightWounds"),#imageLiteral(resourceName: "fightWounds3")], mouseDiscriptions: "Aggressive mouse (with no wounds) will bite the other mice Common in male mice Commonly seen along the rump/around the genitals")
//
//
//    ]
//    var healthCondition = [healthConditionArray]()
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: healthQuestionCell, for: indexPath) as? HealthQuestionCell
    
        let path = DataServeces.instance.getHealthData()[indexPath.item]
        
        cell?.updateViews(healthConcerns: path)
        
        return cell!
    }
}

struct HealthConcerns {
    var mouseTitle: String
    var mouseImage: String
    var mouseImage2: String
    var mouseImage3: String
    var mouseDiscriptions: String
    init(mouseTitle: String, mouseImage: String,mouseImage2: String,mouseImage3: String,mouseDiscriptions: String) {
        self.mouseTitle = mouseTitle
        self.mouseImage = mouseImage
        self.mouseImage2 = mouseImage2
        self.mouseImage3 = mouseImage3
        self.mouseDiscriptions = mouseDiscriptions
    }
}


class DataServeces{
    static let instance = DataServeces()
    
    let healthConcernsData = [
    HealthConcerns(mouseTitle: "Fight Wounds", mouseImage: "fightWounds.png", mouseImage2: "fightWounds2.png", mouseImage3: "fightWounds3.png", mouseDiscriptions: "Aggressive mouse (with no wounds) will bite the other mice Common in male mice Commonly seen along the rump/around the genitals"),
    
    HealthConcerns(mouseTitle: "Malocclusion", mouseImage: "overGrown1.png", mouseImage2: "overGrown2.png", mouseImage3: "yet", mouseDiscriptions: "Incisor (front) teeth are misaligned and overgrown")
    ]
    func getHealthData() -> [HealthConcerns] {
        
        return healthConcernsData
    }
}
