//
//  VetServicesFloodedCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/23/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

protocol VetServicesFloodedCellDelegate {
    func addFloodedEmail(view: UIViewController)
}



class CategoryCellVetFlooded: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    
    private let cellID = "cellID"
   var delegate: VetServicesFloodedCellDelegate?
    
    
    
    
    let appCollectionViews: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero,collectionViewLayout: flow)
        collection.allowsMultipleSelection = true
        collection.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    var placehol:HusbandryHealthCheckFlagCell?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var cell: HusbandryHealthCheckFlagCell?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("yerrrr",indexPath.row)
        placehol?.taskView2.backgroundColor = .red
        //       appCollectionViews.allowsMultipleSelection = true
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? VetServicesFloodedCell {
            
            cell.delegate = self.delegate
            print(indexPath.row)
            
            return cell
        }
        return UICollectionViewCell()
        //
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width, height: 1000)
    }
    
    
    
    func setupViews() {
        //        backgroundColor = .red
        addSubview(appCollectionViews)
        appCollectionViews.dataSource = self
        appCollectionViews.delegate = self
        
        appCollectionViews.register(VetServicesFloodedCell.self, forCellWithReuseIdentifier: cellID)
        
        appCollectionViews.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}






class VetServicesFloodedCell: UICollectionViewCell, UISearchBarDelegate,MFMailComposeViewControllerDelegate {
    
    
    var delegate: VetServicesFloodedCellDelegate?
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "Flooded"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    
    var roomNum: UILabel = {
        var room = UILabel()
        room.text = "Room:"
        room.textColor = .white
        
        room.font = UIFont.boldSystemFont(ofSize: 30)
        return room
    }()
    var roomPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Room Number"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var cageLocationLBL: UILabel = {
        var rowNum = UILabel()
        rowNum.text = "Location:"
        rowNum.font = UIFont.boldSystemFont(ofSize: 30)
        rowNum.textColor = .white
        
        return rowNum
    }()
    var cageLocationPlace: UITextField = {
        var text = UITextField()
        text.placeholder = "Where is the Cage Located"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    var datePlaceHolder: UILabel = {
        var text = UILabel()
        //        text.placeholder = "04/21/18"
        //
        text.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        text.contentMode = .center
        //        text.borderStyle = .roundedRect
        text.layer.cornerRadius = 6
        text.layer.masksToBounds = true
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var cageNum: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "Cage#"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    var cageNumPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Ex 000134"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var rackNumLBL: UILabel = {
        var husbandry = UILabel()
        husbandry.text = "Rack:"
        husbandry.font = UIFont.boldSystemFont(ofSize: 30)
        husbandry.textColor = .white
        
        return husbandry
    }()
    
    
    var rackNumPlace: UITextField = {
        var text = UITextField()
        text.placeholder = "Rack #"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    let protocoolNumLBL: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "Protocol#:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    let protocoolNumPlaceHolder: UITextField = {
        let text = UITextField()
        text.placeholder = "protocol#"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    let animalDiscription: UILabel = {
        let lab = UILabel()
        lab.text = "Animals in cage were found to be:"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        return lab
    }()
    let dryHealthy: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.text = "Dry & Healthy:"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        
        return lab
    }()
    var dryHealthyPlaceHolder: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Yes", "NO"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    let moribund: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.text = "Moribund:"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        return lab
    }()
    var moribundPlaceHolder:DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Yes", "NO"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    
    lazy var wetDried: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.text = "Wet and were hand dried:"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        return lab
    
    }()
    var wetDriedPlaceHolder:DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Yes", "NO"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
           
        }
        
        return dropDown
    }()
   
    let pupsInCage: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.text = "Pups in cage:"
        lab.font = UIFont.boldSystemFont(ofSize: 28)
        lab.contentMode = .center
        return lab
    }()
    var pupsInCagePlaceHolder: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["1", "2","3","4","5","6", "7","8","9","10"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    let monotoring: UILabel = {
        let lab = UILabel()
//        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.text = "Monitoring (Veterinary Services):"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        return lab
    }()
    let twentyFour: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.numberOfLines = 0
        lab.text = "24 Hours\n48 Hours"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        return lab
    }()
    let fortyEghit: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.text = "48 HOURS:"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.contentMode = .center
        return lab
    }()
    var timePlaceHolder: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["24", "48"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    
    
    var notePlaceHolder: UITextView = {
        var text = UITextView()
        //        text.placeholder = "    Extra Notes"
        
        
        text.textContainer.maximumNumberOfLines = 40
        text.textContainer.lineBreakMode = .byTruncatingTail
        text.contentMode = .center
        //        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    lazy var sendToVetBTN: UIButton = {
        var btn = UIButton(type: .system)
        btn.isSelected = false
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
       
        return btn
    }()
    
    private func isEmthpy() {
        let  dryHealthyEmpty = dryHealthyPlaceHolder.text?.count
        let moribundEmtpy = moribundPlaceHolder.text?.count
        let pupsInCageEmtpy = pupsInCagePlaceHolder.text?.count
        let wetDriedPEmtpy = wetDriedPlaceHolder.text?.count
        let notesEmpty = notePlaceHolder.text.count
        let roomEmtpy = roomPlaceHolder.text?.count
        let locationEmtpy = cageLocationPlace.text?.count
        let rackEmtpy = rackNumPlace.text?.count
        let hoursEmpty = timePlaceHolder.text?.count
        if dryHealthyEmpty == 0 {
            healthIssueLab.text = nil
        } else {
            healthIssueLab.text = "<br>Animals where found dry & Healthy:    \( dryHealthyPlaceHolder.text ?? "")"
        }
        if moribundEmtpy == 0 {
            treatMentLab.text = nil
        } else {
            treatMentLab.text = "<br>Animals in cage where found Moribund: \(moribundPlaceHolder.text ?? "") "
        }
        if pupsInCageEmtpy == 0 {
            monotoringLab.text = nil
        } else {
            monotoringLab.text = "<br>Pups in cage:\(pupsInCagePlaceHolder.text ?? "") "
        }
        if wetDriedPEmtpy == 0 {
            euthanasiaRecomended.text = nil
        } else {
            euthanasiaRecomended.text = "<br>Animals Where found wet and were hand dried: \(wetDriedPlaceHolder.text ?? "") "
        }
        if notesEmpty == 0 {
            extraNotes.text = nil
        } else {
            extraNotes.text = "<br>Extra Notes\(notePlaceHolder.text ?? "")"
        }
        if roomEmtpy == 0 {
            roomLaby.text = nil
        } else {
            roomLaby.text = "Room: \(roomPlaceHolder.text ?? "")"
        }
        if locationEmtpy == 0 {
            LocationLaby.text = nil
        } else {
            LocationLaby.text = "Location: \(cageLocationPlace.text ?? "")"
        }
        if rackEmtpy == 0 {
            RackLaby.text = nil
        } else {
            RackLaby.text = "Rack: \(rackNumPlace.text ?? "")"
        }
        if hoursEmpty == 0 {
            hoursLaby.text = nil
        } else {
            hoursLaby.text = "<br>Veterinary Services is monotoring the cages for \(timePlaceHolder.text ?? "") hours"
        }
        
    }
    private let healthIssueLab = UILabel()
    private let treatMentLab = UILabel()
    private let monotoringLab = UILabel()
    private let euthanasiaRecomended = UILabel()
    private let extraNotes = UILabel()
    private let roomLaby = UILabel()
    private let LocationLaby = UILabel()
    private let RackLaby = UILabel()
    private let hoursLaby = UILabel()
    
    
   
    
    func configureMailController() -> MFMailComposeViewController {
         isEmthpy()
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["VetServices@rcokefeller.edu"])
       
        mailComposerVC.setSubject("\(healthCheckLbl.text ?? "")- \(roomLaby.text ?? "") \(RackLaby.text ?? "")")
        mailComposerVC.setMessageBody("To Whom it may Concern<br>Date -\(datePlaceHolder.text ?? "")<br>Room Number: \(roomPlaceHolder.text ?? "")<br>Rack Number \( rackNumPlace.text ?? "")<br>CageCard Number: \(search.text ?? "")<br>Protocol Number \(protocoolNumPlaceHolder.text ?? "")\( healthIssueLab.text ?? "")\(treatMentLab.text ?? "")\(monotoringLab.text ?? "")\(euthanasiaRecomended.text ?? "") \(hoursLaby.text ?? "")\(extraNotes.text ?? "")</<br><br><B> heating pad for two hours. Will continue to monitor for 48 hours.\nThe above room and cage contains animals with a flooded cage. The cage has been flagged with an green flooded cage card. If you have any questions or would like a veterinarian to examine the cage, please contact me via email or by calling.", isHTML: true)
        
        
        return mailComposerVC
    }
    
    
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        let con = ViewController()
        con.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    
    @objc func handleEmail () {
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController()
            if MFMailComposeViewController.canSendMail() {
                
                delegate?.addFloodedEmail(view: mailComposeViewController)
                
                
            } else {
                showMailError()
            }
            
            
        } else {
            showMailError()
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            print("Out of the email")
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Cage Number"
        searchController.searchBar.delegate = self
        searchBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        return searchBar
    }()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text ?? "")
        //👇🏻👇🏻Add CAGEID API From DATABASE 👇🏻👇🏻
    }
    lazy var refreshBtn: UIButton = {
        let refresh = UIButton(type: .system)
        refresh.setImage(#imageLiteral(resourceName: "reset").withRenderingMode(.alwaysOriginal), for: .normal)
        refresh.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        refresh.addTarget(self, action: #selector(handleRefresh), for: .touchUpInside)
        return refresh
    }()
    @objc func handleRefresh() {
        roomPlaceHolder.text = ""
        cageLocationPlace.text = ""
        rackNumPlace.text = ""
        protocoolNumPlaceHolder.text = ""
        dryHealthyPlaceHolder.text = ""
        moribundPlaceHolder.text = ""
        wetDriedPlaceHolder.text = ""
        pupsInCagePlaceHolder.text = ""
        timePlaceHolder.text = ""
        notePlaceHolder.text = ""
        cageNumPlaceHolder.text = ""
        
        datePlaceHolder.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    }
    
    
    func setupFloodedViews() {
        backgroundColor = .white
        addSubview(taskView2)
        
        taskView2.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 30, bottomPadding: 30, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
        taskView2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        taskView2.layer.borderWidth = 10
        taskView2.layer.masksToBounds = true
        
        
        taskView2.addSubview(healthCheckLbl)
        healthCheckLbl.anchor(top: taskView2.topAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        healthCheckLbl.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        // Date Label
        taskView2.addSubview(datePlaceHolder)
        
        datePlaceHolder.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: taskView2.leadingAnchor, right: healthCheckLbl.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 70, width: 0, height: 0)
        
        // Search bar
        taskView2.addSubview(search)
        search.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: healthCheckLbl.trailingAnchor , right: taskView2.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
       
        
        taskView2.addSubview(roomNum)
        roomNum.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 90, bottomPadding: 0, leftPadding: 70, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(roomPlaceHolder)
        roomPlaceHolder.anchor(top: roomNum.topAnchor, bottom: roomNum.bottomAnchor, left: roomNum.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        //protocool NUmber
        
        taskView2.addSubview(protocoolNumLBL)
        protocoolNumLBL.anchor(top: roomNum.topAnchor, bottom: roomNum.bottomAnchor, left: roomPlaceHolder.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(protocoolNumPlaceHolder)
        protocoolNumPlaceHolder.anchor(top: protocoolNumLBL.topAnchor, bottom: protocoolNumLBL.bottomAnchor, left: protocoolNumLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 5, width: 0, height: 0)
        // Location && rack#
        
        taskView2.addSubview(cageLocationLBL)
        cageLocationLBL.anchor(top: roomNum.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 70, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(cageLocationPlace)
        cageLocationPlace.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(rackNumLBL)
        rackNumLBL.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationPlace.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(rackNumPlace)
        rackNumPlace.anchor(top: rackNumLBL.topAnchor, bottom: rackNumLBL.bottomAnchor, left: rackNumLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 5, width: 0, height: 0)
        
        taskView2.addSubview(animalDiscription)
        animalDiscription.anchor(top: cageLocationLBL.bottomAnchor, bottom: nil, left: cageLocationLBL.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(dryHealthy)
        dryHealthy.anchor(top: animalDiscription.bottomAnchor, bottom: nil, left: cageLocationLBL.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(dryHealthyPlaceHolder)
        dryHealthyPlaceHolder.anchor(top: dryHealthy.bottomAnchor, bottom: nil, left: dryHealthy.leadingAnchor, right: dryHealthy.trailingAnchor, topPadding: 5, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height:30)
        taskView2.addSubview(moribund)
        moribund.anchor(top: dryHealthy.topAnchor, bottom: dryHealthy.bottomAnchor, left: dryHealthy.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(moribundPlaceHolder)
        moribundPlaceHolder.anchor(top: moribund.bottomAnchor, bottom: nil, left: moribund.leadingAnchor, right: moribund.trailingAnchor, topPadding: 5, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        taskView2.addSubview(wetDried)
        wetDried.anchor(top: dryHealthyPlaceHolder.bottomAnchor, bottom: nil, left: dryHealthy.leadingAnchor, right: nil, topPadding: 60, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 40)
        taskView2.addSubview(wetDriedPlaceHolder)
        wetDriedPlaceHolder.anchor(top: wetDried.bottomAnchor, bottom: nil, left: wetDried.leadingAnchor, right: wetDried.trailingAnchor, topPadding: 5, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        taskView2.addSubview(pupsInCage)
        pupsInCage.anchor(top: moribund.topAnchor, bottom: moribund.bottomAnchor, left: moribund.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(pupsInCagePlaceHolder)
        pupsInCagePlaceHolder.anchor(top: pupsInCage.bottomAnchor, bottom: nil, left: pupsInCage.leadingAnchor, right: pupsInCage.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 5, rightPadding: 0, width: 0, height: 30)
        taskView2.addSubview(monotoring)
        monotoring.anchor(top: wetDriedPlaceHolder.bottomAnchor, bottom: nil, left: wetDriedPlaceHolder.leadingAnchor, right: nil, topPadding: 60, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        taskView2.addSubview(twentyFour)
        twentyFour.anchor(top: monotoring.bottomAnchor, bottom: nil, left: monotoring.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
       
        taskView2.addSubview(timePlaceHolder)
        timePlaceHolder.anchor(top: twentyFour.topAnchor, bottom: twentyFour.bottomAnchor, left: twentyFour.trailingAnchor, right: nil, topPadding: 20, bottomPadding: 20, leftPadding: 5, rightPadding: 0, width: 60, height: 0)
        taskView2.addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: monotoring.bottomAnchor, bottom: nil, left: nil, right: taskView2.trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 70, width: 300, height: 80)
        
        taskView2.addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: notePlaceHolder.bottomAnchor, bottom: taskView2.bottomAnchor, left: nil, right: taskView2.trailingAnchor, topPadding: 60, bottomPadding: 70, leftPadding: 0, rightPadding: 30, width: 100, height: 0)
        
        taskView2.addSubview(refreshBtn)
        refreshBtn.anchor(top: nil, bottom: taskView2.bottomAnchor, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 30, leftPadding: 60, rightPadding: 0, width: 40, height: 40)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         setupFloodedViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
