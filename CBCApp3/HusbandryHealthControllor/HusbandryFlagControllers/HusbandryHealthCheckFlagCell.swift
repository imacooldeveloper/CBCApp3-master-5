//
//  HusbandryFlagCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/13/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

protocol HusbandryHealthFlagCellDelegate {
    func addEmailView(view: UIViewController)
    
    
}
protocol HusbandryHealthFlagQuestionDelegate {
    func healthCheckQuestionMark(view:UIViewController)
}
protocol HUsbandryHandleAllEMailDelegate {
    func allEmailDelegate(view: UIViewController)
}


class CategoryCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    
    private let cellID = "cellID"
    
    
    var delegate: HusbandryHealthFlagCellDelegate?
    var emailDelegate:HUsbandryHandleAllEMailDelegate?
    var healthQuestionDelegate: HusbandryHealthFlagQuestionDelegate?
    
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
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? HusbandryHealthCheckFlagCell {
            cell.healthQuestionDelegate = self.healthQuestionDelegate
            cell.delegate = self.delegate
           
            print(indexPath.row)
            
            return cell
        }
        return UICollectionViewCell()
//
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width , height: 700)
    }
    
    
    
    func setupViews() {
//        backgroundColor = .red
        addSubview(appCollectionViews)
        appCollectionViews.dataSource = self
        appCollectionViews.delegate = self
       
        appCollectionViews.register(HusbandryHealthCheckFlagCell.self, forCellWithReuseIdentifier: cellID)
    
        appCollectionViews.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}




class HusbandryHealthCheckFlagCell: UICollectionViewCell,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    var delegate: HusbandryHealthFlagCellDelegate?
    var emailDelegate:HUsbandryHandleAllEMailDelegate?
    var healthQuestionDelegate: HusbandryHealthFlagQuestionDelegate?
  
  
   
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
//        square.layer.shadowColor
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "Health Check"
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
        text.text = ""
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
//    var dateLBL: UILabel = {
//        var sectionNum = UILabel()
//        sectionNum.text = "Date"
//        sectionNum.font = UIFont.boldSystemFont(ofSize: 30)
//        sectionNum.textColor = .white
//
//        return sectionNum
//    }()
    var datePlaceHolder: UILabel = {
        var text = UILabel()
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
    
   
    lazy var healthCheckQuestion: UIButton = {
        let question = UIButton(type: .system)
        question.setTitle("?", for: .normal)
        question.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        question.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        question.addTarget(self, action: #selector(healthQuestionBTN), for: .touchUpInside)
        return question
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
        notePlaceHolder.text = ""
        cageNumPlaceHolder.text = ""
         datePlaceHolder.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    }
    @objc func healthQuestionBTN() {
        print("health Question Btn")
        let flow = UICollectionViewFlowLayout()
        let healthCheckQuestionMark = HealthCheckQuestionMark(collectionViewLayout: flow)
        let nav = CustomNavigation(rootViewController: healthCheckQuestionMark)
        healthQuestionDelegate?.healthCheckQuestionMark(view: nav)
        
    }
    
    
    //MARK: - SEARCH CONTROLS
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
       searchBar.placeholder = "Cage Number"
        searchController.searchBar.delegate = self
        searchBar.barTintColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
        
        return searchBar
    }()

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == "555" {
            roomPlaceHolder.text = "381"
            cageLocationPlace.text = "A1"
            rackNumPlace.text = "2"
            notePlaceHolder.text = "Hey Theres a wierd health Check here"
        } else {
            roomPlaceHolder.text = self.roomPlaceHolder.text
            cageLocationPlace.text = self.cageLocationPlace.text
            rackNumPlace.text = self.rackNumPlace.text
            notePlaceHolder.text = self.notePlaceHolder.text
        }
        print(searchBar.text ?? "")
        //👇🏻👇🏻Add CAGEID API From DATABASE 👇🏻👇🏻
    }
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

    
   lazy var sendToVetBTN: UIButton = {
        var btn = UIButton(type: .system)
        btn.setTitle("Vet Services", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
    
    btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
     
        return btn
    }()
    let navItem = UINavigationItem()
    let roomLab = UILabel()
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["mgallardo@rockefeller.edu","jconnor@mail.rockefeller.edu"])
         let roomnada = roomPlaceHolder.text?.count
        if roomnada == 0{
           roomLab.text = ""
        } else {
            roomLab.text = "Room"
        }
        mailComposerVC.setSubject("Health Check")
        mailComposerVC.setMessageBody("To Whom it may Concern<br>Date: \(datePlaceHolder.text ?? "")<br>Cage Number \( search.text ?? "")<br>Room \(roomPlaceHolder.text ?? "")<br>Rack# \(rackNumPlace.text ?? "")<br>Location: \(cageLocationPlace.text ?? "")<br>Extra Notes :\(notePlaceHolder.text ?? "")<br><br><B> Hey VetService Team i have a health check", isHTML: true)
        
        
        return mailComposerVC
    }

    
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        let con = ViewController()
        con.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    func sendEmail () {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController()
            if MFMailComposeViewController.canSendMail() {
                
              emailDelegate?.allEmailDelegate(view: mailComposeViewController)
                
                
            } else {
                showMailError()
            }
            
            
        } else {
            showMailError()
        }

    }
    @objc func handleEmail(){

        let mf = MFMailComposeResult.sent
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController()
            
            if MFMailComposeViewController.canSendMail() {
               
                delegate?.addEmailView(view: mailComposeViewController)
               
              
                } else{
                
                showMailError()

            }


        }
     
    

    }
    func didSend() {
         let mf = MFMailComposeResult.sent
        if mf.rawValue  == 2{
            
            self.roomPlaceHolder.text = ""
            self.cageLocationPlace.text = ""
            self.rackNumPlace.text = ""
            self.notePlaceHolder.text = ""
            self.datePlaceHolder.text  = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
            
        }
    }
    

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            print("Out of the email")
  
          
            
//            self.roomPlaceHolder.text = ""
//            self.cageLocationPlace.text = ""
//            self.rackNumPlace.text = ""
//            self.notePlaceHolder.text = ""
//            self.datePlaceHolder.text  = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        }
    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        //hide or reset anything you want hereafter, for example
//        rackNumPlace.text = ""
//
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        
      
        
//        delegate = self as? HusbandryHealthFlagCellDelegate
//        healthQuestionDelegate = self as? HusbandryHealthFlagQuestionDelegate
        
        search.delegate = self
        backgroundColor = .white
        addSubview(taskView2)
        
        taskView2.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 30, bottomPadding: 30, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
       taskView2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        taskView2.layer.borderWidth = 30
        taskView2.layer.masksToBounds = true
        
        
        taskView2.addSubview(healthCheckLbl)
        healthCheckLbl.anchor(top: taskView2.topAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        healthCheckLbl.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        // Date Label
        taskView2.addSubview(datePlaceHolder)
        
        datePlaceHolder.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: taskView2.leadingAnchor, right: healthCheckLbl.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 40, rightPadding: 60, width: 0, height: 0)
        
        // Search bar
        taskView2.addSubview(search)
        
        search.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: healthCheckLbl.trailingAnchor , right: taskView2.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 50, width: 0, height: 0)
        
        
        // room cage id rack
        
        taskView2.addSubview(roomNum)
        roomNum.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 90, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(roomPlaceHolder)
        roomPlaceHolder.anchor(top: roomNum.topAnchor, bottom: roomNum.bottomAnchor, left: roomNum.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 5, rightPadding: 0, width: 0, height: 0)
        // Location && rack#
        
        taskView2.addSubview(cageLocationLBL)
        cageLocationLBL.anchor(top: roomNum.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(cageLocationPlace)
        cageLocationPlace.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(rackNumLBL)
        rackNumLBL.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationPlace.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(rackNumPlace)
        rackNumPlace.anchor(top: rackNumLBL.topAnchor, bottom: rackNumLBL.bottomAnchor, left: rackNumLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: rackNumLBL.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 50, bottomPadding: 0, leftPadding: 80, rightPadding: 80, width: 0, height: 90)
        notePlaceHolder.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        taskView2.addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: notePlaceHolder.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        sendToVetBTN.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        addSubview(healthCheckQuestion)
        healthCheckQuestion.anchor(top: nil, bottom: taskView2.bottomAnchor, left: nil, right: trailingAnchor, topPadding: 0, bottomPadding: 30, leftPadding: 0, rightPadding: 60, width: 0, height: 0)
        taskView2.addSubview(refreshBtn)
        refreshBtn.anchor(top: nil, bottom: taskView2.bottomAnchor, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 30, leftPadding: 60, rightPadding: 0, width: 40, height: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
