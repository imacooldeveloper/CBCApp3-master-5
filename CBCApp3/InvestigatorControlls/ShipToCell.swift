//
//  ShipToCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/24/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class ShipToCell: UICollectionViewCell {
    var taskView2: UIView = {
        var square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return square
    }()
    var healthCheckLbl: UILabel = {
        let lab = UILabel()
        lab.text = "SHIP TO"
        lab.font = UIFont.boldSystemFont(ofSize: 60)
        return lab
    }()
    var investigator: UILabel = {
        var room = UILabel()
        room.text = "Investigator:"
        room.textColor = .white
        
        room.font = UIFont.boldSystemFont(ofSize: 30)
        return room
    }()
    var investigatorPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Investigator"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var cageCard: UILabel = {
        var room = UILabel()
        room.text = "Cage Card:"
        room.textColor = .white
        
        room.font = UIFont.boldSystemFont(ofSize: 30)
        return room
    }()
    var cagecardPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Cage Card"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var destination: UILabel = {
        var room = UILabel()
        room.text = "Destination:"
        room.textColor = .white
        
        room.font = UIFont.boldSystemFont(ofSize: 30)
        return room
    }()
    var destinationPlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Destination"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var dateLbl: UILabel = {
        var room = UILabel()
        room.text = "Date:"
        room.textColor = .white
        
        room.font = UIFont.boldSystemFont(ofSize: 30)
        return room
    }()
    var datePlaceHolder: UITextField = {
        var text = UITextField()
        text.placeholder = "Date"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    var numberof1: UITextField = {
        var text = UITextField()
        text.placeholder = "______"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    var ofLbl: UILabel = {
        var room = UILabel()
        room.text = "OF"
        room.textColor = .black
        
        room.font = UIFont.boldSystemFont(ofSize: 20)
        return room
    }()
    var numberof2: UITextField = {
        var text = UITextField()
        text.placeholder = "______"
        text.contentMode = .center
        text.borderStyle = .roundedRect
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return text
    }()
    
    func setupViewShipTo() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(taskView2)
        taskView2.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 30, bottomPadding: 30, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
        taskView2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        taskView2.layer.borderWidth = 10
        taskView2.layer.masksToBounds = true
        
        taskView2.addSubview(healthCheckLbl)
        healthCheckLbl.anchor(top: taskView2.topAnchor, bottom: nil, left: nil, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        healthCheckLbl.centerXAnchor.constraint(equalTo: taskView2.centerXAnchor).isActive = true
        
        taskView2.addSubview(investigator)
        investigator.anchor(top: healthCheckLbl.bottomAnchor, bottom: nil, left: taskView2.leadingAnchor, right: nil, topPadding: 60, bottomPadding: 0, leftPadding: 70, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(investigatorPlaceHolder)
        investigatorPlaceHolder.anchor(top: investigator.topAnchor, bottom: investigator.bottomAnchor, left: investigator.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        taskView2.addSubview(cageCard)
        cageCard.anchor(top: investigator.bottomAnchor, bottom: nil, left: investigator.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(cagecardPlaceHolder)
        cagecardPlaceHolder.anchor(top: cageCard.topAnchor, bottom: cageCard.bottomAnchor, left: cageCard.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(destination)
        destination.anchor(top: cageCard.bottomAnchor, bottom: nil, left: cageCard.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(destinationPlaceHolder)
        destinationPlaceHolder.anchor(top: destination.topAnchor, bottom: destination.bottomAnchor, left: destination.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        
        
        taskView2.addSubview(dateLbl)
        dateLbl.anchor(top: destination.bottomAnchor, bottom: nil, left: cageCard.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(datePlaceHolder)
        datePlaceHolder.anchor(top: dateLbl.topAnchor, bottom: dateLbl.bottomAnchor, left: dateLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        
        taskView2.addSubview(numberof1)
        numberof1.anchor(top: dateLbl.bottomAnchor, bottom: nil, left: dateLbl.leadingAnchor, right: nil, topPadding: 50, bottomPadding: 0, leftPadding: 300, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(ofLbl)
        ofLbl.anchor(top: numberof1.topAnchor, bottom: numberof1.bottomAnchor, left: numberof1.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        taskView2.addSubview(numberof2)
        numberof2.anchor(top: numberof1.topAnchor, bottom: numberof1.bottomAnchor, left: ofLbl.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewShipTo()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
