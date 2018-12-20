//
//  HusbandryHeaderFlagsCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/25/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit


protocol HusbandryHeaderFlagsCellProtocool {
    func addHealthChechFlag(healthFlag: HusbandryHealthCheckFlagCell)
    func addMortalityHealthCheck(mortalityFlag: HusbandryMortalityFlagCell)
}
class HusbandryHeaderFlagsCell: UICollectionViewCell {
    
    var healthChechFlagDelegate: HusbandryHeaderFlagsCellProtocool?
//    var mortalityFlag: HusbandryMortalityFlagCell?
//
//    var healthCard: HusbandryHealthCheckFlagCell?
    lazy var healthCheck: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Health Check", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        lab.addTarget(self, action: #selector(addHealthFlag), for: .touchUpInside)
        return lab
    }()
//    var healthFlag: HusbandryHealthCheckFlagCell?
//    var mortalityFlag: HusbandryMortalityFlagCell?
//    var mortalityFlag : HusbandryMortalityFlagCell?
    @objc func addHealthFlag(healthFlag: HusbandryHealthCheckFlagCell) {
        healthChechFlagDelegate?.addHealthChechFlag(healthFlag: healthFlag)
        print("yerrsdcgdvgevgvgvrgcccccccccrrrrrrrrr")
    }
    
    let overCrowded: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("OverCrowded", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        return lab
    }()
    
    let newReceiving:UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("New Receiving", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return lab
    }()
    
   lazy var mortality: UIButton = {
        let lab = UIButton(type: .system)
        lab.setTitle("Mortality", for: .normal)
        lab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        lab.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        lab.addTarget(self, action: #selector(addMortalityFlag), for: .touchUpInside)
   
        return lab
    }()
    @objc func addMortalityFlag(mortalityFlag: HusbandryMortalityFlagCell) {
        healthChechFlagDelegate?.addMortalityHealthCheck(mortalityFlag: mortalityFlag)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackViewButton = UIStackView(arrangedSubviews: [healthCheck,newReceiving,mortality,overCrowded])
//        stackViewButton.alignment = .center
        stackViewButton.distribution = .fillEqually
        stackViewButton.spacing = 4
        addSubview(stackViewButton)
        stackViewButton.anchor(top: self.topAnchor, bottom: self.bottomAnchor, left: self.leadingAnchor, right: self.trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 10, rightPadding: 10, width: 0, height: 0)
//
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
