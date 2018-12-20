//
//  TreatMentController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 12/18/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class TreatMentController: UIViewController, UNUserNotificationCenterDelegate {
    //Health Cell Labels
    var dateLabel = RoomInputs()
    var cageNumberLabel = RoomInputs()
    var roomNumber = RoomInputs()
    var protocoolLabel = RoomInputs()
    var loctionLabel = RoomInputs()
    var rackLabel = RoomInputs()
    var healthIssueLabel = RoomInputs()
    var treatmentLabel = RoomInputs()
    
    
    
   let treatMentView = UIView()
    var details = VetServicesHealthFlagCell()
    var registerBtn = UILabel()
    let scheduleBtn = UIButton(type: .system)
    
    
    let datePicker = UIDatePicker()
   
    
    var isGrantedNotificationAccess: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UNUserNotificationCenter.current().requestAuthorization(
//            options: [.alert,.sound,.badge],
//            completionHandler: { (granted,error) in
//                self.isGrantedNotificationAccess = granted
//        }
//        )
        setupLayout()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
       navigationItem.title = "Schedule Treatment"
    }
    var treatMents: TreatMents?
    @objc func handleSave() {
        print("hey iam being saved and push to treatMent Board Controller")
        let treatmentBoardController = TreatmentBoardController()
        treatmentBoardController.details = self
        
        let nav = CustomNavigation(rootViewController: treatmentBoardController)
        present(nav, animated: true, completion: nil)
        
    }
   
  
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    @objc func handleSchedule() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let strDate = dateFormatter.string(from: datePicker.date)
        registerBtn.text = strDate
//        if isGrantedNotificationAccess{
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MMM d, h:mm a"
//            let strDate = dateFormatter.string(from: datePicker.date)
//            registerBtn.text = strDate
//
//            //add notification code here
//
//            //Set the content of the notification
//            let content = UNMutableNotificationContent()
//            content.title = "\(roomNumber.text ?? "")"
//            content.subtitle = "Cage Tap"
//            content.body = "Notification after 10 seconds - Your cage is ready!!"
//
//            //Set the trigger of the notification -- here a timer.
//            let trigger = UNTimeIntervalNotificationTrigger(
//                timeInterval: 60.0,
//                repeats: true)
//
//            //Set the request for the notification from the above
//            let request = UNNotificationRequest(
//                identifier: "10.second.message",
//                content: content,
//                trigger: trigger
//            )
//
//            //Add the notification to the currnet notification center
//            UNUserNotificationCenter.current().add(
//                request, withCompletionHandler: nil)
//
//        }
    }
    
    
    
    fileprivate func setupLayout() {
        
        view.backgroundColor = .white
        view.addSubview(treatMentView)
        treatMentView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 30, rightPadding: 30, width: 0, height: 300)
        treatMentView.backgroundColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
        treatMentView.addSubview(dateLabel)
        dateLabel.anchor(top: treatMentView.topAnchor, bottom: nil, left: treatMentView.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 30)
        dateLabel.text = details.datePlaceHolder.text ?? ""
        
        treatMentView.addSubview(cageNumberLabel)
        cageNumberLabel.anchor(top: treatMentView.topAnchor, bottom: nil, left: nil, right: treatMentView.trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 30, width: 0, height: 30)
        cageNumberLabel.text = details.search.text ?? ""
        cageNumberLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        treatMentView.addSubview(roomNumber)
        
        roomNumber.text = "Room- \(details.roomPlaceHolder.text ?? "")"
        
        roomNumber.anchor(top: dateLabel.bottomAnchor, bottom: nil, left: dateLabel.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        
        
        treatMentView.addSubview(protocoolLabel)
        protocoolLabel.text = "protocol- \(details.protocoolNumPlaceHolder.text ?? "")"
        protocoolLabel.anchor(top: roomNumber.topAnchor, bottom: roomNumber.bottomAnchor, left: roomNumber.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        treatMentView.addSubview(loctionLabel)
        loctionLabel.text = "Location-\(details.cageLocationPlace.text ?? "")"
        loctionLabel.anchor(top: protocoolLabel.topAnchor, bottom: protocoolLabel.bottomAnchor, left: protocoolLabel.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        treatMentView.addSubview(rackLabel)
        rackLabel.text = "Rack- \( details.rackNumPlace.text ?? "")"
        rackLabel.anchor(top: loctionLabel.topAnchor, bottom: loctionLabel.bottomAnchor, left: loctionLabel.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        
        
        treatMentView.addSubview(healthIssueLabel)
        healthIssueLabel.text = "Health Issue- \(details.healthIssuePlace.text ?? "") "
        healthIssueLabel.anchor(top: roomNumber.bottomAnchor, bottom: nil, left: roomNumber.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        
        treatMentView.addSubview(treatmentLabel)
        treatmentLabel.text = "Treatment- \(details.treatMentPlace.text ?? "") "
        
        treatmentLabel.anchor(top: healthIssueLabel.topAnchor, bottom: healthIssueLabel.bottomAnchor, left: healthIssueLabel.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        treatMentView.addSubview(registerBtn)
        
        registerBtn.anchor(top: treatMentView.topAnchor, bottom: treatMentView.bottomAnchor, left: nil, right: nil, topPadding: 80, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        registerBtn.centerXAnchor.constraint(equalTo: treatMentView.centerXAnchor).isActive = true
        
        treatMentView.addSubview(scheduleBtn)
        scheduleBtn.setTitle("Shecdule", for: .normal)
        scheduleBtn.anchor(top: nil, bottom: treatMentView.bottomAnchor, left: nil, right: treatMentView.trailingAnchor, topPadding: 0, bottomPadding: 20, leftPadding: 0, rightPadding: 20, width: 90, height: 40)
        
        scheduleBtn.addTarget(self, action: #selector(handleSchedule), for: .touchUpInside)
        view.addSubview(datePicker)
        datePicker.anchor(top: treatMentView.bottomAnchor, bottom: view.bottomAnchor, left: treatMentView.leadingAnchor, right: treatMentView.trailingAnchor, topPadding: 10, bottomPadding: 40, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        // pull out the buried userInfo dictionary
//        let userInfo = response.notification.request.content.userInfo
//
//        if let customData = userInfo["customData"] as? String {
//            print("Custom data received: \(customData)")
//
//            switch response.actionIdentifier {
//            case UNNotificationDefaultActionIdentifier:
//                // the user swiped to unlock
//                print("Default identifier")
//
//            case "show":
//                // the user tapped our "show more info…" button
//                print("Show more information…")
//
//            default:
//                break
//            }
//        }
//
//        // you must call the completion handler when you're done
//        completionHandler()
//    }
    
//    func registerCategories() {
//        let center = UNUserNotificationCenter.current()
//        center.delegate = self
//
//        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
//        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
//
//        center.setNotificationCategories([category])
//    }

    @objc func handleNotification() {
       
    }

    

}
