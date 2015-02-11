//
//  FirebaseHelper.swift
//  HNReader
//
//  Created by Boris on 04.02.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

import Foundation
import UIKit

protocol FirebaseHelperDelegate {
    func onRecieveData(story: Story)
}

class FirebaseHelper {
    
    let root = Firebase(url: "https://hacker-news.firebaseio.com/v0/")
    
    var delegate: FirebaseHelperDelegate?
    
    init() {}
    
    func loadTopStories() {
        let newRoot = root.childByAppendingPath("topstories")
        newRoot.queryLimitedToFirst(20).observeSingleEventOfType(FEventType.Value, withBlock: { [unowned self] (snapshot: FDataSnapshot!) in
            let data = snapshot.value as [Int]
            self.mapTopStories(data)
        })
    }
    
    private func mapTopStories(data: [Int]) {
        data.map(transformToStory)
    }
    
    private func transformToStory(id: Int) {
        let newRoot = root.childByAppendingPath("item/\(id)")
        newRoot.observeSingleEventOfType(FEventType.Value, withBlock: { (snapshot: FDataSnapshot!) in
            let json = JSON(snapshot.value)
            println(json)
            let story = Story.mapFromJson(json)
            self.delegate?.onRecieveData(story)
        })

    }
    
}
