//
//  TypeBirdsTableViewController.swift
//  DecoyBirds
//
//  Created by Alexey on 15.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class TypeBirdsTableViewController: UITableViewController {
    
    var birds = [Bird]()
    //let titelNavigation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    // MARK: - PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "isSongBirdSegue" else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            let bird = birds[indexPath.row]
            let navigationVC = segue.destination as! UINavigationController
            let birdSongVC = navigationVC.topViewController as! BirdsSongTableViewController
            birdSongVC.title = bird.name
            birdSongVC.songBird = bird
        
        }
        
        
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
        return birds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeBirdsCell", for: indexPath) as! TypeBirdsTableViewCell
        
        let bird = birds[indexPath.row]
        cell.set(object: bird)
        cell.imageBird.layer.cornerRadius = cell.imageBird.frame.width / 2
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100 //or whatever you need
    }
    
    
}
