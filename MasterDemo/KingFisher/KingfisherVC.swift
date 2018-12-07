//
//  KingfisherVC.swift
//  MasterDemo
//
//  Created by Syon on 27/09/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit
import Kingfisher

struct ImageData {
    static let arrayImgs = [
        "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
        "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
        "https://homepages.cae.wisc.edu/~ece533/images/baboon.png",
        "https://homepages.cae.wisc.edu/~ece533/images/barbara.png",
        "https://homepages.cae.wisc.edu/~ece533/images/boat.png",
        "https://homepages.cae.wisc.edu/~ece533/images/cat.png",
        "https://homepages.cae.wisc.edu/~ece533/images/fruits.png",
        "https://homepages.cae.wisc.edu/~ece533/images/frymire.png"
    ]
    
    static let titleArray = ["Title 1","Title 2","Title 3","Title 434325ddfgfdgfgTitle 434325ddfgfdgfgTitle 434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg434325ddfgfdgfgTitle 434325ddfgfdgfg","Title 5","Title 6","Title 7","Title 8"]
}

class KingfisherVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 182
    }
}


extension KingfisherVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImageData.arrayImgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageCell
        let url = ImageData.arrayImgs[indexPath.row]
        let resource = ImageResource(downloadURL: URL(string: url)!, cacheKey: ImageData.arrayImgs[indexPath.row])
        cell.imgFromUrl.kf.setImage(with: resource)
        cell.lblTitle.text = ImageData.titleArray[indexPath.row]
        return cell
    }
}
