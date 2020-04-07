//
//  AlbumsViewController.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    enum Constants {
        static let cellReuseId = "AlbumsTableViewCell"
    }
    
    private let queue: DispatchQueue = .main

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumsTableViewCell.self,
                           forCellReuseIdentifier: Constants.cellReuseId)
        return tableView
    }()
    
    let viewModel = MusicViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupUI()
        viewModel.bind {
            DispatchQueue.main.async() {
                self.tableView.reloadData()
            }
        }
        viewModel.fetchAlbums(){ [weak self] err in
            guard let err = err else {
                return
            }
            self?.alert(err: err as? ErrorList)
        }
    }
    
    func setupUI() {
        self.navigationItem.title = "Top 100 iTunes Albums"
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func alert(err:ErrorList?) {
        var alertString = ""
        guard let err = err else {
            return
        }
        
        switch err {
        case .BadResponse:
            alertString = "Response is not valid"
        case .BadURL:
            alertString = "URL is not valid"
        case .NoData:
            alertString = "Data does not exist"
        case .NoConnection:
            alertString = "No internet connection"
        }
        DispatchQueue.main.async() {
            let alert = UIAlertController(title: "error", message: alertString, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseId, for: indexPath) as? AlbumsTableViewCell else {
            fatalError("Could not dequeue cell, please register first")
        }
        cell.albumImageView.image = nil
        cell.albumNameLabel.text = viewModel.albumName(for: indexPath.row)
        cell.artistNameLabel.text = viewModel.artistName(for: indexPath.row)
        viewModel.fetchImage(urlString: viewModel.thumbnailUrl(for: indexPath.row)) { (result)  in
            DispatchQueue.main.async() {
                if let data = result {
                    cell.albumImageView.image = UIImage(data:data,scale:1.0)
                } else {
                    cell.albumImageView.image = UIImage(named: "No_Image")
                }
            }
        }
        cell.backgroundColor = .white
        return cell
    }
}

extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AlbumsTableViewCell
        var albumInfo: AlbumInfoViewModle
        if let image =  cell.albumImageView.image {
            albumInfo = AlbumInfoViewModle(album: viewModel.album(for: indexPath.row),image: image)
        } else {
            albumInfo = AlbumInfoViewModle(album: viewModel.album(for: indexPath.row),image: UIImage(named: "No_Image"))
        }
        let infoVC = AlbumInfoViewController()
        infoVC.setAlbumInfo(albumInfo: albumInfo)
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
