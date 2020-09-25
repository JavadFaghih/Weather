//
//  StoredSearcheVC.swift
//  WeatherApp
//
//  Created by javad faghih on 7/2/1399 AP.
//

import UIKit

class StoredSearcheVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIBarButtonItem) {
        if Weather.getWeather()?.count ?? 0 > 0 {
            alert()
        }
    }
    
    func alert() {
        
        let alert = UIAlertController(title: "Delete All Data Searched", message: "Do You want to delete all data that you searched", preferredStyle: .alert)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            Weather.deleteAllWeather()
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(delete)
        present(alert, animated: true, completion: nil)
    }
}

extension StoredSearcheVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Weather.getWeather()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storedCell", for: indexPath) as? StoredCell else { return UITableViewCell() }
        
        cell.configoreCell(weatherData: Weather.getWeather()![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            Weather.deleteWeather(indexPath.row)
            tableView.reloadData()
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return [deleteAction]
    }
}


