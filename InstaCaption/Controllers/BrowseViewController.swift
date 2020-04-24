//
//  BrowseViewController.swift
//  InstaComments
//
//  Created by Cary Meskell on 4/17/20.
//  Copyright © 2020 Cary Meskell. All rights reserved.
//

import Foundation
import UIKit

class BrowseViewController: UIViewController {
    var quoteBrain: QuoteBrain?
    var categories: [String] {
        return quoteBrain?.getCategories() ?? []
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // custom font for nav title
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Savoye LET Plain:1.0 42.0", size: 20) ?? UIFont.systemFont(ofSize: 20)]
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


//MARK: - Datasource Methods

extension BrowseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
        
    }
}

//MARK: - Delegate Methods

extension BrowseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToCaptions", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! CaptionsViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.captions = quoteBrain?.quotes[categories[indexPath.row]]
        }
    }
}

