//
//  ViewController.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var tempratureLbl: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    
    let weatherData = WeatherData()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
        
    }
    
    func updateUI() {
        cityLbl.text = weatherData.city
        tempratureLbl.text = "\(weatherData.temperature)"
        conditionImageView.image = UIImage(named: weatherData.weatherIconName) 
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            self.locationManager.stopUpdatingLocation()
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
          
            print("longtitude: \(longitude), latitude: \(latitude)")
            
            let paramiters: [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            
            
            
           DownloadWeatherServices.instanse.getWeatherData(parameters: paramiters)
            updateUI()
        }
        
        
       
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        cityLbl.text = "Location Unavailable"
    }
    

}







