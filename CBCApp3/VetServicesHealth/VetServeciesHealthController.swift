//
//  VetServeciesHealthController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 8/8/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

class VetServeciesHealthController: UICollectionViewController, UICollectionViewDelegateFlowLayout,VetServecisesHealthFlagCEllDelegate,MFMailComposeViewControllerDelegate {
    func addTraetMentController(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    
    
    func addHealthCheckEmailView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    
    
    var vetServicesHealthCell = [VetServicesHealthFlagCell]()
    let vetHealthCell = "vetHealthCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(VetServicesHealthFlagCell.self, forCellWithReuseIdentifier: vetHealthCell)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(handleAddMoreFlags))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func handleAddMoreFlags() {
        print("dropp more flags")
        let anotherCell = VetServicesHealthFlagCell()
        vetServicesHealthCell.append(anotherCell)
        let indexPath = IndexPath(item: vetServicesHealthCell.count - 1, section: 0)
        collectionView?.insertItems(at: [indexPath])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 1000)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

      
            return vetServicesHealthCell.count
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vetHealthCellFlag = collectionView.dequeueReusableCell(withReuseIdentifier: vetHealthCell, for: indexPath) as? VetServicesHealthFlagCell
        vetHealthCellFlag?.delegate = self
        
        return vetHealthCellFlag!
        
    }
}
