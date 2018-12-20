//
//  CalenderCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 10/9/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class CalenderCellController: UICollectionViewCell {
    
    let days: UILabel = {
        let da = UILabel()
        da.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return da
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        addSubview(days)
        days.anchor(top: topAnchor, bottom: nil, left: leadingAnchor, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
