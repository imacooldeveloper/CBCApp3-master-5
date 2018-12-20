//
//  TreatMentBoardCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 12/19/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class TreatMentBoardCell: UITableViewCell {
    
    let dateLabel = RoomInputs()
    let cageNumberLabel = RoomInputs()
    let roomNumber = RoomInputs()
    let protocoolLabel = RoomInputs()
    let loctionLabel = RoomInputs()
    let rackLabel = RoomInputs()
    let healthIssueLabel = RoomInputs()
    let treatmentLabel = RoomInputs()
    let registerBtn = UILabel()
    
    
    let treatMentView = UIView()
    
    var treatMents:TreatMents?{
        didSet{
            
            
           
            
            dateLabel.text = treatMents?.date
            cageNumberLabel.text = treatMents?.cageNumber
            roomNumber.text = treatMents?.room
            protocoolLabel.text = treatMents?.protocolNumber
            loctionLabel.text = treatMents?.location
            rackLabel.text = treatMents?.rack
            healthIssueLabel.text = treatMents?.healthIssue
            treatmentLabel.text = treatMents?.treatMent
            registerBtn.text = treatMents?.schedule
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        
    }
    
    
    fileprivate func setupLayout() {
       
        addSubview(treatMentView)
        treatMentView.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 30, rightPadding: 30, width: 0, height: 0)
        treatMentView.backgroundColor = #colorLiteral(red: 1, green: 0.4869330525, blue: 0.1523756981, alpha: 1)
        treatMentView.addSubview(dateLabel)
        dateLabel.anchor(top: treatMentView.topAnchor, bottom: nil, left: treatMentView.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 30, rightPadding: 0, width: 0, height: 30)
        dateLabel.text = treatMents?.date
        
        treatMentView.addSubview(cageNumberLabel)
        cageNumberLabel.anchor(top: treatMentView.topAnchor, bottom: nil, left: nil, right: treatMentView.trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 30, width: 0, height: 30)
        cageNumberLabel.text = treatMents?.cageNumber
        cageNumberLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        treatMentView.addSubview(roomNumber)
        
        roomNumber.text = "Room- \(treatMents?.room)"
        
        roomNumber.anchor(top: dateLabel.bottomAnchor, bottom: nil, left: dateLabel.leadingAnchor, right: nil, topPadding: 30, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        
        
        treatMentView.addSubview(protocoolLabel)
        protocoolLabel.text = "protocol- \(treatMents?.protocolNumber)"
        protocoolLabel.anchor(top: roomNumber.topAnchor, bottom: roomNumber.bottomAnchor, left: roomNumber.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        treatMentView.addSubview(loctionLabel)
        loctionLabel.text = "Location-\(treatMents?.location)"
        loctionLabel.anchor(top: protocoolLabel.topAnchor, bottom: protocoolLabel.bottomAnchor, left: protocoolLabel.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        treatMentView.addSubview(rackLabel)
        rackLabel.text = "Rack- \(treatMents?.rack)"
        rackLabel.anchor(top: loctionLabel.topAnchor, bottom: loctionLabel.bottomAnchor, left: loctionLabel.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        
        
        treatMentView.addSubview(healthIssueLabel)
        healthIssueLabel.text = "Health Issue- \(treatMents?.healthIssue) "
        healthIssueLabel.anchor(top: roomNumber.bottomAnchor, bottom: nil, left: roomNumber.leadingAnchor, right: nil, topPadding: 20, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
        
        treatMentView.addSubview(treatmentLabel)
        treatmentLabel.text = "Treatment- \(treatMents?.healthIssue) "
        
        treatmentLabel.anchor(top: healthIssueLabel.topAnchor, bottom: healthIssueLabel.bottomAnchor, left: healthIssueLabel.trailingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 20, rightPadding: 0, width: 0, height: 0)
        
        treatMentView.addSubview(registerBtn)
        registerBtn.text = "Treatment Schedule- \(treatMents?.schedule ?? "")"
        registerBtn.anchor(top: treatMentView.topAnchor, bottom: treatMentView.bottomAnchor, left: nil, right: nil, topPadding: 80, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        registerBtn.centerXAnchor.constraint(equalTo: treatMentView.centerXAnchor).isActive = true
        
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
