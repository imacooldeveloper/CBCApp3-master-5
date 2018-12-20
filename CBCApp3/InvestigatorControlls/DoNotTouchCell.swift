//
//  DoNotTouchCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/24/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class DoNotTouchCell: UICollectionViewCell {
    
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "DO NOT"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
    
    
    let feedNotTouchLbl: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Feed", for: .normal)
            lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    
    let waterNotTouchLbl: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Water", for: .normal)
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
    var discription: UILabel = {
        let lab = UILabel()
        lab.text = "Investigator is responsible for providing \nfood, water and/or cage change as needed, but AT LEAST WEEKLY during the period above. \nProvide date and initials when husbandry is performed."
        lab.font = UIFont.boldSystemFont(ofSize: 25)
        lab.numberOfLines = 0
        lab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lab
    }()
    var discription2: UILabel = {
        let lab = UILabel()
        lab.text = "If speacial husbandry is required for 7 days or more cages,\nplease check the box below and fill out a speacial Husbandry log."
        lab.font = UIFont.boldSystemFont(ofSize: 22)
        lab.numberOfLines = 0
        lab.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
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
        
        taskView2.addSubview(feedNotTouchLbl)
        feedNotTouchLbl.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(waterNotTouchLbl)
        waterNotTouchLbl.anchor(top: feedNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(changeNotTouchLbl)
        changeNotTouchLbl.anchor(top: waterNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(doNotTouchLbl)
        doNotTouchLbl.anchor(top: changeNotTouchLbl.bottomAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(discription)
        discription.anchor(top: doNotTouchLbl.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 50, rightPadding: 50, width: 0, height: 0)
        taskView2.addSubview(discription2)
        discription2.anchor(top: discription.bottomAnchor, bottom: nil, left: discription.leadingAnchor, right: discription.trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
