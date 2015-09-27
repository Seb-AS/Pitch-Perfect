//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Sebas on 9/26/15.
//  Copyright © 2015 Sebas. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    
    var filePathUrl: NSURL!
    var title: String!
    
    init (filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}