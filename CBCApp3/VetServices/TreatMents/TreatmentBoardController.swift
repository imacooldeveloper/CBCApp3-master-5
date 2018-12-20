//
//  TreatmentBoardController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 12/19/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class TreatmentBoardController: UITableViewController {

    let treatmentCellName = "treatmentCellName"
    var details = TreatMentController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Treatment Board "
        tableView.register(TreatMentBoardCell.self, forCellReuseIdentifier: treatmentCellName)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goHome))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    @objc func goHome() {
        let flow = UICollectionViewFlowLayout()
        let flagController = VetServicesFlagController(collectionViewLayout: flow)
        let nav = CustomNavigation(rootViewController: flagController)
        present(nav, animated: true, completion: nil)
    }
    // MARK: - Table view data source
    let treatMents = [TreatMents]()
//   TreatMents(date: "12/21/2018", cageNumber: "123456789", room: "321", protocolNumber: "007", location: "a1", rack: "4", healthIssue: "malaculsion", treatMent: "seperate"),
//   TreatMents(date: "12/21/2018", cageNumber: "123456789", room: "321", protocolNumber: "007", location: "a1", rack: "4", healthIssue: "malaculsion", treatMent: "seperate")
   
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .normal, title: "Complete") { (action, indexPath) in
            let path = [indexPath.row]
            print("im deleting A treatment", path)
        }
        return [delete]
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return treatMents.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: treatmentCellName, for: indexPath) as? TreatMentBoardCell
//        cell?.details = self.details
        let path = treatMents[indexPath.row]
        print(path.healthIssue)
        cell?.treatMents = path
//        cell?.treatMents = self
//        cell?.cageNumberLabel.text = self.details.cageNumberLabel.text
        return cell!
    }

   
}
