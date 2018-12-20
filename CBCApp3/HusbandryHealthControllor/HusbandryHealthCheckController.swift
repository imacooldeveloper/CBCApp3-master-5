//
//  HusbandryHealthCheckController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/27/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI



class HusbandryHealthCheckController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MFMailComposeViewControllerDelegate,HusbandryHealthFlagCellDelegate,HUsbandryHandleAllEMailDelegate,HusbandryHeaderFlagsCellProtocool {
  
    
   
    
   
    
    var collectionViewData = [CellData]()
    
    var flags = [HealthCheck]()
    var cellHealth = [HusbandryHealthCheckFlagCell]()
    var mortalityCell = [HusbandryMortalityFlagCell]()
    
    var healthChechFlagprotocol: HusbandryHeaderFlagsCellProtocool?
     let healthCell = HusbandryHealthCheckFlagCell()
    
    
    func addMortalityHealthCheck(mortalityFlag: HusbandryMortalityFlagCell) {

        mortalityCell.append(mortalityFlag)
        num.flags.append(mortalityFlag)
        let indexPath = IndexPath(item: mortalityCell.count - 1, section: 0)
        collectionView?.insertItems(at: [indexPath])
        print("mmg")
    }
    var protooclView: HusbandryHeaderFlagsCell?
    func addHealthChechFlag(healthFlag: HusbandryHealthCheckFlagCell) {
        print("dropp more flags")
        
        num.flags.append(healthFlag)
        
//            cellHealth.append(healthFlag)
            let indexPath = IndexPath(item: cellHealth.count + 1, section: 0)
            collectionView?.insertItems(at: [indexPath])
        collectionView?.reloadData()
            print("yerrrr")
        
        
    }
    
    
    
       let headerID = "headerID"
    
    func healthQuestion(view: UIViewController) {
        print("Healthhhhhh")
        present(view, animated: true, completion: nil)
    }
    
    
//
    func allEmailDelegate(view: UIViewController) {
        print("delegate")
        present(view, animated: true, completion: nil)
    }
    func addEmailView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
   
    
    func didAddFlag(healthCheck: HealthCheck) {  
//        flags.append(healthCheck)
//        let cellFlag = IndexPath(row: flags.count - 1, section: 0)
//        collectionView?.insertItems(at:[cellFlag])
//        print("yerr")
    }
//    var husbuandryCon: HusbandryHealthCheckFlagCell?

    let healthCheckCell = "healthCheckCell"
    let mortality = "mortalityCell"
    let cell = HusbandryHealthCheckFlagCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewData = [
        CellData(open: false, title: "HealthCheck", sectionData: [HusbandryHealthCheckFlagCell()]),
        CellData(open: false, title: "Mortality", sectionData: [HusbandryMortalityFlagCell()])
        ]
        navigationItem.title = "Health Check"
        collectionView?.register(HusbandryHealthCheckFlagCell.self, forCellWithReuseIdentifier: healthCheckCell)
        collectionView?.register(HusbandryMortalityFlagCell.self, forCellWithReuseIdentifier: mortality)
        let addRightButt = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(handleAddMoreFlags))
        let allEmailsButt = UIBarButtonItem(title: "ALL", style: .plain, target: self, action: #selector(handleALL))
        collectionView?.register(HusbandryHeaderFlagsCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        navigationItem.setRightBarButtonItems([addRightButt,allEmailsButt], animated: true)
       
       collectionView?.backgroundColor = .white

        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
   
    @objc func handleALL()  {
       
    
        
    }
    
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    var companies = [HealthCheck]()
 
    @objc func handleAddMoreFlags() {
        print("dropp more flags")
        let anotherCell = HusbandryHealthCheckFlagCell()
       cellHealth.append(anotherCell)
        let indexPath = IndexPath(item: cellHealth.count - 1, section: 0)
        collectionView?.insertItems(at: [indexPath])
      
       
          collectionView?.reloadData()
        
        print("addd:", indexPath )
    }
    let emailCell = HusbandryHealthCheckFlagCell()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
   
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return collectionViewData.count
//    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as? HusbandryHeaderFlagsCell
        header?.backgroundColor = .red
        header?.healthChechFlagDelegate = self
        return header!
    }
  
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if cell?.isSelected == true {
            cell?.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.3450980392, blue: 0.2862745098, alpha: 1)


        }  else {
        cell?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    }
    var health = [HealthCheck]()
  
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 700)
    }
    var num = AllFlags.init(flags: [HusbandryHealthCheckFlagCell()])
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return cellHealth.count
    }
    var model = HealthCheck?.self
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: healthCheckCell, for: indexPath) as? HusbandryHealthCheckFlagCell
     
        
                        cell?.emailDelegate = self
                        cell?.delegate = self
      
            return cell!
        
    }
   
    
    
}

struct CellData {
    var open = Bool()
    var title = String()
    var sectionData = [UICollectionViewCell]()
}

struct AllFlags {
    var flags: [UICollectionViewCell] = [
        HusbandryMortalityFlagCell(), HusbandryMortalityFlagCell()
        ]
    
}
