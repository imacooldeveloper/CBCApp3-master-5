//
//  RoomRequestCell.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 8/1/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

class RoomRequestCell: UICollectionViewCell {
    
    
    var roomRequest: Request? {
        didSet {
            requestName.text = roomRequest?.request
            quantityPlace.placeholder = roomRequest?.quantity
        }
    }
    
    let backView: UIView = {
        let back = UIView()
        back.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return back
    }()
    var requestImage: UIImageView = {
        let request = UIImageView()
        request.contentMode = .scaleAspectFit
        return request
    }()
    var requestName: UILabel = {
        let name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = .center
        name.contentMode = .center
        name.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        name.text = "www"
        return name
    }()
    var quantityPlace: UITextField = {
        let place = UITextField()
        place.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return place
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backView)
        backView.anchor(top: topAnchor, bottom: bottomAnchor, left: leadingAnchor, right: trailingAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        backView.addSubview(requestImage)
        requestImage.anchor(top: backView.topAnchor, bottom: nil, left: backView.leadingAnchor, right: backView.trailingAnchor, topPadding: 8, bottomPadding: 0, leftPadding: 8, rightPadding: 8, width: 0, height: 160)
        
        backView.addSubview(requestName)
        requestName.anchor(top: requestImage.bottomAnchor, bottom: nil, left: backView.leadingAnchor, right: backView.trailingAnchor, topPadding: 10, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
        

        requestName.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
//        requestName.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        
        backView.addSubview(quantityPlace)
        quantityPlace.anchor(top: requestName.bottomAnchor, bottom: backView.bottomAnchor, left: backView.leadingAnchor, right: backView.trailingAnchor, topPadding: 4, bottomPadding: 20, leftPadding: 40, rightPadding: 40, width: 0, height: 0)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
