//
//  TypeBirdsTableViewCell.swift
//  DecoyBirds
//
//  Created by Alexey on 15.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class TypeBirdsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBird: UIImageView!
    @IBOutlet weak var nameBirdSong: UILabel!
    @IBOutlet weak var infoBird: UILabel!
    
    func set(object: Bird){
        self.imageBird.image = UIImage(named: object.pictureName)
        self.nameBirdSong.text = object.name
    }
    
}
