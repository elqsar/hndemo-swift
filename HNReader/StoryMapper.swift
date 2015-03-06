//
//  StoryMapper.swift
//  HNReader
//
//  Created by Boris on 06.03.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

class StoryMapper: Mapper {
    func map(json: JSON) -> Story {
        var story = Story()
        story.id = json["id"].intValue
        story.by = json["by"].stringValue
        story.score = json["score"].intValue
        story.title = json["title"].stringValue
        story.url = json["url"].stringValue
        story.kids = json["kids"].arrayObject as? [Int]
        story.type = json["type"].stringValue
        return story
    }
}
