//
//  CollectionViewParsing.swift
//  MasterDemo
//
//  Created by Syon on 10/09/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher
import Alamofire

// ----------------------------------- //
// API response parameters
struct Data: Decodable {
    let name: String
    let description: String
    let courses: [Courses]
}

struct Courses: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numberOfLessons: Int
}

// ------------------------------------- //


class CollectionViewParsing: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataArr = [Courses]()
    var realmData = [DataBase]()
    var realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }

    func initialSetup() {
        let status = UserDefaults.standard.value(forKey: "Done") as? String
        if status == "Done" {
            fetchFromRealmDB()
        } else {
            almofireAPI()
        }
    }
    
    func fetchDataFromAPI() {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                if let err = err {
                    print(err)
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let data = try decoder.decode(Data.self, from: data)
                    self.dataArr = data.courses
                    self.collectionView.reloadData()
                    print(self.dataArr)
                } catch let jsonErr {
                    print("JSON error", jsonErr)
                }
            }
            }.resume()
    }

    func almofireAPI() {
        // URL
        let url = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let string: NSDictionary = json as! NSDictionary
                let courses = string["courses"] as? NSArray
                if let array = courses {
                    self.storeToRealmDB(jsonData: array)
                    self.fetchFromRealmDB()
                    UserDefaults.standard.set("Done", forKey: "Done")
                    self.collectionView.reloadData()
                }
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func storeToRealmDB(jsonData: NSArray) {
        var arr = [DataBase]()
        
        if jsonData.count > 0 {
            for i in 0..<jsonData.count {
                let database = DataBase()
                database.id = (jsonData[i] as AnyObject).value(forKey: "id") as! Int
                database.name = (jsonData[i] as AnyObject).value(forKey: "name") as! String
                database.link = (jsonData[i] as AnyObject).value(forKey: "link") as! String
                database.imageUrl = (jsonData[i] as AnyObject).value(forKey: "imageUrl") as! String
                database.lessons = (jsonData[i] as AnyObject).value(forKey: "number_of_lessons") as! Int
                arr.append(database)
            }
            try! self.realm.write {
                if (arr.count > 0) {
                    self.realm.add(arr, update: true)
                } else {
                    self.realm.add(arr)
                }
            }
        } else {
            print("not parse")
        }
    }
    
    func fetchFromRealmDB() {
        let list = realm.objects(DataBase.self)
        if list.count > 0 {
            for i in 0..<list.count {
                realmData.append(list[i])
            }
        }
    }
}


extension CollectionViewParsing: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.bgView.dropShadow(color: .gray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, cornerRadius: 12, scale: true)
        cell.name.text = realmData[indexPath.row].name
        cell.lblLink.text = realmData[indexPath.row].link
        let url = URL(string: realmData[indexPath.row].imageUrl)
        cell.imageView.kf.setImage(with: url)
        cell.LblNoOfLessons.text = String(realmData[indexPath.row].lessons)
        return cell
    }
}

extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, cornerRadius: CGFloat, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}


















