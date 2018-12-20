//
//  VetServicesFlagController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/31/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

class VetServicesFlagController: UICollectionViewController,UICollectionViewDelegateFlowLayout, MFMailComposeViewControllerDelegate,VetServecisesHealthFlagCEllDelegate,VetServicesFloodedCellDelegate,VetServicesSeperatedProtocol, VetServicesOverCrowdedProtocol,VetServicesGrosslyOverCrowdedProtocol,vetServicesNonComplianteProtocol,VetServicesInvestigatorUnknownCellProtocol {
    func addTraetMentController(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    
    
   
    
   
    
    func addInvestigatorUnknownEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addNonCompliantFrontEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addGrowslyOverCrowdedEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addOverCrowdedVetServicesEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addSeperatedEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addFloodedEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    
    
    func addHealthCheckEmailView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    
    let vetServiceHealthCheckCell = "VetServiceHealthCheckCell"
    let vetServiceFloodedCell = "vetServiceFloodedCell"
    let vetServicesOverCrowedCell = "vetServicesOverCrowedCell"
    let vetServicesNonCompliantCell = "vetServicesNonCompliantCell"
    let vetServicesWeanedCell = "vetServicesWeanedCell"
    let grosslyCell = "grosslyCell"
    let vetservicesUnknown = "vetservicesUnknown"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Vet Service Flag Cards"
        collectionView?.backgroundColor = .white
      
        collectionView?.register(CategoryCellVetHealthCheck.self, forCellWithReuseIdentifier: vetServiceHealthCheckCell)
        collectionView?.register(CategoryCellVetFlooded.self, forCellWithReuseIdentifier: vetServiceFloodedCell)
        collectionView?.register(CategoryCellVetSeperated.self, forCellWithReuseIdentifier: vetServicesWeanedCell)
        collectionView?.register(CategoryCellVetOvercrowded.self, forCellWithReuseIdentifier: vetServicesOverCrowedCell)
        collectionView?.register(CategoryCellVetNonComplainteID.self, forCellWithReuseIdentifier: vetServicesNonCompliantCell)
        collectionView?.register(CategoryCellVetUnknown.self, forCellWithReuseIdentifier: vetservicesUnknown)
        collectionView?.register(CategoryCellVetGrosslyOverCrowded.self, forCellWithReuseIdentifier: grosslyCell)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(handleBack))
    }
    @objc func handleBack() {
         dismiss(animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
            collectionView.dequeueReusableCell(withReuseIdentifier: vetServiceHealthCheckCell, for: indexPath)
            let flow = UICollectionViewFlowLayout()
            let vetServeciesHealthController =  VetServeciesHealthController(collectionViewLayout: flow)
            let navCon = CustomNavigation(rootViewController: vetServeciesHealthController)
            present(navCon, animated: true, completion: nil)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 1000)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let vetServicesHealthCell = collectionView.dequeueReusableCell(withReuseIdentifier: vetServiceHealthCheckCell, for: indexPath) as? CategoryCellVetHealthCheck
            vetServicesHealthCell?.delegate = self
            
            return vetServicesHealthCell!
        } else if indexPath.row == 1 {
            let vetFloodedCell = collectionView.dequeueReusableCell(withReuseIdentifier: vetServiceFloodedCell, for: indexPath) as? CategoryCellVetFlooded
            vetFloodedCell?.delegate = self
            return vetFloodedCell!
        } else if indexPath.row == 2 {
            let cageSeperated = collectionView.dequeueReusableCell(withReuseIdentifier: vetServicesWeanedCell, for: indexPath) as? CategoryCellVetSeperated
            cageSeperated?.cageSeperatedDelegate = self
            return cageSeperated!
        } else if indexPath.row == 3 {
            let overcrowdedCell = collectionView.dequeueReusableCell(withReuseIdentifier: vetServicesOverCrowedCell, for: indexPath) as? CategoryCellVetOvercrowded
            overcrowdedCell?.vetServicesOvercrowdedDelegate = self
            return overcrowdedCell!
        } else if indexPath.row == 4 {
           let growslleyCell = collectionView.dequeueReusableCell(withReuseIdentifier: grosslyCell, for: indexPath) as? CategoryCellVetGrosslyOverCrowded
            growslleyCell?.grosslyOverCrowdedDelegate = self
            return growslleyCell!
        } else if indexPath.row == 5 {
            let noncompliante = collectionView.dequeueReusableCell(withReuseIdentifier: vetServicesNonCompliantCell, for: indexPath) as? CategoryCellVetNonComplainteID
            noncompliante?.nonCompliantIdFrontDelegate = self
            return noncompliante!
        } else if indexPath.row == 6 {
            let unknwonCell = collectionView.dequeueReusableCell(withReuseIdentifier: vetservicesUnknown, for: indexPath) as? CategoryCellVetUnknown
            unknwonCell?.vetServicesUnknownDelegate = self
            return unknwonCell!
        }
        
        return UICollectionViewCell()
        
    }
    
}
