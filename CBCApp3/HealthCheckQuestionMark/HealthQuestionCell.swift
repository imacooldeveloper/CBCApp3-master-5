//
//  HealthQuestionCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 9/19/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class HealthQuestionCell: UICollectionViewCell {
    
    
    
    let miceTitle: UILabel = {
        let mice = UILabel()
//        mice.text = "Fight Wounds"
        mice.textAlignment = .center
        mice.font = UIFont.boldSystemFont(ofSize: 40)
        return mice
    }()
    var miceImage: UIImageView = {
        let mouseImage = UIImageView()
//        mouseImage.image = #imageLiteral(resourceName: "fightWounds")
        mouseImage.contentMode = .scaleAspectFill
        mouseImage.clipsToBounds = true
        return mouseImage
    }()
    let miceImage2: UIImageView = {
        let mouseImage = UIImageView()
//        mouseImage.image = #imageLiteral(resourceName: "fightWounds3")
        mouseImage.contentMode = .scaleAspectFill
        mouseImage.clipsToBounds = true
        return mouseImage
    }()
    let miceImage3: UIImageView = {
        let mouseImage = UIImageView()
//        mouseImage.image = #imageLiteral(resourceName: "fightWounds2")
        mouseImage.contentMode = .scaleAspectFill
        mouseImage.clipsToBounds = true
        return mouseImage
    }()
    let discription: UILabel = {
        let mice = UILabel()
        mice.text = "Aggressive mouse (with no wounds) will bite the other mice Common in male mice Commonly seen along the rump/around the genitals"
        mice.font = UIFont.boldSystemFont(ofSize: 20)
        mice.numberOfLines = 10
        return mice
    }()
    
    func updateViews(healthConcerns: HealthConcerns) {
        miceTitle.text = healthConcerns.mouseTitle
        miceImage.image = UIImage(named: healthConcerns.mouseImage)
        miceImage2.image = UIImage(named: healthConcerns.mouseImage2)
        miceImage3.image = UIImage(named: healthConcerns.mouseImage3)
        discription.text = healthConcerns.mouseDiscriptions
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(miceTitle)
        miceTitle.anchor(top: topAnchor, bottom: nil, left: leadingAnchor, right: trailingAnchor, topPadding: 20, bottomPadding: 0, leftPadding: 7, rightPadding: 7, width: 0, height: 0)
    
        let fightWoundImageStack = UIStackView(arrangedSubviews: [miceImage,miceImage2, miceImage3])
//        fightWoundImageStack.alignment = .fill
        fightWoundImageStack.distribution = .fillEqually
        fightWoundImageStack.spacing = 5
        
        addSubview(fightWoundImageStack)
        fightWoundImageStack.anchor(top: miceTitle.bottomAnchor, bottom: nil, left: leadingAnchor , right: trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 160, height: 160)
       
//        miceImage.centerXAnchor.constraint(equalTo: miceTitle.centerXAnchor).isActive = true
        
        addSubview(discription)
        discription.anchor(top: fightWoundImageStack.bottomAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 7, rightPadding: 7, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
