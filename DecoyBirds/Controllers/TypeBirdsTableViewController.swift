//
//  TypeBirdsTableViewController.swift
//  DecoyBirds
//
//  Created by Alexey on 15.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class TypeBirdsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    // MARK: - UnwindSegue
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
}
