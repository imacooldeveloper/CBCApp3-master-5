//
//  VetServicesCageSeparatedCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/23/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI
protocol VetServicesSeperatedProtocol {
    func addSeperatedEmail(view:UIViewController)
}




class CategoryCellVetSeperated: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate, UISearchBarDelegate  {
    
    
    private let cellID = "cellID"
    var cageSeperatedDelegate: VetServicesSeperatedProtocol?
    
    
    
    
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
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? VetServicesCageSeperatedCell {
            
            cell.cageSeperatedDelegate = self.cageSeperatedDelegate
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
        
        appCollectionViews.register(VetServicesCageSeperatedCell.self, forCellWithReuseIdentifier: cellID)
        
        appCollectionViews.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}





class VetServicesCageSeperatedCell: UICollectionViewCell, UISearchBarDelegate,MFMailComposeViewControllerDelegate {
    
    
    var cageSeperatedDelegate: VetServicesSeperatedProtocol?
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "Cage Separated"
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
    
    let privateInvestigator: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "Private Investigator:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    let privateInvestigatorPlaceHolder: UITextField = {
        let text = UITextField()
        text.placeholder = "name"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    let numberOfAnimals: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "Numbers of Animals:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    let numberOfAnimalsPlaceHolder:DropDown = {
        
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
    
    let gender: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "Gender:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    let genderPlaceHolder:DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Male", "female"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    let cageof: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "Cage:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    let cageofPlaceHolder: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["1", "2", "3", "4", "5", "6"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8,90,91]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    let of: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "Of:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    
    let newLocationPlace: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["1", "2", "3", "4", "5", "6"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8,90,91]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            dropDown.text = selectedText
            //            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            
            
        }
        
        return dropDown
    }()
    let newLocation: UILabel = {
        let caseNum = UILabel()
        caseNum.text = "New Locations:"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    
    let ofPlaceHolder: DropDown = {
        
        let dropDown = DropDown(frame: CGRect(x: 110, y: 140, width: 200, height: 30)) // set frame
        dropDown.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["1", "2", "3", "4", "5", "6"]
        // Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22,21,43,1,2,3,4,5,6,7,8,90,91]
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
        let  numbersOfAnimalsEmpty = numberOfAnimalsPlaceHolder.text?.count
        let genderEmtpy = genderPlaceHolder.text?.count
        let cageOFEmtpy = cageofPlaceHolder.text?.count
        let OFEmtpy = ofPlaceHolder.text?.count
        let notesEmpty = notePlaceHolder.text.count
        let roomEmtpy = roomPlaceHolder.text?.count
        let locationEmtpy = cageLocationPlace.text?.count
        let rackEmtpy = rackNumPlace.text?.count
        let newLocationEmpty = newLocationPlace.text?.count
        if numbersOfAnimalsEmpty == 0 {
            healthIssueLab.text = nil
        } else {
            healthIssueLab.text = "<br>Numbers Of Animals:   \( numberOfAnimalsPlaceHolder.text ?? "")"
        }
        if genderEmtpy == 0 {
            treatMentLab.text = nil
        } else {
            treatMentLab.text = "<br>Gender: \(genderPlaceHolder.text ?? "") "
        }
        if cageOFEmtpy == 0 {
            monotoringLab.text = nil
        } else {
            monotoringLab.text = "<br>Cage: \(cageofPlaceHolder.text ?? "") "
        }
        if OFEmtpy == 0 {
            euthanasiaRecomended.text = nil
        } else {
            euthanasiaRecomended.text = " Of: \(ofPlaceHolder.text ?? "") "
        }
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
        if newLocationEmpty == 0 {
            hoursLaby.text = nil
        } else {
            hoursLaby.text = " New Location: \(newLocationPlace.text ?? "")"
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
        mailComposerVC.setMessageBody("To Whom it may Concern <br> Date:   \(datePlaceHolder.text ?? "")<br> Cage Number \( search.text ?? "") <br>Room \(roomPlaceHolder.text ?? "")<br>Rack: \(rackNumPlace.text ?? "")<br>Location:\(cageLocationPlace.text ?? "")<br>Private Investigator: \(privateInvestigatorPlaceHolder.text ?? "")\(healthIssueLab.text ?? "")\(treatMentLab.text ?? "") \(monotoringLab.text ?? "")\(euthanasiaRecomended.text ?? "")\(hoursLaby.text ?? "") \(extraNotes.text ?? "") <br><br><B>CAGE SEPERATION.", isHTML: true)
        
        
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
                
                cageSeperatedDelegate?.addSeperatedEmail(view: mailComposeViewController)
                
                
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
        searchBar.barTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
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
        privateInvestigatorPlaceHolder.text = ""
        numberOfAnimalsPlaceHolder.text = ""
        genderPlaceHolder.text = ""
        cageofPlaceHolder.text = ""
        ofPlaceHolder.text = ""
        newLocationPlace.text = ""
        notePlaceHolder.text = ""
        cageNumPlaceHolder.text = ""
        
        datePlaceHolder.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    }
    
    func setupCageSeperatedView() {
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
        
        taskView2.addSubview(privateInvestigator)
        privateInvestigator.anchor(top: cageLocationLBL.bottomAnchor, bottom: nil, left: cageLocationLBL.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(privateInvestigatorPlaceHolder)
        privateInvestigatorPlaceHolder.anchor(top: privateInvestigator.topAnchor, bottom: privateInvestigator.bottomAnchor, left: privateInvestigator.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        
        taskView2.addSubview(numberOfAnimals)
        numberOfAnimals.anchor(top: privateInvestigator.bottomAnchor, bottom: nil, left: privateInvestigator.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(numberOfAnimalsPlaceHolder)
        numberOfAnimalsPlaceHolder.anchor(top: numberOfAnimals.topAnchor, bottom: numberOfAnimals.bottomAnchor, left: numberOfAnimals.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 90, height: 0)
        taskView2.addSubview(gender)
        gender.anchor(top: numberOfAnimals.bottomAnchor, bottom: nil, left: numberOfAnimals.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(genderPlaceHolder)
        genderPlaceHolder.anchor(top: gender.topAnchor, bottom: gender.bottomAnchor, left: gender.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 90, height: 0)
        
        taskView2.addSubview(cageof)
        cageof.anchor(top: gender.bottomAnchor, bottom: nil, left: gender.leadingAnchor, right: nil, topPadding: 70, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(cageofPlaceHolder)
        cageofPlaceHolder.anchor(top: cageof.topAnchor, bottom: cageof.bottomAnchor, left: cageof.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(cageofPlaceHolder)
        cageofPlaceHolder.anchor(top: cageof.topAnchor, bottom: cageof.bottomAnchor, left: cageof.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(of)
        of.anchor(top: cageof.topAnchor, bottom: cageof.bottomAnchor, left: cageofPlaceHolder.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 4, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(ofPlaceHolder)
        ofPlaceHolder.anchor(top: of.topAnchor, bottom: of.bottomAnchor, left: of.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 2, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(newLocation)
        newLocation.anchor(top: cageof.topAnchor, bottom: cageof.bottomAnchor, left: ofPlaceHolder.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(newLocationPlace)
        newLocationPlace.anchor(top: newLocation.topAnchor, bottom: newLocation.bottomAnchor, left: newLocation.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: newLocation.bottomAnchor, bottom: nil, left: cageof.leadingAnchor, right: newLocation.trailingAnchor, topPadding: 120, bottomPadding: 0, leftPadding: 0, rightPadding: 70, width: 0, height: 90)
        
        
        taskView2.addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: notePlaceHolder.bottomAnchor, bottom: taskView2.bottomAnchor, left: nil, right: taskView2.trailingAnchor, topPadding: 60, bottomPadding: 70, leftPadding: 0, rightPadding: 30, width: 100, height: 0)
        taskView2.addSubview(refreshBtn)
        refreshBtn.anchor(top: nil, bottom: taskView2.bottomAnchor, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 30, leftPadding: 60, rightPadding: 0, width: 40, height: 40)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCageSeperatedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
