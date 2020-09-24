//
//  ChangeCityVC.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import UIKit

class ChangeCityVC: UIViewController {
    
    @IBOutlet weak var cityTxtField: UITextField!
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   @IBAction func getWeatherBtnTapped(_ sender: Any) {
        
        if let city = cityTxtField.text {
           
            let params : [String : String] = ["q" : city, "appid" : APP_ID]
            
            DownloadWeatherServices.instanse.getWeatherData(parameters: params)
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
}
