//
//  NonCompliantIdFront.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/22/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI
protocol NonComplianteIdProtocol {
    func addNonComplianteIdEmail(view:UIViewController)
}




class CategoryCellNonCompiant: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    
    private let cellID = "cellID"
  var nonComplianteIdDelegate: NonComplianteIdProtocol?
    
    
    
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
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? NonCompliantIdFrontCell {
            
            cell.nonComplianteIdDelegate = self.nonComplianteIdDelegate
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
        
        appCollectionViews.register(NonCompliantIdFrontCell.self, forCellWithReuseIdentifier: cellID)
        
        appCollectionViews.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}






class NonCompliantIdFrontCell: UICollectionViewCell,MFMailComposeViewControllerDelegate,UISearchBarDelegate {
    
    
    var nonComplianteIdDelegate: NonComplianteIdProtocol?
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.8816719651, green: 0.7019543052, blue: 0.8023622632, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "Non Compliant ID"
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
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Cage Number"
        searchController.searchBar.delegate = self
        searchBar.barTintColor = #colorLiteral(red: 0.8816719651, green: 0.7019543052, blue: 0.8023622632, alpha: 1)
        
        return searchBar
    }()
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //        if searchBar.text == "1234567" {
        //            roomPlaceHolder.text = "381"
        //            cageLocationPlace.text = "A1"
        //            rackNumPlace.text = "2"
        //            notePlaceHolder.text = "Hey Theres a wierd health Check here"
        //        } else {
        //            roomPlaceHolder.text = ""
        //            cageLocationPlace.text = ""
        //            rackNumPlace.text = ""
        //            notePlaceHolder.text = ""
        //        }
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
    
    
    
    
    
    let date: UILabel = {
        let birth = UILabel()
        birth.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        birth.text = "Date"
        birth.contentMode = .center
        birth.font = UIFont.boldSystemFont(ofSize: 30)
        return birth
    }()
//    var datePlaceHolder: UITextField = {
//        var text = UITextField()
//        text.placeholder = "date"
//        text.contentMode = .center
//        text.borderStyle = .roundedRect
//        text.font = UIFont.boldSystemFont(ofSize: 20)
//        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        return text
//    }()
    let investigatorLbl: UILabel = {
        let birth = UILabel()
        birth.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        birth.text = "Investigator"
        birth.contentMode = .center
        birth.font = UIFont.boldSystemFont(ofSize: 30)
        return birth
    }()
    var investigatorPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "________"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    let NonDiscription: UILabel = {
        let lab = UILabel()
        lab.text = " NON COMPLIANT CAGE CARD \n PLEASE PROVIDE A PROPER \n     CAGE CARD ID WITHIN \n 7 DAYS OR YOU WILL BE \n CHARGED FOR CAGE CARD \n                 PLACEMENT"
        lab.font = UIFont.boldSystemFont(ofSize: 25)
        lab.contentMode = .center
        lab.textColor = .black
        lab.numberOfLines = 0
        return lab
    }()
    let vetServicesFeeLbl: UILabel = {
        let birth = UILabel()
        birth.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        birth.text = "Vet Services Fee"
        birth.contentMode = .center
        birth.font = UIFont.boldSystemFont(ofSize: 25)
        return birth
    }()
    let vetServicesFeeMoney: UILabel = {
    let birth = UILabel()
    birth.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    birth.text = "$45.00/HOUR"
    birth.contentMode = .center
    birth.font = UIFont.boldSystemFont(ofSize: 25)
    return birth
    }()
    
    let cageCardFeeLbl: UILabel = {
        let birth = UILabel()
        birth.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        birth.text = "Cage Card Fee"
        birth.contentMode = .center
        birth.font = UIFont.boldSystemFont(ofSize: 25)
        return birth
    }()
    let cageCardFeeMoney: UILabel = {
        let birth = UILabel()
        birth.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        birth.text = "$10.00/CARD"
        birth.contentMode = .center
        birth.font = UIFont.boldSystemFont(ofSize: 25)
        return birth
    }()
    lazy var sendToVetBTN: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Vet Services", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        //        btn.backgroundColor = .white
        ////        btn.layer.borderWidth = 2
        //        btn.titleLabel?.contentMode = .center
        //        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        
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
        notePlaceHolder.text = ""
        cageNumPlaceHolder.text = ""
        investigatorPlaceHolder.text = ""
        datePlaceHolder.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    }
    
    
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["mgallardo@rockefeller.edu","jconnor@mail.rockefeller.edu"])
        
        mailComposerVC.setSubject("Non Compliant ID")
        mailComposerVC.setMessageBody("<BLOCKQUOTE>To Whom it may Concern <BLOCKQUOTE><BLOCKQUOTE>  Date:   \(datePlaceHolder.text ?? "")</BLOCKQUOTE><BLOCKQUOTE>  Cage Number \( search.text ?? "")</BLOCKQUOTE>Room#: \(roomPlaceHolder.text ?? "")<BLOCKQUOTE>Rack# \(rackNumPlace.text ?? "")</BLOCKQUOTE><BLOCKQUOTE></BLOCKQUOTE>Location:    \(cageLocationPlace.text ?? "")<BLOCKQUOTE>Investigator: \(investigatorPlaceHolder.text ?? "")</BLOCKQUOTE>Extra notes:  \(notePlaceHolder.text ?? "")<BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE><b> Hey VetService Team i have a Non-Compliante Cage", isHTML: true)
        
        
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
                
              nonComplianteIdDelegate?.addNonComplianteIdEmail(view: mailComposeViewController)
                
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
    
    
    
    
    
    func setupNonCompliantIdViewsFront() {
        addSubview(taskView2)
        backgroundColor = .white
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
        cageLocationLBL.anchor(top: roomNum.bottomAnchor, bottom: nil, left: roomNum.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(cageLocationPlace)
        cageLocationPlace.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(rackNumLBL)
        rackNumLBL.anchor(top: cageLocationLBL.topAnchor, bottom: cageLocationLBL.bottomAnchor, left: cageLocationPlace.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(rackNumPlace)
        rackNumPlace.anchor(top: rackNumLBL.topAnchor, bottom: rackNumLBL.bottomAnchor, left: rackNumLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(investigatorLbl)
        investigatorLbl.anchor(top: cageLocationLBL.bottomAnchor, bottom: nil, left: cageLocationLBL.leadingAnchor , right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(investigatorPlaceHolder)
        investigatorPlaceHolder.anchor(top: investigatorLbl.topAnchor, bottom: investigatorLbl.bottomAnchor, left: investigatorLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        
        
        
        
//
//        taskView2.addSubview(NonDiscription)
//        NonDiscription.anchor(top: date.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
//        NonDiscription.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
//
//        taskView2.addSubview(vetServicesFeeLbl)
//        vetServicesFeeLbl.anchor(top: NonDiscription.bottomAnchor, bottom: nil, left: date.leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
//        taskView2.addSubview(vetServicesFeeMoney)
//        vetServicesFeeMoney.anchor(top: vetServicesFeeLbl.topAnchor, bottom: vetServicesFeeLbl.bottomAnchor, left: vetServicesFeeLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 12, rightPadding: 0, width: 0, height: 0)
//
//        taskView2.addSubview(cageCardFeeLbl)
//        cageCardFeeLbl.anchor(top: vetServicesFeeLbl.bottomAnchor, bottom: nil, left: vetServicesFeeLbl.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
//        taskView2.addSubview(cageCardFeeMoney)
//        cageCardFeeMoney.anchor(top: cageCardFeeLbl.topAnchor, bottom: nil, left: cageCardFeeLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 12, rightPadding: 0, width: 0, height: 0)
        
        
        taskView2.addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: rackNumLBL.bottomAnchor, bottom: investigatorLbl.bottomAnchor, left: investigatorPlaceHolder.trailingAnchor, right: rackNumPlace.trailingAnchor, topPadding: 35, bottomPadding: 0, leftPadding: 60, rightPadding: 20, width: 0, height: 0)
//        notePlaceHolder.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true

        taskView2.addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: notePlaceHolder.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        sendToVetBTN.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        taskView2.addSubview(refreshBtn)
          refreshBtn.anchor(top: nil, bottom: taskView2.bottomAnchor, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 30, leftPadding: 60, rightPadding: 0, width: 40, height: 40)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNonCompliantIdViewsFront()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
