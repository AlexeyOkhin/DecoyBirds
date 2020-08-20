//
//  TypeBirdsTableViewController.swift
//  DecoyBirds
//
//  Created by Alexey on 15.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit
import AVFoundation

class TypeBirdsTableViewController: UITableViewController {
    
    var birds = [Bird]()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var nameSongLabel: UILabel!
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - UnwindSegue
    
    //@IBAction func unwindSegue (segue: UIStoryboardSegue) {
    
    //}
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // test code for background
        
        let songName = birds[indexPath.row].songName
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .defaultToSpeaker)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        /////////////////// end test code
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: songName, ofType: "mp3")!))
        } catch  {
            print ("Error")
        }
        nameSongLabel.text = birds[indexPath.row].name
        tableView.tableFooterView = footerView
        tableView.sectionFooterHeight = 100
        audioPlayer.prepareToPlay()
        audioPlayer.numberOfLoops = 1
        audioPlayer.play()
    }
    
    
    
    
}
