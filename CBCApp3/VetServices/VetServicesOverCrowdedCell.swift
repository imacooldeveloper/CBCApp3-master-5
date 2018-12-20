//
//  VetServicesOverCrowdedCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/30/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI
protocol VetServicesOverCrowdedProtocol {
    func addOverCrowdedVetServicesEmail(view:UIViewController)
}



class CategoryCellVetOvercrowded: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    
    private let cellID = "cellID"
   var vetServicesOvercrowdedDelegate: VetServicesOverCrowdedProtocol?
    
    
    
    
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
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? VetServicesOverCrowdedCell {
            
            cell.vetServicesOvercrowdedDelegate = self.vetServicesOvercrowdedDelegate
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
        
        appCollectionViews.register(VetServicesOverCrowdedCell.self, forCellWithReuseIdentifier: cellID)
        
        appCollectionViews.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}




class VetServicesOverCrowdedCell: UICollectionViewCell,MFMailComposeViewControllerDelegate {
    
    var vetServicesOvercrowdedDelegate: VetServicesOverCrowdedProtocol?
   
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7882352941, blue: 0.5176470588, alpha: 1)
        return square
    }()
    let healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "Over Crowded"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    
    let actionRequired: UILabel = {
        let lab = UILabel()
        lab.text = "Action Required \nSeparate and/or\nwean cages within \n            7DAYS"
        lab.numberOfLines = 0
        lab.contentMode = .center
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    
    let overDue: UILabel = {
        let lab = UILabel()
        lab.text = "OVERDUE"
        lab.numberOfLines = 0
        lab.contentMode = .center
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    
    let overDueDiscription: UILabel = {
        let lab = UILabel()
        lab.text = "Veterinary Services will not provide\nA second 24 hours notice and will \nseperate cage on:"
        lab.numberOfLines = 0
        lab.contentMode = .center
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    let line: UILabel = {
        let lab = UILabel()
        lab.text = "______________________________________________________"
        lab.numberOfLines = 0
      
        lab.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        text.font = UIFont.boldSystemFont(ofSize: 15)
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
    var dateLBL: UILabel = {
        var sectionNum = UILabel()
        sectionNum.text = "Date"
        sectionNum.font = UIFont.boldSystemFont(ofSize: 25)
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
    
    var search: UISearchBar = {
        let s = UISearchBar()
        s.barTintColor = #colorLiteral(red: 0.968627451, green: 0.7882352941, blue: 0.5176470588, alpha: 1)
        s.placeholder = "Cage Number"
        return s
    }()
    var notePlaceHolder: UITextView = {
        var text = UITextView()
        //        text.placeholder = "    Extra Notes"
        text.text = "notes"
        
        text.textContainer.maximumNumberOfLines = 40
        text.textContainer.lineBreakMode = .byTruncatingTail
        text.contentMode = .center
        //        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 15)
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
    var overDueDatePlace: UITextField = {
        var text = UITextField()
        text.placeholder = "DATE    "
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    
    
    lazy var sendToVetBTN: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Submit OverCrowded", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        //        btn.backgroundColor = .white
        ////        btn.layer.borderWidth = 2
        //        btn.titleLabel?.contentMode = .center
        //        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        
        return btn
    }()
    lazy var sendOverDue: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sumbit Overdue", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        //        btn.backgroundColor = .white
        ////        btn.layer.borderWidth = 2
        //        btn.titleLabel?.contentMode = .center
        //        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleOverDue), for: .touchUpInside)
        
        return btn
    }()
    
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
        overDueDatePlace.text = ""
        notePlaceHolder.text = ""
        cageNumPlaceHolder.text = ""
        
        datePlaceHolder.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    }
    private func isEmthpy() {
       
        let overDueEmtpy = overDueDatePlace.text?.count
        let notesEmpty = notePlaceHolder.text.count
        let roomEmtpy = roomPlaceHolder.text?.count
        let locationEmtpy = cageLocationPlace.text?.count
        let rackEmtpy = rackNumPlace.text?.count
        
       
        if notesEmpty == 0 {
            extraNotes.text = nil
        } else {
            extraNotes.text = "<br>Extra Notes\(notePlaceHolder.text ?? ""): "
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
        if overDueEmtpy == 0 {
            overDueLaby.text = nil
        } else {
            overDueLaby.text = "<br>Veterinary Services will not providec\nA second 24 hours notice and will \nseperate cage on: \(overDueDatePlace.text ?? "") Hours"
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
    private let overDueLaby = UILabel()
    
    
    
    @objc func handleOverDue() {
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController2()
            if MFMailComposeViewController.canSendMail() {
                
                vetServicesOvercrowdedDelegate?.addOverCrowdedVetServicesEmail(view: mailComposeViewController)
                
                
            } else {
                showMailError()
            }
            
            
        } else {
            showMailError()
        }
    }
    
    func configureMailController2() -> MFMailComposeViewController {
         isEmthpy()
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["VetServices@rcokefeller.edu"])
        
        mailComposerVC.setSubject("\(overDue.text ?? "")- \(roomLaby.text ?? "") \(RackLaby.text ?? "")")
        mailComposerVC.setMessageBody("To Whom it may Concern<br> Date:   \(datePlaceHolder.text ?? "")<br>Cage Number \( search.text ?? "")<br>Room#: \(roomPlaceHolder.text ?? "")<br>Rack# \(rackNumPlace.text ?? "")<br>Location:    \(cageLocationPlace.text ?? "")\(overDueLaby.text ?? "")</<br><br><B> The above room contains Grossly Overcrowded cage(s). We request that you separate and/or wean your cages within 24/ 48 HOURS to comply with the current cage density guidelines set forth by regulatory agencies. If you are unable to comply Veterinary Services is required to act on your behalf and separate and/or wean any Grossly Overcrowded cage(s). Please note that there will be an associated fee for this service and that we do not provide a second notice for Grossly Overcrowded cages. (Definition of Grossly Overcrowded: More than 10 adults per cage; More than 20 adults and/or weanlings of greater than 21 days of age; More than 33 animals of any age, 20 or more mice in a cage when there are two litters more than 14 days apart in age with pups of various ages + adults).  Thank you, ", isHTML: true)
        
        
        return mailComposerVC
    }
    
    
    func configureMailController() -> MFMailComposeViewController {
        isEmthpy()
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["VetServices@rcokefeller.edu"])
        
        mailComposerVC.setSubject("\(healthCheckLbl.text ?? "")- \(roomLaby.text ?? "") \(RackLaby.text ?? "")")
        mailComposerVC.setMessageBody("To Whom it may Concern <br> Date:   \(datePlaceHolder.text ?? "")<br>Cage Number \( search.text ?? "")<br>Room#: \(roomPlaceHolder.text ?? "")<br>Rack# \(rackNumPlace.text ?? "")<br>Location:\(cageLocationPlace.text ?? "")<br><br><B> The above room contains Overcrowded cage(s). We request that you separate and/or wean your cages within 7 DAYS to comply with the current cage density guidelines set forth by regulatory agencies. If you are unable to comply Veterinary Services is required to act on your behalf and separate and/or wean the Overcrowded cage(s). Please note that there will be an associated fee for this service and that we are no longer providing a second 24-hour notice.(Definition of Overcrowded: More than 5 adult mice per cage; Two adult mice with 1 to 2 litters of greater than 10 pups total; Pups past the 21 day weaning age; Two litters that are 14 days apart in age).  Thank you, ", isHTML: true)
        
        
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
        
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController()
            if MFMailComposeViewController.canSendMail() {
                
               vetServicesOvercrowdedDelegate?.addOverCrowdedVetServicesEmail(view: mailComposeViewController)
                
                
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
    
    
    var this = [HealthCheck]()
    func setUpOverCrwodedViews() {
        backgroundColor = .white
        addSubview(taskView2)
//        HealthCheck(date: datePlaceHolder.text ?? """, cageNum: cageNumPlaceHolder.text, roomPlace: roomPlaceHolder, locationPlace: cageLocationPlace, rackPlace: rackNumPlace, notePlace: notePlaceHolder)
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
        
        
        taskView2.addSubview(actionRequired)
        actionRequired.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding:0, width: 0, height: 0)
        actionRequired.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        
        taskView2.addSubview(roomNum)
        roomNum.anchor(top: actionRequired.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 70, rightPadding: 0, width: 0, height: 0)
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
        
        
        taskView2.addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: cageLocationLBL.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        sendToVetBTN.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        taskView2.addSubview(line)
        line.anchor(top: cageLocationLBL.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 90, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(overDue)
        overDue.anchor(top: line.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        overDue.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        taskView2.addSubview(overDueDiscription)
        overDueDiscription.anchor(top: overDue.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 20, bottomPadding: 00, leftPadding: 30, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(overDueDatePlace)
        overDueDatePlace.anchor(top: overDueDiscription.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 250, rightPadding: 0, width: 90, height: 40)
        
        taskView2.addSubview(sendOverDue)
        sendOverDue.anchor(top: nil, bottom: taskView2.bottomAnchor, left: nil, right: taskView2.trailingAnchor, topPadding: 0, bottomPadding: 30, leftPadding: 0, rightPadding: 30, width: 300, height: 0)
        taskView2.addSubview(refreshBtn)
        refreshBtn.anchor(top: nil, bottom: taskView2.bottomAnchor, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 30, leftPadding: 60, rightPadding: 0, width: 40, height: 40)
        
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpOverCrwodedViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
