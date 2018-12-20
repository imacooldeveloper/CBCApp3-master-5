//
//  HealthCheckModel.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/29/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//

import UIKit

struct HealthCheck {
    
    var date: String
    var cageNum: String
    var roomPlace: String
    var locationPlace: String
    var rackPlace: String
    var notePlace: String
    
    init(date: String, cageNum: String, roomPlace:String, locationPlace: String, rackPlace: String, notePlace: String) {
        self.date = date
        self.cageNum = cageNum
        self.roomPlace = roomPlace
        self.locationPlace = locationPlace
        self.rackPlace = rackPlace
        self.notePlace = notePlace
    
    }
}




