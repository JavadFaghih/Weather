//
//  StoredCell.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import UIKit

class StoredCell: UITableViewCell {

    @IBOutlet weak var tempratureLbl: UILabel!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configoreCell(weatherData: Weather) {
        tempratureLbl.text = "\(weatherData.temperature)º"
        cityNameLbl.text = weatherData.city
        dateLbl.text = weatherData.date.getDateString()
    }
    
    

}
