//
//  Mapper.swift
//  HNReader
//
//  Created by Boris on 06.03.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

protocol Mapper {
    typealias FROM
    typealias TO
    
    func map(from: FROM) -> TO
}
