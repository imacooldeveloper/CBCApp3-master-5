//
//  InvestigatorController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/24/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class InvestigatorController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let doNotTouch = "doNotTouch"
    let speacialFeed = "speacialFeed"
    let Hazard = "Hazard"
    let surgeryCard = "surgeryCard"
    let euthanasia = "euthanasia"
    let shipTo = "shipTo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView?.register(DoNotTouchCell.self, forCellWithReuseIdentifier: doNotTouch)
        collectionView?.register(SpeacialFeedCell.self, forCellWithReuseIdentifier: speacialFeed)
        collectionView?.register(SurgeryCardCell.self, forCellWithReuseIdentifier: surgeryCard)
        collectionView?.register(HazardCell.self, forCellWithReuseIdentifier: Hazard)
        collectionView?.register(ShipToCell.self, forCellWithReuseIdentifier: shipTo)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 1000)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let doNotTouchCell = collectionView.dequeueReusableCell(withReuseIdentifier: doNotTouch, for: indexPath) as? DoNotTouchCell

            return doNotTouchCell!
        } else if indexPath.row == 1 {
            let speacialFeedCell = collectionView.dequeueReusableCell(withReuseIdentifier: speacialFeed, for: indexPath) as? SpeacialFeedCell
            
            return speacialFeedCell!
        } else if indexPath.row == 2 {
            let surgeryCell = collectionView.dequeueReusableCell(withReuseIdentifier: surgeryCard, for: indexPath) as? SurgeryCardCell
            
            return surgeryCell!
        } else if indexPath.row == 3 {
            let hazardCell = collectionView.dequeueReusableCell(withReuseIdentifier: Hazard, for: indexPath) as? HazardCell
            
            return hazardCell!
        } else if indexPath.row == 4 {
            let shipToCell = collectionView.dequeueReusableCell(withReuseIdentifier: shipTo, for: indexPath) as? ShipToCell
            
            return shipToCell!
        }
  
        
        return UICollectionViewCell()
    }
}
