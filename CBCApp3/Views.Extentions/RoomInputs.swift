//
//  RoomInputs.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 12/18/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class RoomInputs: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("yerrrr u cant see this")
       contentMode = .center
//        borderStyle = .roundedRect
        font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
