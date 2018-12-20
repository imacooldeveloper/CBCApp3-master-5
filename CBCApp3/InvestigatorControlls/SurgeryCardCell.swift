//
//  SurgeryCardCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/24/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class SurgeryCardCell: UICollectionViewCell,UISearchBarDelegate {
    
    
    
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "SURGERY CARD"
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        return lab
    }()
   
    
    var datePlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "04/21/18"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var cageNum: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "CageID"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.textColor = .white
        return caseNum
    }()
    var cageNumPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Ex 000134"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    var search: UISearchBar = {
        let s = UISearchBar()
        s.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        s.placeholder = "Cage Number"
        return s
    }()
    
    let majorSx: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Major SX", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    var majorSxDiscption: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "(Invasive operative procedure where extensive \n resection is performed, eg a body cavity is entered, \n organs are removed, or nomal anatomy is altered)"
        caseNum.font = UIFont.boldSystemFont(ofSize: 20)
        caseNum.numberOfLines = 0
        caseNum.textColor = .white
        return caseNum
    }()
    
    
    let minorSx: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("minor SX", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    var minorSxDiscption: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "(Operative procedure in which only skin or mucus \n membranes and connective tissue is resected)"
        caseNum.font = UIFont.boldSystemFont(ofSize: 20)
        caseNum.numberOfLines = 0
        caseNum.textColor = .white
        return caseNum
    }()
    var sutureStaple: UILabel = {
        var caseNum = UILabel()
        caseNum.text = "Suture/Staple \n Removal date"
        caseNum.font = UIFont.boldSystemFont(ofSize: 30)
        caseNum.numberOfLines = 0
        caseNum.textColor = .white
        return caseNum
    }()
    
    var removalDatePlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "04/21/18"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var notePlaceHolder: UITextView = {
        var text = UITextView()
        //        text.placeholder = "    Extra Notes"
        text.text = "Please report any adverse or \nunanticipated events to the \n veterinarian"
        
        text.textContainer.maximumNumberOfLines = 40
        text.textContainer.lineBreakMode = .byTruncatingTail
        text.contentMode = .center
        //        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 15)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var initialPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Initials"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    func setupSurgeryViews() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(taskView2)
        taskView2.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 30, bottomPadding: 30, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
        taskView2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        taskView2.layer.borderWidth = 10
        taskView2.layer.masksToBounds = true
        
        taskView2.addSubview(healthCheckLbl)
        healthCheckLbl.anchor(top: taskView2.topAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        healthCheckLbl.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        taskView2.addSubview(datePlaceHolder)
        
        datePlaceHolder.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: taskView2.leadingAnchor, right: healthCheckLbl.leadingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 80, rightPadding: 80, width: 0, height: 0)
        
        // Search bar
        taskView2.addSubview(search)
        search.anchor(top: healthCheckLbl.topAnchor, bottom: healthCheckLbl.bottomAnchor, left: healthCheckLbl.trailingAnchor , right: taskView2.trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 50, width: 0, height: 0)
        taskView2.addSubview(majorSx)
        majorSx.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 90, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(majorSxDiscption)
        majorSxDiscption.anchor(top: majorSx.bottomAnchor, bottom: nil, left: majorSx.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 90, width: 0, height: 0)
        
        taskView2.addSubview(minorSx)
        minorSx.anchor(top: majorSxDiscption.bottomAnchor, bottom: nil, left: majorSx.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(minorSxDiscption)
        minorSxDiscption.anchor(top: minorSx.bottomAnchor, bottom: nil, left: minorSx.leadingAnchor, right: majorSxDiscption.trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(sutureStaple)
        sutureStaple.anchor(top: minorSxDiscption.bottomAnchor, bottom: nil, left: minorSx.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(removalDatePlaceHolder)
        removalDatePlaceHolder.anchor(top: nil, bottom: sutureStaple.bottomAnchor, left: sutureStaple.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 30)
        taskView2.addSubview(notePlaceHolder)
        notePlaceHolder.anchor(top: sutureStaple.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: taskView2.trailingAnchor, topPadding: 30, bottomPadding: 0, leftPadding: 70, rightPadding: 70, width: 0, height: 120)
        notePlaceHolder.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        taskView2.addSubview(initialPlaceHolder)
        initialPlaceHolder.anchor(top: notePlaceHolder.bottomAnchor, bottom: nil, left: notePlaceHolder.leadingAnchor, right: nil, topPadding: 60, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 50)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSurgeryViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
