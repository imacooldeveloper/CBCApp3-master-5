//
//  SpeacialFeedCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/24/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit
class SpeacialFeedCell: UICollectionViewCell {
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "SPECIAL FEED"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    
    let labDiet5053: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Lab Diet 5053", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    
    let amoxi: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Amoxicillan", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        return lab
    }()
    
    let changeNotTouchLbl:UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Change", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    
    let doNotTouchLbl: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Touch", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        return lab
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
        
        taskView2.addSubview(labDiet5053)
        labDiet5053.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(amoxi)
        amoxi.anchor(top: labDiet5053.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(changeNotTouchLbl)
        changeNotTouchLbl.anchor(top: amoxi.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(doNotTouchLbl)
        doNotTouchLbl.anchor(top: changeNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
