//
//  husbandryFlagController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/13/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

class HusbandryFlagController: UICollectionViewController,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, HusbandryHealthFlagCellDelegate,HusbandryHealthFlagQuestionDelegate, HusbandryOverCrowdedCellDelegate,husbandryMortalityFlagCellProtocool,husbandryEmergencyProtocol,husbandryNewRecivingProtocol,husbandryLitterProtocol, NonComplianteIdProtocol, InvestigatorUnknownProtocol {
   
    
      
    func invesigatorAddEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addNonComplianteIdEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    
    
    func addLitterEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addNewRecivingEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addHusbandryEmergencyView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func addMortalityEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
        
    }
    
    
      var collectionViewData = [CellData]()
    
    var healthQuestion = HusbandryHealthCheckFlagCell()
    
    func healthCheckQuestionMark(view: UIViewController) {
        
        present(view, animated: true, completion: nil )
        print("yerrr")
    }
    func sendOverCrowdedEmail(view: UIViewController) {
        present(view, animated: true, completion: nil)
        print("overcrowded")
    }
    var jsonString: String?
    
    var delegate: HusbandryHealthCheckFlagCell?
    func addEmailView(view: UIViewController) {
         present(view, animated: true, completion: nil)
        
      
    }

    
    let heathCheck = "heathCheck"
    let mortality = "mortality"
    let overCrowded = "overCrowded"
    let emergencyCel = "emergency"
    let receivingCell = "receivingCell"
    let newLitterCell = "newLitterCell"
    let nonComplianteIDFrontCell = "nonComplianteIDFrontCell"
    let investigatorUnknownCell = "investigatorUnknownCell"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = jsonString
        collectionView?.allowsMultipleSelection = true
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: heathCheck)
        collectionView?.register(CategoryCellMortality.self, forCellWithReuseIdentifier: mortality)
        collectionView?.register(CategoryCellOverCrowded.self, forCellWithReuseIdentifier: overCrowded)
        collectionView?.register(CategoryCellEmegrency.self, forCellWithReuseIdentifier: emergencyCel)
        collectionView?.register(CategoryCellNewReciving.self, forCellWithReuseIdentifier: receivingCell)
        collectionView?.register(CategoryCellLitter.self, forCellWithReuseIdentifier: newLitterCell)
        collectionView?.register(CategoryCellNonCompiant.self, forCellWithReuseIdentifier: nonComplianteIDFrontCell)
        collectionView?.register(CategoryCellUnknown.self, forCellWithReuseIdentifier: investigatorUnknownCell)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleMenu))
        
          navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        collectionView?.backgroundColor = .white
       collectionView?.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Print", style: .plain, target: self, action: #selector(handleMul))
        collectionView?.allowsSelection = true
    }
    var allowsMultipleSelection = true
    @objc func handleMul() {
//        guard let allowsMultipleSelection = collectionView?.allowsSelection else { return }
//        if allowsMultipleSelection {
//            print("yerrr")
//            print("what did i select")
//        }
        
        
        let printPaper = UIPrintPaper()
        printPaper.paperSize.applying(.init(a: 50, b: 50, c: 50, d: 50, tx: 50, ty: 50))
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfo.OutputType.general
        printInfo.jobName = "My Print Job"
        
        // Set up print controller
        let printController = UIPrintInteractionController.shared
        
        printController.printInfo = printInfo
        printController.printFormatter?.maximumContentHeight = 200
        let cell = HusbandryHealthCheckFlagCell()
        let hill = cell.taskView2
        // Assign a UIImage version of my UIView as a printing iten
        
        printController.printingItem =  self.view.toImage()
        
        // If you want to specify a printer
        //        guard let printerURL = URL(string: "Your printer URL here, e.g. ipps://HPDC4A3E0DE24A.local.:443/ipp/print") else { return }
        //         let currentPrinter = UIPrinter(url: printerURL)
        
        //        printController.print(to: currentPrinter, completionHandler: nil)
        
        // Do it
        printController.present(from: self.view.frame, in: self.view, animated: true, completionHandler: nil)
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func handleMenu() {
        let menuController = MenusControllers()
        
        let navCon = UINavigationController(rootViewController: menuController)
        present(navCon, animated: true) {
            print("Menu controller")
        }
        
    }
    
  
    //MARK: -Cell Views
    
    
    
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch (indexPath.row)   {
//        case 0:
//            print("hello there")
//            collectionView.dequeueReusableCell(withReuseIdentifier: heathCheck, for: indexPath) as? HusbandryHealthCheckFlagCell
//            let flow = UICollectionViewFlowLayout()
//            let healthController = HusbandryHealthCheckController(collectionViewLayout: flow)
//
//           let navCon = CustomNavigation(rootViewController: healthController)
//
//            present(navCon, animated: true) {
//                print("passing the healthController")
//
//            }
//        case 1:
//           collectionView.dequeueReusableCell(withReuseIdentifier: mortality, for: indexPath)
//        default:
//            break
//        }
    
        
        
//        if indexPath.row == 0 {
//            if collectionViewData[indexPath.section].open == true {
//                collectionViewData[indexPath.section].open = false
//                let section = IndexSet.init(integer: indexPath.section)
//                collectionView.reloadSections(section)
//            } else {
//                collectionViewData[indexPath.section].open = true
//                let section = IndexSet.init(integer: indexPath.section)
//                collectionView.reloadSections(section)
//            }
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 700)
    }
  
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

       return 8
//        if collectionViewData[section].open == true {
//            return collectionViewData[section].sectionData.count + 1
//        } else {
//            return 1
//        }
    }
//    var healthCell = HusbandryHealthCheckFlagCell()
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            
           
            let healthCell = collectionView.dequeueReusableCell(withReuseIdentifier: heathCheck, for: indexPath) as? CategoryCell
        
//            husbandryHEalth?.delegate = self
//            husbandryHEalth?.healthQuestionDelegate = self
            healthCell?.delegate = self
            healthCell?.healthQuestionDelegate = self
            
//            healthCell?./? = self
            return healthCell!
            
        } else if indexPath.row == 1 {
            let mortalityCell = collectionView.dequeueReusableCell(withReuseIdentifier: mortality, for: indexPath) as? CategoryCellMortality
            mortalityCell?.mortalityDelegate = self
            return mortalityCell!
            
        } else if indexPath.row == 2 {
            let overCrowdedCell = collectionView.dequeueReusableCell(withReuseIdentifier: overCrowded, for: indexPath) as? CategoryCellOverCrowded
            overCrowdedCell?.overCrowdedDelegate = self
            return overCrowdedCell!
            
        } else if indexPath.row == 3 {
            let emergencyCell = collectionView.dequeueReusableCell(withReuseIdentifier: emergencyCel, for: indexPath) as? CategoryCellEmegrency
            emergencyCell?.emergencyDelegate = self
        return emergencyCell!
            
        } else if indexPath.row == 4 {
            let newReveivingCell = collectionView.dequeueReusableCell(withReuseIdentifier: receivingCell, for: indexPath) as? CategoryCellNewReciving
            newReveivingCell?.newRecivingDelegate = self
            return newReveivingCell!
        } else if indexPath.row == 5 {
            let newLitter = collectionView.dequeueReusableCell(withReuseIdentifier: newLitterCell, for: indexPath) as? CategoryCellLitter
            newLitter?.litterDelegate = self
            return newLitter!
        } else if indexPath.row == 6 {
            let nonCompliantIDFront = collectionView.dequeueReusableCell(withReuseIdentifier: nonComplianteIDFrontCell, for: indexPath) as? CategoryCellNonCompiant
            nonCompliantIDFront?.nonComplianteIdDelegate = self
            return nonCompliantIDFront!
        } else if indexPath.row == 7 {
            let investigatorUnkown = collectionView.dequeueReusableCell(withReuseIdentifier: investigatorUnknownCell, for: indexPath) as? CategoryCellUnknown
            investigatorUnkown?.unknownDelegate = self
            return investigatorUnkown!
        }
     
          return  UICollectionViewCell()
    }
    

}




extension UIView {
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
