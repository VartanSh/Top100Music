//
//  NetworkService.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import Foundation

enum ErrorList: Error {
    case BadResponse
    case NoData
    case BadURL
    case NoConnection
}

class NetworkService {
    let session = URLSession(configuration: .default)
    let decoder = JSONDecoder()
    
    func fetchAlbums(_ completion: @escaping (Result<[Album], NSError>) -> Void) {
        guard let url = URL(string: API.iTunes.top100) else {
            completion(.failure(ErrorList.BadURL as NSError))
            return
        }
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                let err = error as NSError
                if (err.code == -1009) {
                    completion(.failure(ErrorList.NoConnection as NSError))
                } else {
                    completion(.failure(error as NSError))
                }
                return
            }
            guard let _ = response else {
                completion(.failure(ErrorList.BadResponse as NSError))
                return
            }
            guard let data = data else {
                completion(.failure(ErrorList.NoData as NSError))
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
            completion(.failure(ErrorList.BadURL as NSError))
            return
        }
        let task = session.dataTask(with: url) {(data, response, error) in
            if let error = error {
                let err = error as NSError
                if (err.code == -1009) {
                    completion(.failure(ErrorList.NoConnection as NSError))
                } else {
                    completion(.failure(error as NSError))
                }
                return
            }
            guard let _ = response else {
                completion(.failure(ErrorList.BadResponse as NSError))
                return
            }
            guard let data = data else {
                completion(.failure(ErrorList.NoData as NSError))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
