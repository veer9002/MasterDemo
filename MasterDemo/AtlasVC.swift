//
//  AtlasVC.swift
//  MasterDemo
//
//  Created by Syon on 05/09/18.
//  Copyright © 2018 Syon. All rights reserved.
//

import UIKit
import Atlas
import MessageKit

class AtlasVC: ATLConversationViewController {

    let message = MessageInputBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        message.sendButton.titleLabel?.text = "OK"
    
        var viewController = ATLConversationViewController(layerClient: layerClient) as? ATLConverationViewController
        
        ATLOutgoingMessageCollectionViewCell.appearance().messageTextColor = UIColor.white
        ATLOutgoingMessageCollectionViewCell.appearance().messageTextFont = UIFont.systemFont(ofSize: 14)
        ATLOutgoingMessageCollectionViewCell.appearance().bubbleViewColor = UIColor.blue
        
        let a = ATLMessageInputToolbar()
        
        a.rightAccessoryButton.titleLabel?.text = "Send Now"
    }

}


class ATLConverationViewController: UICollectionViewController {
    
}
