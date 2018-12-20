//
//  HusbandryTryCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/29/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

//import UIKit
//import MessageUI
//
//class HusbandryTryCell: UICollectionViewCell,MFMailComposeViewControllerDelegate  {
//    
//    var husbuandryCon: HusbandryFlagController? {
//        didSet{
//            
//        }
//    }
//    
//    var taskView2: UIView = {
//        var square = UIView()
//        square.backgroundColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
//        return square
//    }()
//    var healthCheckLbl: UILabel = {
//        let lab = UILabel()
//        lab.text = "Health Check"
//        lab.font = UIFont.boldSystemFont(ofSize: 60)
//        return lab
//    }()
//    
//    var roomNum: UILabel = {
//        var room = UILabel()
//        room.text = "Room:"
//        room.textColor = .white
//        
//        room.font = UIFont.boldSystemFont(ofSize: 60)
//        return room
//    }()
//    var roomPlaceHolder: UITextField = {
//        var text = UITextField()
//        text.placeholder = "Room Number"
//        text.contentMode = .center
//        text.borderStyle = .roundedRect
//        text.font = UIFont.boldSystemFont(ofSize: 30)
//        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        return text
//    }()
//    var cageLocationLBL: UILabel = {
//        var rowNum = UILabel()
//        rowNum.text = "Location:"
//        rowNum.font = UIFont.boldSystemFont(ofSize: 40)
//        rowNum.textColor = .white
//        
//        return rowNum
//    }()
//    var cageLocationPlace: UITextField = {
//        var text = UITextField()
//        text.placeholder = "Where is the Cage Located"
//        text.contentMode = .center
//        text.borderStyle = .roundedRect
//        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        return text
//    }()
//    var dateLBL: UILabel = {
//        var sectionNum = UILabel()
//        sectionNum.text = "Date"
//        sectionNum.font = UIFont.boldSystemFont(ofSize: 40)
//        sectionNum.textColor = .white
//        
//        return sectionNum
//    }()
//    var datePlaceHolder: UITextField = {
//        var text = UITextField()
//        text.placeholder = "04/21/18"
//        text.contentMode = .center
//        text.borderStyle = .roundedRect
//        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        return text
//    }()
//    var cageNum: UILabel = {
//        var caseNum = UILabel()
//        caseNum.text = "Cage#"
//        caseNum.font = UIFont.boldSystemFont(ofSize: 40)
//        caseNum.textColor = .white
//        return caseNum
//    }()
//    var cageNumPlaceHolder: UITextField = {
//        var text = UITextField()
//        text.placeholder = "Ex 000134"
//        text.contentMode = .center
//        text.borderStyle = .roundedRect
//        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        return text
//    }()
//    var rackNumLBL: UILabel = {
//        var husbandry = UILabel()
//        husbandry.text = "Rack:"
//        husbandry.font = UIFont.boldSystemFont(ofSize: 40)
//        husbandry.textColor = .white
//        
//        return husbandry
//    }()
//    var rackNumPlace: UITextField = {
//        var text = UITextField()
//        text.placeholder = "Rack #"
//        text.contentMode = .center
//        text.borderStyle = .roundedRect
//        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        return text
//    }()
//    
//    var search: UISearchBar = {
//        let s = UISearchBar()
//        s.barTintColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
//        s.placeholder = "Cage Number"
//        return s
//    }()
//    
//    lazy var sendToVetBTN: UIButton = {
//        var btn = UIButton(type: .system)
//        btn.setTitle("Vet Services", for: .normal)
//        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
//        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
//        //        btn.backgroundColor = .white
//        ////        btn.layer.borderWidth = 2
//        //        btn.titleLabel?.contentMode = .center
//        //        btn.layer.masksToBounds = true
//        btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
//        
//        return btn
//    }()
//    @objc func handleEmail(){
////                let mailComposeViewController = configureMailController()
//        
//        if MFMailComposeViewController.canSendMail() {
//            
//            
////            let mailComposeViewController = configureMailController()
////            if MFMailComposeViewController.canSendMail() {
////              self.window?.rootViewController?.childViewControllers 
////                self.window?.rootViewController?.present(mailComposeViewController, animated: true, completion: nil)
//            } else {
//                showMailError()
//            }
//            
//            
//        } else {
//            showMailError()
//        }
//        
//    }
//    func configureMailController() -> MFMailComposeViewController {
//        let mailComposerVC = MFMailComposeViewController()
//        mailComposerVC.mailComposeDelegate = self
//        
//        mailComposerVC.setToRecipients(["yuniolbm@gmail.com", "Mami@gmail.com"])
//        
//        mailComposerVC.setSubject("Vet Service")
//        mailComposerVC.setMessageBody("<BLOCKQUOTE>To Whom it may Concern <BLOCKQUOTE><BLOCKQUOTE>Room Number#:   \(roomPlaceHolder.text ?? "")</BLOCKQUOTE><BLOCKQUOTE>Rack Number \( rackNumPlace.text ?? "")</BLOCKQUOTE>CageCard Number: \(cageLocationPlace.text ?? "")<BLOCKQUOTE>Protocol Number \(cageLocationPlace.text ?? "")</BLOCKQUOTE><BLOCKQUOTE></BLOCKQUOTE>Health Issue:    \(cageLocationPlace.text ?? "")<BLOCKQUOTE></BLOCKQUOTE>Recomendended Tretments(s)   \(cageNumPlaceHolder.text ?? "")<BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE><b> The above animal(s) have a health concern and require treatment. If you would like Veterinary Services to provide treatment as stated above, please respond to this email with your approval to treatThe cage has been flagged with an orange health check card. If you have any questions or would like a veterinarian to examine the cage(s), please contact me via email or by calling (insert your number).Thank you,", isHTML: true)
//        
//        return mailComposerVC
//    }
//    
//    func showMailError() {
//        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
//        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        sendMailErrorAlert.addAction(dismiss)
//        let con = ViewController()
//        con.present(sendMailErrorAlert, animated: true, completion: nil)
//        //        self.present(sendMailErrorAlert, animated: true, completion: nil)
//    }
//    
//    //    lazy var SenEm: UIButton = {
//    //        let e = UIButton(type: .system)
//    //        e.setTitle("Send Email", for: .normal)
//    //        e.setTitleColor(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), for: .normal)
//    //        e.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
//    //        e.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
//    //        return e
//    //    }()
//    //
//    //    @objc func handleEmail() {
//    //        let mailComposeViewController = configureMailController()
//    //        if MFMailComposeViewController.canSendMail() {
//    //            self.present(mailComposeViewController, animated: true, completion: nil)
//    //        } else {
//    //            showMailError()
//    //        }
//    //    }
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true) {
//            print("Out of the email")
//        }
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = .white
//        addSubview(taskView2)
//        
//        taskView2.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 30, bottomPadding: 30, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
//        taskView2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//        taskView2.layer.borderWidth = 30
//        taskView2.layer.masksToBounds = true
//        
//        
//        taskView2.addSubview(healthCheckLbl)
//        healthCheckLbl.anchor(top: taskView2.topAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
//        
//        healthCheckLbl.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
//        
//        // Date Label
//        taskView2.addSubview(datePlaceHolder)
//        
//        datePlaceHolder.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: taskView2.leadingAnchor, right: healthCheckLbl.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 60, rightPadding: 140, width: 0, height: 0)
//        
//        // Search bar
//        taskView2.addSubview(search)
//        search.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: healthCheckLbl.trailingAnchor , right: taskView2.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 50, rightPadding: 50, width: 0, height: 0)
//        
//        
//        // room cage id rack
//        
//        taskView2.addSubview(roomNum)
//        roomNum.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 90, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 180, height: 60)
//        taskView2.addSubview(roomPlaceHolder)
//        roomPlaceHolder.anchor(top: roomNum.topAnchor, bottom: roomNum.bottomAnchor, left: roomNum.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 5, rightPadding: 0, width: 0, height: 0)
//        // Location && rack#
//        
//        taskView2.addSubview(cageLocationLBL)
//        cageLocationLBL.anchor(top: roomNum.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
//        
//        taskView2.addSubview(cageLocationPlace)
//        cageLocationPlace.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
//        
//        taskView2.addSubview(rackNumLBL)
//        rackNumLBL.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationPlace.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 0)
//        taskView2.addSubview(rackNumPlace)
//        rackNumPlace.anchor(top: rackNumLBL.topAnchor, bottom: rackNumLBL.bottomAnchor, left: rackNumLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
//        
//        taskView2.addSubview(sendToVetBTN)
//        sendToVetBTN.anchor(top: rackNumLBL.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 70, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
//        sendToVetBTN.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
