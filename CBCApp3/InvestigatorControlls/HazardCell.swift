//
//  HazardCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/24/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class HazardCell: UICollectionViewCell {
    
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 1, green: 0.1308239102, blue: 0, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "HAZARD"
        lab.font = UIFont.boldSystemFont(ofSize: 60)
        return lab
    }()
    
    
    let feedNotTouchLbl: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("DO NOT FEED", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    
    let waterNotTouchLbl: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("DO NOT WATER", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        return lab
    }()
    
    let changeNotTouchLbl:UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("DO NOT CHANGE", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    
    let doNotTouchLbl: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("DO NOT TOUCH", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        return lab
    }()
    var startDateLBL: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "Start Date"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.numberOfLines = 0
        caseNum.textColor = .white
        return caseNum
    }()
    var startDatePlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "04/21/18"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var endDatePlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "04/21/18"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var endDateLBL: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "End Date"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.numberOfLines = 0
        caseNum.textColor = .white
        return caseNum
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(taskView2)
        taskView2.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 30, bottomPadding: 30, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
        taskView2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        taskView2.layer.borderWidth = 10
        taskView2.layer.masksToBounds = true
        
        taskView2.addSubview(healthCheckLbl)
        healthCheckLbl.anchor(top: taskView2.topAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        healthCheckLbl.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        taskView2.addSubview(feedNotTouchLbl)
        feedNotTouchLbl.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(waterNotTouchLbl)
        waterNotTouchLbl.anchor(top: feedNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(changeNotTouchLbl)
        changeNotTouchLbl.anchor(top: waterNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(doNotTouchLbl)
        doNotTouchLbl.anchor(top: changeNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(startDateLBL)
        startDateLBL.anchor(top: doNotTouchLbl.bottomAnchor, bottom: nil, left: doNotTouchLbl.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(startDatePlaceHolder)
        startDatePlaceHolder.anchor(top: startDateLBL.topAnchor, bottom: startDateLBL.bottomAnchor, left: startDateLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(endDateLBL)
        endDateLBL.anchor(top: startDateLBL.bottomAnchor, bottom: nil, left: startDateLBL.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(endDatePlaceHolder)
        endDatePlaceHolder.anchor(top: endDateLBL.topAnchor, bottom: endDateLBL.bottomAnchor, left: endDateLBL.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
