//
//  Extension.swift
//  WeatherApp
//
//  Created by javad faghih on 7/3/1399 AP.
//

import Foundation


extension NSDate {
    
    //for change data to an specific format and convert to string
    func getDateString() -> String{
        let calener = Calendar.current
        let month = calener.component(.month, from: self as Date)
        let day = calener.component(.day, from: self as Date)
        let year = calener.component(.year, from: self as Date)
        
        return "\(month)/\(day)/\(year)"
        
    }
    
    
    
    
    
}

