//
//  AlmofireTV.swift
//  MasterDemo
//
//  Created by Syon on 29/08/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit
import Alamofire

class AlmofireTV: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        almofireDemo()
    }
    
    func almofireDemo() {
        
        let url = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
}
