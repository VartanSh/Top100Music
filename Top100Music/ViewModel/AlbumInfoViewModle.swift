//
//  AlbumInfoViewModle.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import Foundation
import UIKit

struct AlbumInfoViewModle {
    let name: String
    let artistName: String
    let albumImage: UIImage?
    let genres: String
    let releaseDate: String
    let copyright: String
    let iTunesWebPageUrl: String
   
    init() {
        name = ""
        artistName = ""
        albumImage = nil
        genres = ""
        releaseDate = ""
        copyright = ""
        iTunesWebPageUrl = ""
    }
    
    init(album:Album, image:UIImage?) {
        name = album.name
        artistName = album.artistName
        albumImage = image
        genres = album.genres.map({$0.name}).joined(separator: ", ")
        releaseDate = album.releaseDate
        copyright = album.copyright
        iTunesWebPageUrl = album.iTunesWebPageURL
    }
}
