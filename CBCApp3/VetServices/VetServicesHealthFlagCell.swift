//
//  VetServicesHealthFlagCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/31/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

protocol VetServecisesHealthFlagCEllDelegate {
    func addHealthCheckEmailView(view: UIViewController)
    func addTraetMentController(view: UIViewController)
}






class CategoryCellVetHealthCheck: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    
    private let cellID = "cellID"
     var delegate: VetServecisesHealthFlagCEllDelegate?
    
    
    
    
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
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? VetServicesHealthFlagCell {
            
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
        
        appCollectionViews.register(VetServicesHealthFlagCell.self, forCellWithReuseIdentifier: cellID)
        
        appCollectionViews.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}



class VetServicesHealthFlagCell: UICollectionViewCell,UISearchBarDelegate, MFMailComposeViewControllerDelegate {
    
    var delegate: VetServecisesHealthFlagCEllDelegate?
    
    var treatMent: TreatMents? {
        didSet{
            roomNum.text = treatMent?.room
        }
    }
    
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "Health Check"
        lab.font = UIFont.boldSystemFont(ofSize: 35)
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
        text.placeholder = "Room#"
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
        text.placeholder = "Location"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var dateLBL: UILabel = {
        var sectionNum = UILabel()
        sectionNum.text = "Date"
        sectionNum.font = UIFont.boldSystemFont(ofSize: 30)
        sectionNum.textColor = .white
        
        return sectionNum
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
        text.font = UIFont.boldSystemFont(ofSize: 20)
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
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    var healthIssueLbl: UILabel = {
        var husbandry = UILabel()
        husbandry.text = "Health Issue:"
        husbandry.font = UIFont.boldSystemFont(ofSize: 30)
        husbandry.textColor = .white
        
        return husbandry
    }()
    var monotoringLbl: UILabel = {
        var husbandry = UILabel()
       
        husbandry.text = "Monotoring:"
        husbandry.font = UIFont.boldSystemFont(ofSize: 30)
        husbandry.textColor = .white
        
        return husbandry
    }()
    
    var healthIssuePlace: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["hunched", "mass", "malocclusion", "hydrocephalus", "ataxia", "paralysis", "bite wounds", "eye bulge", "rectal prolapse", "necrosis"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8,90,91]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    var monitoring: UILabel = {
        var lab = UILabel()
        lab.text = "Monitoring (Vet Services)"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return lab
    }()
    var treatMentLbl: UILabel = {
        var husbandry = UILabel()
        husbandry.text = "Treatment:"
        husbandry.font = UIFont.boldSystemFont(ofSize: 30)
        husbandry.textColor = .white
        
        return husbandry
    }()
    
    var treatMentPlace:DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["TAB", "wet feed in cage", "trim nails", "trim teeth","monitoring"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
           
        }
        
        return dropDown
    }()
//    let textField1 = ""
  
    
    lazy var monitoringNoTreatment:DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Yes", "No"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            if dropDown.text == "Yes" {
                self.treatMentBtn.isEnabled = true
                self.treatMentBtn.isHidden = false
                self.treatMentBtn.addTarget(self, action: #selector(self.handletreatMents), for: .touchUpInside)
               self.treatMentBtn.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
                self.treatMentBtn.setTitle("Schedule treatment", for: .normal)
            } else if dropDown.text == "No"{
                self.treatMentBtn.isEnabled = false
                self.treatMentBtn.isHidden = true
            }
        }
        
        return dropDown
    }()
    let treatMentBtn = UIButton(type: .system)
    
    @objc func handletreatMents() {
        let treatMentController = TreatMentController()
        treatMentController.details = self
        let nav = CustomNavigation(rootViewController: treatMentController)
        delegate?.addTraetMentController(view: nav)
    }
    
    @objc func  handleMonitoring ()  {
       
        
        
    }
    var euthansiaLAb: UILabel = {
        var husbandry = UILabel()
        husbandry.text = "Euthanasia\nRecomended:"
        husbandry.font = UIFont.boldSystemFont(ofSize: 30)
        husbandry.textColor = .white
        husbandry.numberOfLines = 0
        
        return husbandry
    }()
    var euthanasiaRecommended:DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Yes", "No"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
        }
        
        return dropDown
    }()
    var protocoolNumLBL: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "Protocol#:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    var protocoolNumPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "protocol#"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var notePlaceHolder: UITextView = {
        var text = UITextView()
//        text.placeholder = "    Extra Notes"
//        text.text = "notes"
        
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
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        
        return btn
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Cage Number"
        searchController.searchBar.delegate = self
        searchBar.barTintColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
        
        return searchBar
    }()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text ?? "")
        
               if searchBar.text == "555" {
        roomPlaceHolder.text = "381"
        cageLocationPlace.text = "A1"
        rackNumPlace.text = "2"
        notePlaceHolder.text = ""
    } else {
    roomPlaceHolder.text = self.roomPlaceHolder.text
    cageLocationPlace.text = self.cageLocationPlace.text
    rackNumPlace.text = self.rackNumPlace.text
    notePlaceHolder.text = self.notePlaceHolder.text
    }
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
        healthIssuePlace.text = ""
        treatMentPlace.text = ""
        monitoringNoTreatment.text = ""
        euthanasiaRecommended.text = ""
        notePlaceHolder.text = ""
        cageNumPlaceHolder.text = ""
      
        datePlaceHolder.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        search.delegate = self
       
    }
    private func isEmthpy() {
        let  healthIssueEmpty = healthIssuePlace.text?.count
        let treatmentEmtpy = treatMentPlace.text?.count
        let recomendedEmtpy = euthanasiaRecommended.text?.count
        let monotoringEmtpy = monitoringNoTreatment.text?.count
        let notesEmpty = notePlaceHolder.text.count
        let roomEmtpy = roomPlaceHolder.text?.count
        let locationEmtpy = cageLocationPlace.text?.count
        let rackEmtpy = rackNumPlace.text?.count
        if healthIssueEmpty == 0 {
            healthIssueLab.text = nil
        } else {
            healthIssueLab.text = "<br>Health Issue: "
        }
         if treatmentEmtpy == 0 {
            treatMentLab.text = nil
        } else {
            treatMentLab.text = "<br>Treatment: "
        }
        if monotoringEmtpy == 0 {
            monotoringLab.text = nil
        } else {
            monotoringLab.text = "<br>Monotoring/No treatment: "
        }
        if recomendedEmtpy == 0 {
            euthanasiaRecomended.text = nil
        } else {
            euthanasiaRecomended.text = "<br>euthanasiaRecomended "
        }
        if notesEmpty == 0 {
            extraNotes.text = nil
        } else {
            extraNotes.text = "<br>Extra Notes: \(notePlaceHolder.text ?? "") "
        }
        if roomEmtpy == 0 {
            roomLaby.text = nil
        } else {
            roomLaby.text = "Room:\(roomPlaceHolder.text ?? "")"
        }
        if locationEmtpy == 0 {
            LocationLaby.text = nil
        } else {
            LocationLaby.text = "Location:\(cageLocationPlace.text ?? "")"
        }
        if rackEmtpy == 0 {
            RackLaby.text = nil
        } else {
            RackLaby.text = "Rack: \(rackNumPlace.text ?? "")"
        }
        
    }
    private let healthIssueLab = UILabel()
    private let treatMentLab = UILabel()
    private let monotoringLab = UILabel()
    private let euthanasiaRecomended = UILabel()
    private let extraNotes = UILabel()
    var roomLaby = UILabel()
    private let LocationLaby = UILabel()
    private let RackLaby = UILabel()
    
    
    func configureMailController() -> MFMailComposeViewController {
       isEmthpy()
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([""])
        
        mailComposerVC.setSubject("\(healthCheckLbl.text ?? "")- \(roomLaby.text ?? "") \(LocationLaby.text ?? "") \(RackLaby.text ?? "")")
       
        mailComposerVC.setMessageBody("To Whom it may Concern<br>Date -\(datePlaceHolder.text ?? "")<br>Room Number: \(roomPlaceHolder.text ?? "")<br>Rack Number \( rackNumPlace.text ?? "")<br>CageCard Number: \(search.text ?? "")<br>Protocol Number \(protocoolNumPlaceHolder.text ?? "")\(healthIssueLab.text ?? "")\(healthIssuePlace.text ?? "")\(treatMentLab.text ?? "")\(treatMentPlace.text ?? "")\(monotoringLab.text ?? "") \(monitoringNoTreatment.text ?? "")\(euthanasiaRecomended.text ?? "") \(euthanasiaRecommended.text ?? "") \(extraNotes.text ?? "")<br><br><B> The above animal(s) have a health concern and require treatment. If you would like Veterinary Services to provide treatment as stated above, please respond to this email with your approval to treat The cage has been flagged with an orange health check card. If you have any questions or would like a veterinarian to examine the cage(s), please contact me via email or by calling (insert your number).Thank you,", isHTML: true)
        
        return mailComposerVC
    }
    
    
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        let con = ViewController()
        con.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    @objc func handleEmail(){
        
        print("hello")
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController()
            if MFMailComposeViewController.canSendMail() {
                
                delegate?.addHealthCheckEmailView(view: mailComposeViewController)
                
            } else {
                showMailError()
            }
        }
        
    }
    
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            print("Out of the email")
        }
    }
    
    
    func setupViews() {
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
        
        datePlaceHolder.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: taskView2.leadingAnchor, right: healthCheckLbl.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
        
        // Search bar
        taskView2.addSubview(search)
        search.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: healthCheckLbl.trailingAnchor , right: taskView2.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
        
        // room cage id rack
        
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
        
        taskView2.addSubview(healthIssueLbl)
        healthIssueLbl.anchor(top: cageLocationLBL.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 70, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(healthIssuePlace)
        
        healthIssuePlace.anchor(top: healthIssueLbl.bottomAnchor, bottom: nil, left: healthIssueLbl.leadingAnchor, right: healthIssueLbl.trailingAnchor, topPadding: 5, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height:30)
        
        taskView2.addSubview(treatMentLbl)
        treatMentLbl.anchor(top: healthIssueLbl.topAnchor, bottom: healthIssueLbl.bottomAnchor, left: healthIssueLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(treatMentPlace)
        treatMentPlace.anchor(top: treatMentLbl.bottomAnchor, bottom: nil, left: treatMentLbl.leadingAnchor, right: treatMentLbl.trailingAnchor, topPadding: 5, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        
        taskView2.addSubview(monotoringLbl)
        monotoringLbl.anchor(top: treatMentLbl.topAnchor, bottom: treatMentLbl.bottomAnchor, left: treatMentLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(monitoringNoTreatment)
        
        monitoringNoTreatment.anchor(top: monotoringLbl.bottomAnchor, bottom: nil, left: monotoringLbl.leadingAnchor, right: monotoringLbl.trailingAnchor, topPadding: 5, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        taskView2.addSubview(euthansiaLAb)
        euthansiaLAb.anchor(top: monitoringNoTreatment.bottomAnchor, bottom: nil, left: monotoringLbl.leadingAnchor, right: monotoringLbl.trailingAnchor, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(euthanasiaRecommended)
        euthanasiaRecommended.anchor(top: euthansiaLAb.bottomAnchor, bottom: nil, left: euthansiaLAb.leadingAnchor, right: euthansiaLAb.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
//        taskView2.addSubview(treatMentBtn)
//        
//        treatMentBtn.anchor(top: euthanasiaRecomended.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
//        
        taskView2.addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: euthansiaLAb.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 90, bottomPadding: 0, leftPadding: 100, rightPadding: 100, width: 0, height: 150)
        notePlaceHolder.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        taskView2.addSubview(treatMentBtn)
        treatMentBtn.anchor(top: nil, bottom: notePlaceHolder.topAnchor, left: notePlaceHolder.leadingAnchor, right: nil, topPadding: 0, bottomPadding: 5, leftPadding: 0, rightPadding: 0, width: 400, height: 30)
        
        taskView2.addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: notePlaceHolder.bottomAnchor, bottom: taskView2.bottomAnchor, left: nil, right: taskView2.trailingAnchor, topPadding: 60, bottomPadding: 70, leftPadding: 0, rightPadding: 30, width: 100, height: 0)
        taskView2.addSubview(refreshBtn)
        refreshBtn.anchor(top: nil, bottom: taskView2.bottomAnchor, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 30, leftPadding: 60, rightPadding: 0, width: 40, height: 40)

    }
    
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
