//
//  Album.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import Foundation
import UIKit

struct AlbumFeed: Decodable {
    let feed: FeedInfo
}

struct FeedInfo: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let name: String
    let artistName: String
    let thumbnailUrl: String
    let genres: [Genre]
    let releaseDate: String
    let copyright: String
    let iTunesWebPageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name, artistName, releaseDate, genres, copyright
        case thumbnailUrl = "artworkUrl100"
        case iTunesWebPageURL = "url"
    }
}

struct Genre: Decodable {
    let name: String
}

