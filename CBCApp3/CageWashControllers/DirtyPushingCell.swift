//
//  DirtyPushingCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 11/19/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI


protocol DirtyPushingCellDelegate {
    func handlePushingEmail(view:UIViewController)
}

class DirtyPushingCell: UICollectionViewCell,MFMailComposeViewControllerDelegate {
    
    var dirtyDelegate:DirtyPushingCellDelegate?
    
    let titleLab: UILabel = {
        let title = UILabel()
        title.contentMode = .center
        title.text = "PUSHING"
        title.font = UIFont.boldSystemFont(ofSize: 50)
        return title
    }()
    let thorenLab: UILabel = {
        let title = UILabel()
//        title.textColor = .white
        title.contentMode = .center
        title.text = "Thoren"
        title.font = UIFont.boldSystemFont(ofSize: 40)
        return title
    }()
    var thorenHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "#Carts"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    let annexLab: UILabel = {
        let title = UILabel()
//        title.textColor = .white
        title.contentMode = .center
        title.text = "Annex"
        title.font = UIFont.boldSystemFont(ofSize: 40)
        return title
    }()
    var annexHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "#Carts"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    let ratLab: UILabel = {
        let title = UILabel()
        //        title.textColor = .white
        title.contentMode = .center
        title.text = "Rat"
        title.font = UIFont.boldSystemFont(ofSize: 40)
        return title
    }()
    var ratHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "#Carts"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    let hamsterLab: UILabel = {
        let title = UILabel()
        //        title.textColor = .white
        title.contentMode = .center
        title.text = "Hamster"
        title.font = UIFont.boldSystemFont(ofSize: 40)
        return title
    }()
    var hamsterHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "#Carts"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    var notePlaceHolder: UITextView = {
        var text = UITextView()
        //        text.placeholder = "    Extra Notes"
        text.text = "Other"
        
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
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        
        btn.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        
        return btn
    }()
    var datePlaceHolder: UILabel = {
        var text = UILabel()
        text.textAlignment = .center
        text.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        text.contentMode = .center
        //        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        text.layer.cornerRadius = 10
        text.layer.masksToBounds = true
        return text
    }()
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["mgallardo@rockefeller.edu","jconnor@mail.rockefeller.edu"])
        
        mailComposerVC.setSubject("Health Check")
        mailComposerVC.setMessageBody("<BLOCKQUOTE>To Whom it may Concern <BLOCKQUOTE><BLOCKQUOTE>  Date:   \(datePlaceHolder.text ?? "")</BLOCKQUOTE><BLOCKQUOTE>  Cage Number </BLOCKQUOTE>Room#:<BLOCKQUOTE>Rack# </BLOCKQUOTE><BLOCKQUOTE></BLOCKQUOTE>Location:   <BLOCKQUOTE>Extra Notes :   \(notePlaceHolder.text ?? "")</BLOCKQUOTE><BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE><b> Hey VetService Team i have a health check", isHTML: true)
        
        
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
                dirtyDelegate?.handlePushingEmail(view: mailComposeViewController)
           
                
                
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
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 0.6952139735, blue: 0.4798505902, alpha: 1)
        addSubview(titleLab)
        titleLab.anchor(top: topAnchor, bottom: nil, left: nil, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        titleLab.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addSubview(datePlaceHolder)
        datePlaceHolder.anchor(top: titleLab.topAnchor, bottom: titleLab.bottomAnchor, left: leadingAnchor, right: titleLab.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 90, width: 0, height: 0)
        addSubview(thorenLab)
        thorenLab.anchor(top: titleLab.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 40, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        addSubview(thorenHolder)
        thorenHolder.anchor(top: thorenLab.bottomAnchor, bottom: nil, left: thorenLab.leadingAnchor, right: thorenLab.trailingAnchor, topPadding: 2, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        addSubview(annexLab)
        annexLab.anchor(top: thorenLab.topAnchor, bottom: nil, left: thorenLab.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        addSubview(annexHolder)
        annexHolder.anchor(top: annexLab.bottomAnchor, bottom: nil, left: annexLab.leadingAnchor, right: annexLab.trailingAnchor, topPadding: 2, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        addSubview(ratLab)
        ratLab.anchor(top: annexLab.topAnchor, bottom: annexLab.bottomAnchor, left: annexLab.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        addSubview(ratHolder)
        ratHolder.anchor(top: ratLab.bottomAnchor, bottom: nil, left: ratLab.leadingAnchor, right: ratLab.trailingAnchor, topPadding: 2, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        addSubview(hamsterLab)
        hamsterLab.anchor(top: ratLab.topAnchor, bottom: ratLab.bottomAnchor, left: ratLab.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 40, rightPadding: 0, width: 0, height: 0)
        addSubview(hamsterHolder)
        hamsterHolder.anchor(top: hamsterLab.bottomAnchor, bottom: nil, left: hamsterLab.leadingAnchor, right: hamsterLab.trailingAnchor, topPadding: 2, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: hamsterHolder.bottomAnchor, bottom: nil, left: leadingAnchor, right: trailingAnchor, topPadding: 200, bottomPadding: 0, leftPadding: 60, rightPadding: 60, width: 0, height: 100)
//        notePlaceHolder.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(sendToVetBTN)
        sendToVetBTN.anchor(top: notePlaceHolder.bottomAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 60, rightPadding: 60, width: 0, height: 0)
        sendToVetBTN.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
