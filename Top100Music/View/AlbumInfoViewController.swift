//
//  AlbumInfoViewController.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import UIKit

class AlbumInfoViewController: UIViewController {
    var albumImageView: UIImageView
    var albumNameLabel: UILabel
    var artistNameLabel: UILabel
    var albumGenerLabel: UILabel
    var albumReleaseDateLabel: UILabel
    var albumCopyrightLabel: UILabel
    var viewWebPageButton: UIButton
    var albumInfo : AlbumInfoViewModle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        albumImageView = UIImageView()
        albumImageView.backgroundColor = .black
        albumImageView.contentMode = .scaleToFill;
        
        albumNameLabel = UILabel()
        albumNameLabel.backgroundColor = .lightText
        albumNameLabel.numberOfLines = 3
        
        artistNameLabel = UILabel()
        artistNameLabel.backgroundColor = .lightText
        artistNameLabel.numberOfLines = 1
        
        albumGenerLabel = UILabel()
        albumGenerLabel.backgroundColor = .lightText
        albumGenerLabel.numberOfLines = 1
        
        albumReleaseDateLabel = UILabel()
        albumReleaseDateLabel.backgroundColor = .lightText
        albumReleaseDateLabel.numberOfLines = 1
        
        albumCopyrightLabel = UILabel()
        albumCopyrightLabel.backgroundColor = .lightText
        albumCopyrightLabel.numberOfLines = 3
        
        viewWebPageButton = UIButton()
        viewWebPageButton.backgroundColor = .systemBlue
        viewWebPageButton.setTitle("Album iTunes Web Page", for: .normal)
        
        albumInfo = AlbumInfoViewModle()
        //scrollView = UIScrollView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initUI()
    }
    
    func setAlbumInfo(albumInfo:AlbumInfoViewModle){
        self.albumInfo = albumInfo
    }
    
    func initUI() {
        albumImageView.image = albumInfo.albumImage
        albumNameLabel.text = albumInfo.name
        artistNameLabel.text = albumInfo.artistName
        albumGenerLabel.text = albumInfo.genres
        albumReleaseDateLabel.text = albumInfo.releaseDate
        albumCopyrightLabel.text = albumInfo.copyright
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Album Information"
        self.albumImageView.translatesAutoresizingMaskIntoConstraints = false
        self.albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.albumGenerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.albumReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.albumCopyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewWebPageButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(albumImageView)
        self.view.addSubview(albumNameLabel)
        self.view.addSubview(artistNameLabel)
        self.view.addSubview(albumGenerLabel)
        self.view.addSubview(albumReleaseDateLabel)
        self.view.addSubview(albumCopyrightLabel)

        self.view.addSubview(viewWebPageButton)
        let horizontalSpace = CGFloat(10.0)
        let verticalSpace = CGFloat(10.0)
        let lableHeight = CGFloat(30.0)

        let viewLayoutGuide = self.view.safeAreaLayoutGuide
        
        //Image
        albumImageView.centerXAnchor.constraint(equalTo: viewLayoutGuide.centerXAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: viewLayoutGuide.topAnchor, constant: horizontalSpace).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 250.0).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 250.0).isActive = true

        //Album Name
        albumNameLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: horizontalSpace).isActive = true
        albumNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: artistNameLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Artist Name
        artistNameLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: verticalSpace).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: albumGenerLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Album Gener
        albumGenerLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        albumGenerLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        albumGenerLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: verticalSpace).isActive = true
        albumGenerLabel.bottomAnchor.constraint(equalTo: albumReleaseDateLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Release Date
        albumReleaseDateLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        albumReleaseDateLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        albumReleaseDateLabel.topAnchor.constraint(equalTo: albumGenerLabel.bottomAnchor, constant: verticalSpace).isActive = true
        albumReleaseDateLabel.bottomAnchor.constraint(equalTo: albumCopyrightLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Album Copyright
        albumCopyrightLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        albumCopyrightLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        albumCopyrightLabel.topAnchor.constraint(equalTo: albumReleaseDateLabel.bottomAnchor, constant: verticalSpace).isActive = true
        albumCopyrightLabel.bottomAnchor.constraint(lessThanOrEqualTo: viewWebPageButton.topAnchor, constant: -verticalSpace).isActive = true
        
        //vieWebPageButton
        viewWebPageButton.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: 20).isActive = true
        viewWebPageButton.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -20).isActive = true
        viewWebPageButton.topAnchor.constraint(greaterThanOrEqualTo: albumCopyrightLabel.bottomAnchor).isActive = true
        viewWebPageButton.bottomAnchor.constraint(equalTo: viewLayoutGuide.bottomAnchor, constant: -20).isActive = true
        viewWebPageButton.heightAnchor.constraint(equalToConstant: lableHeight).isActive = true
        viewWebPageButton.addTarget(self, action: #selector(loadWebViewControler), for: .touchUpInside)
    }
    
    @IBAction func loadWebViewControler(){
        let webVC = WebViewController()
        webVC.setURL(urlString: albumInfo.iTunesWebPageUrl)
        navigationController?.pushViewController(webVC, animated: true)
    }
}

