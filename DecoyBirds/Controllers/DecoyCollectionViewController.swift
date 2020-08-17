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
    /*//let typeBirds = ["Бекас", "Вальдшнеп", "Воробей", "Ворона", "Вяхирь", "Глухарь", "Грач", "Гуменной гусь", "Гусь", "Куропатка"]
     //let birds = [Bird(name: String, pictureName: String, songName: String, isFavorite: true)]
     let snipe = TypeBird(name: "Бекас", birds: [Bird(name: "Бекас-1", pictureName: "Бекас-1", songName: "Бекас-1", isFavorite: false)])
     let woodcock = TypeBird(name: "Вальдшнеп", birds: [Bird(name: "Вальдшнеп", pictureName: "Вальдшнеп", songName: "Вальдшнеп", isFavorite: false)])
     let sparrow = TypeBird(name: "Воробей", birds: [Bird(name: "Воробей", pictureName: "Воробей", songName: "Воробей", isFavorite: false)])
     let crow = TypeBird(name: "Ворона", birds: [Bird(name: "Ворона", pictureName: "Ворона", songName: "Ворона", isFavorite: false)])
     let vyakhir = TypeBird(name: "Вяхирь", birds: [Bird(name: "Вяхирь-01", pictureName: "Вяхирь-01", songName: "Вяхирь-01", isFavorite: false), Bird(name: "Вяхирь-02", pictureName: "Вяхирь-02", songName: "Вяхирь-02", isFavorite: false)])
     let capercaillie = TypeBird(name: "Глухарь", birds: [Bird(name: "Глухарь-01", pictureName: "Глухарь-01", songName: "Глухарь-01", isFavorite: false), Bird(name: "Глухарь-02", pictureName: "Глухарь-02", songName: "Глухарь-02", isFavorite: false), Bird(name: "Глухарь-03", pictureName: "Глухарь-03", songName: "Глухарь-03", isFavorite: false), Bird(name: "Глухарь ток", pictureName: "Глухарь ток", songName: "Глухарь ток", isFavorite: false)])
     let rook = TypeBird(name: "Грач", birds: [Bird(name: "Грач-01", pictureName: "Грач-01", songName: "Грач-01", isFavorite: false)])
     let geese = TypeBird(name: "Гуси", birds: [Bird(name: "Казарка", pictureName: "Казарка", songName: "Казарка", isFavorite: false), Bird(name: "Казарка-01", pictureName: "Казарка-01", songName: "Казарка-01", isFavorite: false), Bird(name: "Гуменной гусь", pictureName: "Гуменной гусь", songName: "Гуменной гусь", isFavorite: false), Bird(name: "Гуменной гусь-01", pictureName: "Гуменной гусь-01", songName: "Гуменной гусь-01", isFavorite: false), Bird(name: "Гуменной гусь-02", pictureName: "Гуменной гусь-02", songName: "Гуменной гусь-02", isFavorite: false), Bird(name: "Гусь серый-01", pictureName: "Гусь серый-01", songName: "Гусь серый-01", isFavorite: false), Bird(name: "Гусь серый-02", pictureName: "Гусь серый-02", songName: "Гусь серый-02", isFavorite: false),Bird(name: "Гусь серый-03", pictureName: "Гусь серый-03", songName: "Гусь серый-03", isFavorite: false), Bird(name: "Гусь белолобый-01", pictureName: "Гусь белолобый-01", songName: "Гусь белолобый-01", isFavorite: false), Bird(name: "Гусь белолобый-02", pictureName: "Гусь белолобый-02", songName: "Гусь белолобый-02", isFavorite: false),Bird(name: "Гусь белолобый-03", pictureName: "Гусь белолобый-03", songName: "Гусь белолобый-03", isFavorite: false)])
     let partridge = TypeBird(name: "Куропатка", birds: [Bird(name: "Куропатка белая", pictureName: "Куропатка белая", songName: "Куропатка белая", isFavorite: false), Bird(name: "Куропатка серая", pictureName: "Куропатка серая", songName: "Куропатка серая", isFavorite: false)]) */
    
    private let typeBirds = [TypeBird(name: "Бекас", birds: [Bird(name: "Бекас-1", pictureName: "Бекас-1", songName: "Бекас-1", isFavorite: false)]), TypeBird(name: "Вальдшнеп", birds: [Bird(name: "Вальдшнеп", pictureName: "Вальдшнеп", songName: "Вальдшнеп", isFavorite: false)]), TypeBird(name: "Воробей", birds: [Bird(name: "Воробей", pictureName: "Воробей", songName: "Воробей", isFavorite: false)]), TypeBird(name: "Ворона", birds: [Bird(name: "Ворона", pictureName: "Ворона", songName: "Ворона", isFavorite: false)]), TypeBird(name: "Вяхирь", birds: [Bird(name: "Вяхирь-1", pictureName: "Вяхирь-1", songName: "Вяхирь-1", isFavorite: false), Bird(name: "Вяхирь-2", pictureName: "Вяхирь-2", songName: "Вяхирь-2", isFavorite: false)]), TypeBird(name: "Глухарь", birds: [Bird(name: "Глухарь-1", pictureName: "Глухарь-1", songName: "Глухарь-1", isFavorite: false), Bird(name: "Глухарь-2", pictureName: "Глухарь-2", songName: "Глухарь-2", isFavorite: false), Bird(name: "Глухарь-3", pictureName: "Глухарь-3", songName: "Глухарь-3", isFavorite: false), Bird(name: "Глухарь ток", pictureName: "Глухарь ток", songName: "Глухарь ток", isFavorite: false)]), TypeBird(name: "Грач", birds: [Bird(name: "Грач-1", pictureName: "Грач-1", songName: "Грач-1", isFavorite: false)]), TypeBird(name: "Гусь", birds: [Bird(name: "Казарка", pictureName: "Казарка", songName: "Казарка", isFavorite: false), Bird(name: "Казарка-1", pictureName: "Казарка-1", songName: "Казарка-1", isFavorite: false), Bird(name: "Гуменной гусь", pictureName: "Гуменной гусь", songName: "Гуменной гусь", isFavorite: false), Bird(name: "Гуменной гусь-1", pictureName: "Гуменной гусь-1", songName: "Гуменной гусь-1", isFavorite: false), Bird(name: "Гуменной гусь-2", pictureName: "Гуменной гусь-2", songName: "Гуменной гусь-2", isFavorite: false), Bird(name: "Гусь серый-1", pictureName: "Гусь серый-1", songName: "Гусь серый-1", isFavorite: false), Bird(name: "Гусь серый-2", pictureName: "Гусь серый-2", songName: "Гусь серый-2", isFavorite: false),Bird(name: "Гусь серый-3", pictureName: "Гусь серый-3", songName: "Гусь серый-3", isFavorite: false), Bird(name: "Гусь белолобый-1", pictureName: "Гусь белолобый-1", songName: "Гусь белолобый-1", isFavorite: false), Bird(name: "Гусь белолобый-2", pictureName: "Гусь белолобый-2", songName: "Гусь белолобый-2", isFavorite: false),Bird(name: "Гусь белолобый-3", pictureName: "Гусь белолобый-3", songName: "Гусь белолобый-3", isFavorite: false)]), TypeBird(name: "Куропатка", birds: [Bird(name: "Куропатка белая", pictureName: "Куропатка белая", songName: "Куропатка белая", isFavorite: false), Bird(name: "Куропатка серая", pictureName: "Куропатка серая", songName: "Куропатка серая", isFavorite: false)])]
    
    
    
    
    
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
            let navigationVC = segue.destination as! UINavigationController
            let birdsVC = navigationVC.topViewController as! TypeBirdsTableViewController
            
            birdsVC.title = typeBirds[indexPath.item].name
            navigationVC.navigationBar.prefersLargeTitles = true
            
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
