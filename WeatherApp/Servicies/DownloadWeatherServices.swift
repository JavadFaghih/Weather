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
    
    var weatherDataModel = WeatherData()

    
    
    
    //Get Weather Data
    func getWeatherData(parameters: [String: String]) {
        
        AF.request(WEATHER_URL, method: .get, parameters: parameters).responseJSON {
            response in
            
            switch response.result {
            
            
            case .success(let value):
                let weatherJSON : JSON = JSON(value)
                self.updateWeatherData(json: weatherJSON)
                print(weatherJSON)
                
                print(weatherJSON)
            case .failure(let error):
                print("Error \(String(describing: error))")
            }
            
            
            
        }
        
    }
    
    
    //Parse Data
    func updateWeatherData(json : JSON) {
    
        let tempResult = json["main"]["temp"].doubleValue
    
        let tempratore = Int(tempResult - 273.15)
        let city = json["name"].stringValue
        let condition = json["weather"][0]["id"].intValue
       
        
        Weather.addWeatherToRealm(temp: tempratore, condition: condition, city: city)
        
        
        
        
        
        
        
//        weatherDataModel.temperature = Int(tempResult - 273.15)
//
//            weatherDataModel.city = json["name"].stringValue
//
//            weatherDataModel.condition = json["weather"][0]["id"].intValue
//
//            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
//
//
        
        }
    
    
    
}
