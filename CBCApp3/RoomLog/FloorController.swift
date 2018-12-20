//
//  FloorController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 9/18/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class FloorController: UITableViewController {
    let floorCell = "FloorCell"
    var floorNum = [
    "1Floor", "2nd Floor", "3rd Floor", "3rd Annex", "4th Floor", "5th Floor"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: floorCell)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theRows = floorNum[indexPath.row]
        let roomController = RoomController()
        let nav =  CustomNavigation(rootViewController: roomController)
        present(nav, animated: true, completion: nil)
        print(theRows)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return floorNum.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: floorCell, for: indexPath)
        
        let path = floorNum[indexPath.row]
        cell.textLabel?.text = path
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
}
