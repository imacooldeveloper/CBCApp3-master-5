//
//  MenuControllers.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/27/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class MenusControllers: UITableViewController {
    
    let MenuButt = [
        "RoomLog", "Request","Health Checks?","Emergency?"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MenuCells.self, forCellReuseIdentifier: "list")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let roomLogLogin = RoomLogLoginController()
            let navCon = CustomNavigation(rootViewController: roomLogLogin)
            present(navCon, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let flow = UICollectionViewFlowLayout()
            let husbandryroomRequestController = HusbandryRoomRequestController(collectionViewLayout: flow)
            let nav = CustomNavigation(rootViewController: husbandryroomRequestController)
            present(nav, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let flow = UICollectionViewFlowLayout()
            let healthCheckQuestionController = HealthCheckQuestionMark(collectionViewLayout: flow)
            let nav = CustomNavigation(rootViewController: healthCheckQuestionController)
            present(nav, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuButt.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! MenuCells
        let path = MenuButt[indexPath.row]
        cell.menuLab.text = path
        cell.backgroundColor = .white
        return cell
    }
}
