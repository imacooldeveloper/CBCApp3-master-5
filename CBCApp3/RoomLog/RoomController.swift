//
//  RoomController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 9/18/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class RoomController: UITableViewController {
    let roomCell = "roomCell"
    let floorNum = [
        
        "301", "302", "303", "304", "305", "306","307","308","309","310","311","312","313","314","315"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: roomCell)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let flow = UICollectionViewFlowLayout()
        let calender = CalenderController(collectionViewLayout: flow)
        let nav = CustomNavigation(rootViewController: calender)
        present(nav, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return floorNum.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: roomCell, for: indexPath)
        
        let path = floorNum[indexPath.row]
        cell.textLabel?.text = path
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
}
