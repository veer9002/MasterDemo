//              _______                         __
//      /\         |      |          /\       ,'  `,
//     /  \        |      |         /  \      |
//    /    \       |      |        /    \      '--,
//   /------\      |      |       /------\         |
//  /        \     |      |___   /        \   ',__,'
//
//  Atlas.h
//
//  Created by Kevin Coleman on 10/27/14.
//  Copyright (c) 2015 Layer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>

///------------------
/// @name Controllers
///------------------

#import "ATLAddressBarViewController.h"
#import "ATLBaseConversationViewController.h"
#import "ATLConversationListViewController.h"
#import "ATLConversationViewController.h"
#import "ATLMessageInputToolbar.h"
#import "ATLParticipantTableViewController.h"
#import "ATLTypingIndicatorViewController.h"

///-------------
/// @name Models
///-------------

#import "ATLConversationDataSource.h"
#import "ATLDataSourceChange.h"
#import "ATLMediaAttachment.h"
#import "ATLParticipantTableDataSet.h"

///----------------
/// @name Protocols
///----------------

#import "ATLAvatarItem.h"
#import "ATLConversationPresenting.h"
#import "ATLMessagePresenting.h"
#import "ATLParticipant.h"
#import "ATLParticipantPresenting.h"

///----------------
/// @name Utilities
///----------------

#import "ATLConstants.h"
#import "ATLErrors.h"
#import "ATLLocationManager.h"
#import "ATLMessagingUtilities.h"
#import "ATLMediaInputStream.h"

///------------
/// @name Views
///------------

#import "ATLAddressBarContainerView.h"
#import "ATLAddressBarView.h"
#import "ATLAvatarView.h"
#import "ATLConversationCollectionView.h"
#import "ATLConversationCollectionViewFooter.h"
#import "ATLConversationCollectionViewHeader.h"
#import "ATLConversationCollectionViewMoreMessagesHeader.h"
#import "ATLConversationTableViewCell.h"
#import "ATLConversationView.h"
#import "ATLIncomingMessageCollectionViewCell.h"
#import "ATLMessageBubbleView.h"
#import "ATLMessageCollectionViewCell.h"
#import "ATLMessageComposeTextView.h"
#import "ATLOutgoingMessageCollectionViewCell.h"
#import "ATLParticipantSectionHeaderView.h"
#import "ATLParticipantTableViewCell.h"
#import "ATLPlayView.h"
#import "ATLPresenceStatusView.h"
#import "ATLProgressView.h"
#import "ATLUIImageHelper.h"

///-----------------
/// @name Categories
///-----------------

#import "LYRIdentity+ATLParticipant.h"
#import "UIResponder+ATLFirstResponder.h"

/**
 @abstract Returns the Atlas version as a string.
 */
extern NSString *const ATLVersionString;

