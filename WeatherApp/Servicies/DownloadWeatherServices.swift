//
//  DownloadWeatherServices.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import Foundation
import Alamofire
import SwiftyJSON

class DownloadWeatherServices {
    
    static let instanse = DownloadWeatherServices()
    
    //Get Weather Data method
    func getWeatherData(parameters: [String: String]) {
        
        AF.request(WEATHER_URL, method: .get, parameters: parameters).responseJSON {
            response in
            
            switch response.result {
            
            case .success(let value):
                let weatherJSON : JSON = JSON(value)
                self.parseWeatherData(json: weatherJSON)
                print(weatherJSON)
                
                case .failure(let error):
                print("Error \(String(describing: error))")
                }
            }
        }
    //Parse JSON
    func parseWeatherData(json : JSON) {
        
        let tempResult = json["main"]["temp"].doubleValue
        //for convert temprature to Celsius
        let tempratore = Int(tempResult - 273.15)
        let condition = json["weather"][0]["id"].intValue
        let city = json["name"].stringValue
        //add weather to local host
        Weather.addWeatherToRealm(temp: tempratore, condition: condition, city: city)
    }
}
