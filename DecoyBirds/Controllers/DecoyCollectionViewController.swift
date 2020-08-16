//
//  DecoyCollectionViewController.swift
//  DecoyBirds
//
//  Created by Alexey on 14.08.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class DecoyCollectionViewController: UICollectionViewController {
    let numPerInRow: CGFloat = 2
    let insetSection: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let imagesBirds = ["Бекас", "Вальдшнеп", "Воробей", "Ворона", "Вяхирь", "Глухарь", "Грач", "Гуменной гусь", "Гусь", "Куропатка"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - UnwindSegue
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imagesBirds.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "decoyCell", for: indexPath) as! DecoyCell
        
        //cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let imageName = imagesBirds[indexPath.item]
        let image = UIImage(named: imageName)
        cell.imageBird.layer.cornerRadius = cell.imageBird.frame.height / 4
        cell.imageBird.clipsToBounds = true
        cell.imageBird.image = image
        cell.nameBird.text = imageName
        
        return cell
    }
  
}

extension DecoyCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthIndent = insetSection.left * (numPerInRow + 1)
        let availabelWidth = collectionView.frame.width - widthIndent
        let widthPer = availabelWidth / numPerInRow
        
        return CGSize(width: widthPer, height: widthPer)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetSection
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insetSection.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insetSection.left
    }
}
