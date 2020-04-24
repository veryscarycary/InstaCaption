//
//  TableViewController.swift
//  InstaComments
//
//  Created by Cary Meskell on 4/17/20.
//  Copyright © 2020 Cary Meskell. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    var quoteBrain: QuoteBrain?
    var categories: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(quoteBrain?.getRandomQuote())

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}

extension BrowseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = t
    }
}
