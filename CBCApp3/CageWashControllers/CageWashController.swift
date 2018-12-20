//
//  CageWashController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 11/19/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class CageWashController: UICollectionViewController,UICollectionViewDelegateFlowLayout, DirtyPushingCellDelegate {
    func handlePushingEmail(view: UIViewController) {
        print("dimelooo")
        present(view, animated: true, completion: nil)
    }
    
    let dirtyPushing = "dirtyPushing"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(DirtyPushingCell.self, forCellWithReuseIdentifier: dirtyPushing)
        navigationItem.title = "CAGE WASH"
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 700)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row == 0 {
            let dirtyPushingCell = collectionView.dequeueReusableCell(withReuseIdentifier: dirtyPushing, for: indexPath) as? DirtyPushingCell
            dirtyPushingCell?.dirtyDelegate = self
            return dirtyPushingCell!
            
            
//        }
//        return UICollectionViewCell()
    }
}
