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
    
    private let typeBirds = [TypeBird(name: "Бекас", birds: [Bird(name: "Бекас-1", pictureName: "Бекас-1", songName: "Бекас-1", isFavorite: false)]), TypeBird(name: "Вальдшнеп", birds: [Bird(name: "Вальдшнеп", pictureName: "Вальдшнеп", songName: "Вальдшнеп", isFavorite: false)]), TypeBird(name: "Воробей", birds: [Bird(name: "Воробей", pictureName: "Воробей", songName: "Воробей", isFavorite: false)]), TypeBird(name: "Ворона", birds: [Bird(name: "Ворона", pictureName: "Ворона", songName: "crow", isFavorite: false)]), TypeBird(name: "Вяхирь", birds: [Bird(name: "Вяхирь-1", pictureName: "Вяхирь-1", songName: "Вяхирь-1", isFavorite: false), Bird(name: "Вяхирь-2", pictureName: "Вяхирь-2", songName: "Вяхирь-2", isFavorite: false)]), TypeBird(name: "Глухарь", birds: [Bird(name: "Глухарь-1", pictureName: "Глухарь-1", songName: "Глухарь-1", isFavorite: false), Bird(name: "Глухарь-2", pictureName: "Глухарь-2", songName: "Глухарь-2", isFavorite: false), Bird(name: "Глухарь-3", pictureName: "Глухарь-3", songName: "Глухарь-3", isFavorite: false), Bird(name: "Глухарь ток", pictureName: "Глухарь ток", songName: "Глухарь ток", isFavorite: false)]), TypeBird(name: "Грач", birds: [Bird(name: "Грач-1", pictureName: "Грач-1", songName: "Грач-1", isFavorite: false)]), TypeBird(name: "Гусь", birds: [Bird(name: "Казарка", pictureName: "Казарка", songName: "Казарка", isFavorite: false), Bird(name: "Казарка-1", pictureName: "Казарка-1", songName: "Казарка-1", isFavorite: false), Bird(name: "Гуменной гусь", pictureName: "Гуменной гусь", songName: "Гуменной гусь", isFavorite: false), Bird(name: "Гуменной гусь-1", pictureName: "Гуменной гусь-1", songName: "Гуменной гусь-1", isFavorite: false), Bird(name: "Гуменной гусь-2", pictureName: "Гуменной гусь-2", songName: "Гуменной гусь-2", isFavorite: false), Bird(name: "Гусь серый-1", pictureName: "Гусь серый-1", songName: "Гусь серый-1", isFavorite: false), Bird(name: "Гусь серый-2", pictureName: "Гусь серый-2", songName: "Гусь серый-2", isFavorite: false),Bird(name: "Гусь серый-3", pictureName: "Гусь серый-3", songName: "Гусь серый-3", isFavorite: false), Bird(name: "Гусь белолобый-1", pictureName: "Гусь белолобый-1", songName: "Гусь белолобый-1", isFavorite: false), Bird(name: "Гусь белолобый-2", pictureName: "Гусь белолобый-2", songName: "Гусь белолобый-2", isFavorite: false),Bird(name: "Гусь белолобый-3", pictureName: "Гусь белолобый-3", songName: "Гусь белолобый-3", isFavorite: false)]), TypeBird(name: "Куропатка", birds: [Bird(name: "Куропатка белая", pictureName: "Куропатка белая", songName: "Куропатка белая", isFavorite: false), Bird(name: "Куропатка серая", pictureName: "Куропатка серая", songName: "Куропатка серая", isFavorite: false)])]
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        
        
    }
    
    // MARK: - UnwindSegue
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        
    }
    
    // MARK: - PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "isTypeBirdSegue" else { return }
        if let indexPath = collectionView.indexPathsForSelectedItems?.first {
            let birds = typeBirds[indexPath.item].birds
            //let navigationVC = segue.destination as! UINavigationController
            let birdsVC = segue.destination as! TypeBirdsTableViewController
            
            birdsVC.title = typeBirds[indexPath.item].name
            //navigationVC.navigationBar.prefersLargeTitles = true
            
            birdsVC.birds = birds
            
        }
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return typeBirds.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "decoyCell", for: indexPath) as! DecoyCell
        
        //cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let typeBird = typeBirds[indexPath.item]
        cell.imageBird.layer.cornerRadius = cell.imageBird.frame.height / 4
        cell.imageBird.clipsToBounds = true
        cell.set(object: typeBird)
        
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
