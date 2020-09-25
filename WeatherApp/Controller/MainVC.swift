//
//  ViewController.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import UIKit
import CoreLocation


class MainVC: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var tempratureLbl: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    func updateUI() {
        
        guard let weather = Weather.getWeather()?.first else { return }
        
        cityLbl.text = String(weather.city)
        tempratureLbl.text = "\(weather.temperature)º"
        conditionImageView.image = UIImage(named: updateWeatherIcon(condition: weather.condition))
    }
    
    func updateWeatherIcon(condition: Int) -> String {
        
        switch (condition) {
        
        case 0...300 :
            return "tstorm1"
            
        case 301...500 :
            return "light_rain"
            
        case 501...600 :
            return "shower3"
            
        case 601...700 :
            return "snow4"
            
        case 701...771 :
            return "fog"
            
        case 772...799 :
            return "tstorm3"
            
        case 800 :
            return "sunny"
            
        case 801...804 :
            return "cloudy2"
            
        case 900...903, 905...1000  :
            return "tstorm3"
            
        case 903 :
            return "snow5"
            
        case 904 :
            return "sunny"
            
        default :
            return "dunno"
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //   locations.count - 1
        
        let location = locations[0]
        
        if location.horizontalAccuracy > 0 {
            self.locationManager.stopUpdatingLocation()
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            print("longtitude: \(longitude), latitude: \(latitude)")
            
            let paramiters: [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            DownloadWeatherServices.instanse.getWeatherData(parameters: paramiters)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        cityLbl.text = "Location Unavailable"
    }
}
