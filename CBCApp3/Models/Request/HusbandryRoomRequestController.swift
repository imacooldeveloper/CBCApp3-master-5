//
//  HusbandryRoomRequestController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 8/1/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import MessageUI

class HusbandryRoomRequestController: UICollectionViewController,UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate {
    let requestCell = "requestCell"
    
    let theCell = RoomRequestCell()
    
    var roomRequest = [
    Request(request: "Cage Cart", requestImage: #imageLiteral(resourceName: "cart").withRenderingMode(.alwaysOriginal), quantity: "3"),
     Request(request: "Water", requestImage: #imageLiteral(resourceName: "water").withRenderingMode(.alwaysOriginal), quantity: "4")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(RoomRequestCell.self, forCellWithReuseIdentifier: requestCell)
        navigationItem.title = "Room Request"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(handleSendEmail))
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            print("Out of the email")
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["yuniolbm@gmail.com", "Mami@gmail.com"])
        
        mailComposerVC.setSubject("Vet Service")
        mailComposerVC.setMessageBody("Hello" , isHTML: true)
        
//        mailComposerVC.addAttachmentData(theCell.requestImage, mimeType: <#T##String#>, fileName: <#T##String#>)
//        mailComposerVC.setMessageBody("<BLOCKQUOTE>To Whom it may Concern <BLOCKQUOTE><BLOCKQUOTE>Room Number#:   \(roomPlaceHolder.text ?? "")</BLOCKQUOTE><BLOCKQUOTE>Rack Number \( rackNumPlace.text ?? "")</BLOCKQUOTE>CageCard Number: \(cageLocationPlace.text ?? "")<BLOCKQUOTE>Protocol Number \(cageLocationPlace.text ?? "")</BLOCKQUOTE><BLOCKQUOTE></BLOCKQUOTE>Health Issue:    \(cageLocationPlace.text ?? "")<BLOCKQUOTE></BLOCKQUOTE>Recomendended Tretments(s)   \(cageNumPlaceHolder.text ?? "")<BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE> <BLOCKQUOTE></BLOCKQUOTE><b> The above animal(s) have a health concern and require treatment. If you would like Veterinary Services to provide treatment as stated above, please respond to this email with your approval to treatThe cage has been flagged with an orange health check card. If you have any questions or would like a veterinarian to examine the cage(s), please contact me via email or by calling (insert your number).Thank you,", isHTML: true)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        let con = ViewController()
        con.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    
    @objc func handleSendEmail() {
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configureMailController()
            if MFMailComposeViewController.canSendMail() {
                //                 self.window?.rootViewController?.present(mailComposeViewController, animated: true, completion: nil)
               
            } else {
                showMailError()
            }
            
            
        }
        
    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 6, height: 280)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomRequest.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: requestCell, for: indexPath) as! RoomRequestCell
        let path = roomRequest[indexPath.row]
        cell.requestName.text = path.request
        cell.requestImage.image = path.requestImage
        return cell
    }
}
