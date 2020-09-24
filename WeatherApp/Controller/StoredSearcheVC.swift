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
    
}

extension StoredSearcheVC: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storedSearcheVC", for: indexPath) as? StoredCell else { return UITableViewCell() }
        
        
        
        
        return cell
    }
    
    
    
    
    
    
    
    
}


