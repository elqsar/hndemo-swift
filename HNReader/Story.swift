//
//  Story.swift
//  HNReader
//
//  Created by Boris on 04.02.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

import Foundation

class Story: NSObject {
    var id: Int?
    var deleted: Bool?
    var type: String? // story, comment, poll
    var by: String?
    var time: Int?
    var text: String?
    var dead: Bool?
    var parent: Story?
    var kids: [Int]?
    var url: String?
    var score: Int?
    var title: String?
}


