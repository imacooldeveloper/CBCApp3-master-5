//
//  DailyCalenderController.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/9/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class DailyCalenderController: UIViewController {
    
    let initailLab:UILabel = {
        let lab = UILabel()
       lab.text = "Animal health & Room check(initial)"
        lab.textColor = #colorLiteral(red: 0.9914976954, green: 1, blue: 0, alpha: 1)
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        return lab
    }()
    let initailLabField: UITextField = {
        let field = UITextField()
        field.placeholder = "MG"
        field.borderStyle = .roundedRect
        return field
    }()
    let feedH20Lab:UILabel = {
        let lab = UILabel()
        lab.text = "Check feed & H2O bottles"
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        lab.textColor = #colorLiteral(red: 0.9914976954, green: 1, blue: 0, alpha: 1)
        return lab
    }()
    let feedH20Field: UITextField = {
        let field = UITextField()
        field.placeholder = " "
        field.borderStyle = .roundedRect
        return field
    }()
    let waterBottleLab:UILabel = {
        let lab = UILabel()
        lab.text = "Water bottles change"
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        lab.textColor = #colorLiteral(red: 0.3429560661, green: 1, blue: 0.3007792532, alpha: 1)
        return lab
    }()
    let waterBottleField: UITextField = {
        let field = UITextField()
        field.placeholder = " "
        field.borderStyle = .roundedRect
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        setupViews()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    func setupViews() {
        view.addSubview(initailLab)
        initailLab.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        view.addSubview(initailLabField)
        initailLabField.anchor(top: initailLab.topAnchor, bottom: initailLab.bottomAnchor, left: initailLab.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 5, rightPadding: 0, width: 0, height: 0)
        view.addSubview(feedH20Lab)
        feedH20Lab.anchor(top: initailLab.bottomAnchor, bottom: nil, left: initailLab.leadingAnchor, right: nil, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        view.addSubview(feedH20Field)
        feedH20Field.anchor(top: feedH20Lab.topAnchor, bottom: feedH20Lab.bottomAnchor, left: feedH20Lab.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 5, rightPadding: 0, width: 0, height: 0)
        
        view.addSubview(waterBottleLab)
        waterBottleLab.anchor(top: feedH20Lab.bottomAnchor, bottom: nil, left: feedH20Lab.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        view.addSubview(waterBottleField)
        waterBottleField.anchor(top: waterBottleLab.topAnchor, bottom: waterBottleLab.bottomAnchor, left: waterBottleLab.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 5, rightPadding: 0, width: 0, height: 0)
    }
}
