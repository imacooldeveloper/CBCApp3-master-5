//
//  CrendtialCells.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 8/11/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit


class CrenditalCells: UICollectionViewCell {
    
    
    var menuLab: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 60)
        lab.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lab.textAlignment = .center
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(menuLab)
        menuLab.anchor(top: nil, bottom: nil, left: nil, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        menuLab.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        menuLab.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
