//
//  StoredCell.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import UIKit

class StoredCell: UITableViewCell {

    @IBOutlet weak var tempratureLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var weatherConditionImageView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configoreCell(weatherData: WeatherData) {
        tempratureLbl.text = String(weatherData.temperature)
      //  weatherConditionImageView.image = weatherData.
        
    }
    
    

}
