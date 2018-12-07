//
//  SizeClassesViewController.swift
//  MasterDemo
//
//  Created by Syon on 12/09/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit

class SizeClassesViewController: UIViewController {

    @IBOutlet weak var collectionView: UIView!
    var data = [1,2,3,4,5,6,7,8,9,11,23,4,5,6,78,99]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SizeClassesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let bgView = cell.viewWithTag(1) {
            bgView.backgroundColor = .gray
        }
        
        if let label = cell.viewWithTag(2) as? UILabel {
            label.text = String(data[indexPath.row])
        }
        return cell
    }
}
