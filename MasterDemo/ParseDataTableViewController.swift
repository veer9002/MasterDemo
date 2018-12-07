//
//  ParseDataTableViewController.swift
//  MasterDemo
//
//  Created by Syon on 07/09/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
//    let imageURl: String
    let numberOfLessons: Int
}

// image_url
// number_of_lessons

class ParseDataTableViewController: UITableViewController {
    
    var courses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJson()
    }
    
    func fetchJson() {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_snake_case"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.courses = try decoder.decode([Course].self, from: data)
                    self.tableView.reloadData()
                } catch let jsonErr  {
                    print("faield to decode", jsonErr)
                }
            }
        }.resume()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let course = courses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = String(course.numberOfLessons)
        return cell
    }
}
