//
//  CaptionsViewController.swift
//  InstaComments
//
//  Created by Cary Meskell on 4/17/20.
//  Copyright © 2020 Cary Meskell. All rights reserved.
//

import Foundation
import UIKit

class CaptionsViewController: UIViewController {
    var captions: [String]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}


//MARK: - Datasource Methods

extension CaptionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return captions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCategoryCell", for: indexPath)
        cell.textLabel?.text = captions?[indexPath.row] ?? ""
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}

