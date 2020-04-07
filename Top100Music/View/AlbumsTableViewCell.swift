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
        self.albumImageView = UIImageView()
        self.albumImageView.contentMode = .scaleToFill;
        self.albumNameLabel = UILabel(frame: .zero)
        self.albumNameLabel.numberOfLines = 2
        self.artistNameLabel = UILabel(frame: .zero)
        self.artistNameLabel.numberOfLines = 1
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.albumImageView.translatesAutoresizingMaskIntoConstraints = false
        self.albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let layoutGuide = self.contentView.safeAreaLayoutGuide
       
        self.contentView.addSubview(self.albumImageView)
        self.contentView.addSubview(self.albumNameLabel)
        self.contentView.addSubview(self.artistNameLabel)
        
        //albumImageView constraint
        self.albumImageView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 10.0).isActive = true
        self.albumImageView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 10.0).isActive = true
        self.albumImageView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        self.albumImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        //albumNameLabel constraint
        self.albumNameLabel.leadingAnchor.constraint(equalTo: self.albumImageView.trailingAnchor, constant: 10.0).isActive = true
        self.albumNameLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        self.albumNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        self.albumNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.artistNameLabel.topAnchor).isActive = true
        //artistNameLabel constraint
        self.artistNameLabel.leadingAnchor.constraint(equalTo: self.albumImageView.trailingAnchor, constant: 10.0).isActive = true
        self.artistNameLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        self.artistNameLabel.topAnchor.constraint(greaterThanOrEqualTo: self.albumNameLabel.bottomAnchor, constant: 5.0).isActive = true
        self.artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("initWithCoder: inaccessible")
    }
}

