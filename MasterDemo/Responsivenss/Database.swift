//
//  Database.swift
//  MasterDemo
//
//  Created by Syon on 11/09/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import Foundation
import RealmSwift

class DataBase: Object, Decodable {
    @objc dynamic var id = Int()
    @objc dynamic var name = ""
    @objc dynamic var link = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var lessons = Int()

    override static func primaryKey() -> String? {
        return "id"
    }
}
