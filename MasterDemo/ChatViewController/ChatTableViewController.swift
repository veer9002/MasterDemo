//
//  ChatTableViewController.swift
//  MasterDemo
//
//  Created by Syon on 29/08/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit

struct ChatMessage {
    let message: String
    let isIncoming: Bool
}

class ChatTableViewController: UITableViewController {

    fileprivate let cellID = "Cell"
    let chatMessage = [
        ChatMessage(message: "This is the sample chat data.", isIncoming: true),
        ChatMessage(message: "This is another chat to show in our chat UI.This is another chat to show in our chat UI.This is another chat to show in our chat UI.This is another chat to show in our chat UI", isIncoming: true),
        ChatMessage(message: "Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.Got third row data no.", isIncoming: true),
        ChatMessage(message: "This is the sample chat data.", isIncoming: true),
        ChatMessage(message: "This is the sample chat data.", isIncoming: false),
        ChatMessage(message: "Oh! Good news.", isIncoming: false)
    ]
    
    var messageInputContainerView: UIView {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Chat UI"
        tableView.register(ChatCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.93, alpha: 1)
        
//        tableView.addSubview(messageInputContainerView)
        
        view.addSubview(messageInputContainerView)
//
//        view.addConstraintsWithFormat("H:|[v0]|", views: messageInputContainerView)
//        view.addConstraintsWithFormat("V:[v0(48)]", views: messageInputContainerView)
//
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessage.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatCell
        let chatMess = chatMessage[indexPath.row]
        
        cell.chatMessage = chatMess
    
        return cell
    }
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
