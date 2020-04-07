//
//  AlbumsTableViewCell.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
    
    let albumImageView: UIImageView
    let albumNameLabel: UILabel
    let artistNameLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        albumImageView = UIImageView()
        albumImageView.contentMode = .scaleToFill;
        albumNameLabel = UILabel(frame: .zero)
        albumNameLabel.numberOfLines = 2
        artistNameLabel = UILabel(frame: .zero)
        artistNameLabel.numberOfLines = 1
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let layoutGuide = self.contentView.safeAreaLayoutGuide
       
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(albumNameLabel)
        self.contentView.addSubview(artistNameLabel)
        
        //albumImageView constraint
        albumImageView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 10.0).isActive = true
        albumImageView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 10.0).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        //albumNameLabel constraint
        albumNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10.0).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        albumNameLabel.bottomAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: -10.0).isActive = true
        //artistNameLabel constraint
        artistNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10.0).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10.0).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("initWithCoder: inaccessible")
    }
}

