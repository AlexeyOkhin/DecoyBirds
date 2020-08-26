//
//  TypeBirdViewController.swift
//  DecoyBirds
//
//  Created by Alexey on 26.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit
import AVFoundation

class TypeBirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var birds = [Bird]()
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var miniPlayerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        miniPlayerView.isHidden = true
       
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return birds.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeBirdsCell", for: indexPath) as! TypeBirdsTableViewCell
        
        let bird = birds[indexPath.row]
        cell.set(object: bird)
        cell.imageBird.layer.cornerRadius = cell.imageBird.frame.width / 2
        
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100 //or whatever you need
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: tableView.frame.height - 200, width: tableView.bounds.width, height: 70)
        footerView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        footerView.alpha = 0
        self.view.addSubview(footerView)
        UIView.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {
            //footerView.frame = CGRect(x: 0, y: tableView.frame.height - 300, width: tableView.bounds.width, height: 70)
            footerView.alpha = 1
        }, completion: nil)
        
        
        
        audioPlayer.prepareToPlay()
        //audioPlayer.numberOfLoops = 1
        audioPlayer.play()
        
    }
    

    
}
