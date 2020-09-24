//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by javad faghih on 7/3/1399 AP.
//

import Foundation
import RealmSwift



class Weather: Object {
    
    //the prperties you need to store data in those.
    @objc dynamic public private(set) var id = ""
    @objc dynamic public private(set) var date = NSDate()
    @objc dynamic public private(set) var temperature: Int = 0
    @objc dynamic public private(set) var condition: Int = 0
    @objc dynamic public private(set) var city: String =  ""
    
    
    //use this method to instantiat a property to be unique
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
    
    override class func indexedProperties() -> [String] {
        return ["temperature", "date", "city"]
    }
    
    convenience init(temp: Int, conditin: Int, city: String) {
        self.init()
        
        //use uuid to create your id randomly
        self.id = UUID().uuidString.lowercased()
        
        //use date for ordering your data
        self.date = NSDate()
        self.temperature = temp
        self.condition = conditin
        self.city = city
        
        
    }
    
    
    //by this method you can add data into your dataBase
    static func addWeatherToRealm(temp: Int, condition: Int, city: String) {
        
        REALM_QUEUE.sync {
            let weather = Weather(temp: temp, conditin: condition, city: city)
            
            do {
                let realm = try Realm()
                try realm.write{
                    realm.add(weather)
                    try realm.commitWrite()
                    print("successfully add run to realm")
                }
            } catch {
                debugPrint("error adding weather to realm")
            }
        }
    }
    
    
    
    //for fetching data from RealmDataBase
    static func getWeather() -> Results<Weather>? {
        
        do {
            let realm = try Realm()
            var weather = realm.objects(Weather.self)
            
            /* use this for sorting data in order date or something else
             ascending: false means last data must be in first column of array[0] */
            weather = weather.sorted(byKeyPath: "date", ascending: false)
            return weather
            
        } catch {
            return nil
        }
    }
    
    
    //get last run by id
    static func getWeatherById(byid id: String) -> Weather? {
        
        do {
            let realm = try Realm()
            let weather = realm.object(ofType: Weather.self, forPrimaryKey: id)
            return weather
        } catch {
            return nil
        }
    }
}
