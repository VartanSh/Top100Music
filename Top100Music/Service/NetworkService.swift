//
//  NetworkService.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import Foundation

class NetworkService {
    let session = URLSession(configuration: .default)
    let decoder = JSONDecoder()
    
    func fetchAlbums(_ completion: @escaping (Result<[Album], NSError>) -> Void) {
        guard let url = URL(string: API.iTunes.top100) else {
            // TODO: - some error here, or better: write this differently
            return
        }
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(error as NSError)); return
            }
            if let response = response {
                // do something here if it's not 200..<400
            }
            guard let data = data else {
                // something about no data here
                return
            }
            do {
                if let feed = try self?.decoder.decode(AlbumFeed.self, from: data) {
                   completion(.success(feed.feed.results))
                }
            } catch {
                completion(.failure(error as NSError))
            }
        }
        task.resume()
    }
    
    func fetchAlbumImage(_ urlString : String,_ completion: @escaping (Result<Data, NSError>) -> Void) {
        guard let url = URL(string: urlString) else {
            // TODO: - some error here, or better: write this differently
            return
        }
        let task = session.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(.failure(error as NSError)); return
            }
            if let response = response {
                // do something here if it's not 200..<400
            }
            guard let data = data else {
                // something about no data here
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
