//
//  CalenderHeaderCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/9/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class CalenderheaderCell: UICollectionViewCell {
    
    
    let monthName: UILabel = {
        let month = UILabel()
        month.text = "OCTOBER"
        month.font = UIFont.boldSystemFont(ofSize: 40)
        month.textColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
        month.contentMode = .center
        month.translatesAutoresizingMaskIntoConstraints = false
        return month
    }()
    
    let previousMonth: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("<", for: .normal)
        but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
       return but
    }()
    let nextMonth: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle(">", for: .normal)
         but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        
        return but
    }()
    let monday: UILabel = {
        let day = UILabel()
       day.text = "Mon"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
       
        return day
    }()
    let tuesday: UILabel = {
        let day = UILabel()
        day.text = "Tue"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
        
        return day
    }()
    let wednsday: UILabel = {
        let day = UILabel()
        day.text = "Wed"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
        
        return day
    }()
    let thursday: UILabel = {
        let day = UILabel()
        day.text = "Thu"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
        
        return day
    }()
    let friday: UILabel = {
        let day = UILabel()
        day.text = "Fri"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
        
        return day
    }()
    let saturday: UILabel = {
        let day = UILabel()
        day.text = "Sat"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
        
        return day
    }()
    
    let sunday: UILabel = {
        let day = UILabel()
        day.text = "Sun"
        day.font = UIFont.boldSystemFont(ofSize: 20)
        day.contentMode = .center
        
        return day
    }()
    
    func setupHeaderView() {
        addSubview(monthName)
        monthName.anchor(top: topAnchor, bottom: nil, left: nil, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        monthName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         monthName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addSubview(previousMonth)
        previousMonth.anchor(top: monthName.topAnchor, bottom: monthName.bottomAnchor, left: leadingAnchor, right: monthName.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 30, width: 0, height: 0)
        addSubview(nextMonth)
        nextMonth.anchor(top: monthName.topAnchor, bottom: monthName.bottomAnchor, left: monthName.trailingAnchor, right: trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 0)
        let dayOfWeekStack = UIStackView(arrangedSubviews: [monday,tuesday,wednsday,thursday,friday,saturday,sunday])
        dayOfWeekStack.alignment = .center
        dayOfWeekStack.distribution = .fillEqually
        dayOfWeekStack.spacing = 5
        addSubview(dayOfWeekStack)
        dayOfWeekStack.anchor(top: monthName.bottomAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 60, bottomPadding: 0, leftPadding: 20, rightPadding: 8, width: 0, height: 40)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
