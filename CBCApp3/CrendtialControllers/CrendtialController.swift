//
//  CrendtialController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 8/11/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class CrendtialController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let husbandryCell = "husbandryCell"
    let crendtial = [
    "Cage Wash", "Husbandry", "Vet Services", "Investigator"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        collectionView?.indicatorStyle = .white
       navigationItem.title = "CBC"
        collectionView?.register(CrenditalCells.self, forCellWithReuseIdentifier: husbandryCell)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cageWashLogin = CageWashLoginController()
            let navCon = CustomNavigation(rootViewController: cageWashLogin)
            present(navCon, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let flow = UICollectionViewFlowLayout()
            let husbandryLogInContoller = HusbandryFlagController(collectionViewLayout:flow)
            let navCon = CustomNavigation(rootViewController: husbandryLogInContoller)
            present(navCon, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let flow = UICollectionViewFlowLayout()
            let vetServicesContoller = VetServicesFlagController(collectionViewLayout:flow)
            let navCon = CustomNavigation(rootViewController: vetServicesContoller)
            present(navCon, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            let flow = UICollectionViewFlowLayout()
            let investigatorLogin = InvestigatorController(collectionViewLayout:flow)
            let navCon = CustomNavigation(rootViewController: investigatorLogin)
            present(navCon, animated: true, completion: nil)
        }
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crendtial.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: husbandryCell, for: indexPath) as? CrenditalCells
        let path = crendtial[indexPath.row]
        cell?.menuLab.text = path
        return cell!
    }
}
