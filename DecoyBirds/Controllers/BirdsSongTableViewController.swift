//
//  BirdsSongTableViewController.swift
//  DecoyBirds
//
//  Created by Alexey on 15.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit
import AVFoundation

class BirdsSongTableViewController: UITableViewController {
    var audioPlayer = AVAudioPlayer()
    var songBird = Bird(name: "", pictureName: "", songName: "", isFavorite: false)

    @IBOutlet weak var imageBird: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBird.image = UIImage(named: songBird.pictureName)
        let songName = songBird.songName
        
        // test code for background
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
        audioPlayer.prepareToPlay()
        
        
       
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        audioPlayer.play()
        audioPlayer.numberOfLoops = 1
        
    }
    @IBAction func stopButton(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    @IBAction func repeatButton(_ sender: UIButton) {
        
    }
    
    @IBAction func volumeAction(_ sender: UISlider) {
        //volumeSlider.value
    }
    
    
}
