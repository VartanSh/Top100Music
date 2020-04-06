//
//  MusicViewModel.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import Foundation
import UIKit

class MusicViewModel {
    private var albums: [Album] = [] {
        didSet {
            queue.async { self.updateHandler?() }
        }
    }
    private let service = NetworkService()
    private let queue: DispatchQueue = .main
    private var updateHandler: (() -> Void)?
}

extension MusicViewModel {
    var count: Int { return albums.count }
    
    func albumName(for index: Int) -> String {
        return albums[index].name
    }
    
    func album(for index: Int) -> Album {
        return albums[index]
    }
    
    func artistName(for index: Int) -> String {
        return albums[index].artistName
    }
    
    func thumbnailUrl(for index: Int) -> String {
        return albums[index].thumbnailUrl
    }
    
    func iTunesWebPageUrl(for index: Int) -> String {
        return albums[index].iTunesWebPageURL
    }
    
    func albumiGeners(for index: Int) -> [Genre] {
        return albums[index].genres
    }
    
    func bind(_ updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    func unbind() {
        self.updateHandler = nil
    }
    
    func fetchAlbums(_ completion: @escaping (NSError?) -> Void)  {
        service.fetchAlbums { (result) in
            switch result {
                case .success(let albums):
                    self.albums = albums
                    completion(nil)
                case .failure(let err):
                    self.albums = []
                    completion(err)
                    print(err)
            }
        }
    }
    
    func fetchImage(urlString: String, _ completion: @escaping (Data?) -> Void) {
        service.fetchAlbumImage(urlString) { (result) in
            switch result {
                case .success(let imageData):
                    completion(imageData)
                case .failure(let err):
                    completion(nil)
                    print(err)
            }
        }
    }
}
