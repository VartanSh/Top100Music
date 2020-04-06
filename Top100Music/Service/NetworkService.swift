//
//  NetworkService.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import Foundation

enum errorList: Error {
    case BadResponse
    case NoData
    case BadURL
}

class NetworkService {
    let session = URLSession(configuration: .default)
    let decoder = JSONDecoder()
    
    func fetchAlbums(_ completion: @escaping (Result<[Album], NSError>) -> Void) {
        guard let url = URL(string: API.iTunes.top100) else {
            completion(.failure(errorList.BadURL as NSError))
            return
        }
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(error as NSError))
                return
            }
            guard let _ = response else {
                completion(.failure(errorList.BadResponse as NSError))
                return
            }
            guard let data = data else {
                completion(.failure(errorList.NoData as NSError))
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
            completion(.failure(errorList.BadURL as NSError))
            return
        }
        let task = session.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(.failure(error as NSError))
                return
            }
            guard let _ = response else {
                completion(.failure(errorList.BadResponse as NSError))
                return
            }
            guard let data = data else {
                completion(.failure(errorList.NoData as NSError))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
