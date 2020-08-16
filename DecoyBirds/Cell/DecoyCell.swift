//
//  DecoyCell.swift
//  DecoyBirds
//
//  Created by Alexey on 14.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class DecoyCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBird: UIImageView!
    @IBOutlet weak var nameBird: UILabel!
    
    func set(object: TypeBird){
        self.imageBird.image = UIImage(named: object.name)
        self.nameBird.text = object.name
    }
    
    
}
