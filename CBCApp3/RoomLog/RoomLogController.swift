//
//  RoomLogController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 9/7/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class RoomLogController: UITableViewController {
    
    let dailyCell = "dailyCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: dailyCell)
        
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let daily = tableView.dequeueReusableCell(withIdentifier: dailyCell, for: indexPath)
            daily.backgroundColor = .yellow
            daily.textLabel?.text = "Daily"
            daily.textLabel?.textAlignment = .center
            daily.textLabel?.font = UIFont.boldSystemFont(ofSize: 90)
            return daily
        } else if indexPath.row == 1 {
            let daily = tableView.dequeueReusableCell(withIdentifier: dailyCell, for: indexPath)
            daily.backgroundColor = .red
            daily.textLabel?.text = "Weekly"
            daily.textLabel?.textAlignment = .center
            daily.textLabel?.font = UIFont.boldSystemFont(ofSize: 90)
            return daily
        }
        return UITableViewCell()
    }
    }
    

    

