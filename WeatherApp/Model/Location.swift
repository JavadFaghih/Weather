//
//  WeatherData.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import Foundation
import RealmSwift

class Location: Object {
    
    @objc dynamic private(set) public var latitude = ""
    @objc dynamic private(set) public var longitude = ""
    
    convenience init(latitude: String, longitude: String) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
        
        
    }
    
    
}

