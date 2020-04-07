//
//  AlbumInfoViewController.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import UIKit

class AlbumInfoViewController: UIViewController {
    ///UI elements
    private var albumImageView: UIImageView
    private var albumNameLabel: UILabel
    private var artistNameLabel: UILabel
    private var albumGenerLabel: UILabel
    private var albumReleaseDateLabel: UILabel
    private var albumCopyrightLabel: UILabel
    private var viewWebPageButton: UIButton
    ///variable which holds the album information
    private var albumInfo : AlbumInfoViewModle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        self.albumImageView = UIImageView()
        self.albumImageView.backgroundColor = .black
        self.albumImageView.contentMode = .scaleToFill;
        
        self.albumNameLabel = UILabel()
        self.albumNameLabel.backgroundColor = .lightText
        self.albumNameLabel.numberOfLines = 3
        
        self.artistNameLabel = UILabel()
        self.artistNameLabel.backgroundColor = .lightText
        self.artistNameLabel.numberOfLines = 1
        
        self.albumGenerLabel = UILabel()
        self.albumGenerLabel.backgroundColor = .lightText
        self.albumGenerLabel.numberOfLines = 2
        
        self.albumReleaseDateLabel = UILabel()
        self.albumReleaseDateLabel.backgroundColor = .lightText
        self.albumReleaseDateLabel.numberOfLines = 1
        
        self.albumCopyrightLabel = UILabel()
        self.albumCopyrightLabel.backgroundColor = .lightText
        self.albumCopyrightLabel.numberOfLines = 3
        
        self.viewWebPageButton = UIButton()
        self.viewWebPageButton.backgroundColor = .systemBlue
        self.viewWebPageButton.setTitle("Album iTunes Web Page", for: .normal)
        
        self.albumInfo = AlbumInfoViewModle()
        
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
    ///set the albumInfo variable value
    func setAlbumInfo(albumInfo:AlbumInfoViewModle){
        self.albumInfo = albumInfo
    }
    ///set the UI element/s with data
    private func initUI() {
        self.albumImageView.image = self.albumInfo.albumImage
        self.albumNameLabel.text = self.albumInfo.name
        self.artistNameLabel.text = self.albumInfo.artistName
        self.albumGenerLabel.text = self.albumInfo.genres
        self.albumReleaseDateLabel.text = self.albumInfo.releaseDate
        self.albumCopyrightLabel.text = self.albumInfo.copyright
    }
    ///setup the UI layou constraints, navigation title, add sub view/s
    private func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Album Information"
        self.albumImageView.translatesAutoresizingMaskIntoConstraints = false
        self.albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.albumGenerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.albumReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.albumCopyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewWebPageButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.albumImageView)
        self.view.addSubview(self.albumNameLabel)
        self.view.addSubview(self.artistNameLabel)
        self.view.addSubview(self.albumGenerLabel)
        self.view.addSubview(self.albumReleaseDateLabel)
        self.view.addSubview(self.albumCopyrightLabel)

        self.view.addSubview(viewWebPageButton)
        let horizontalSpace = CGFloat(10.0)
        let verticalSpace = CGFloat(10.0)
        let lableHeight = CGFloat(30.0)

        let viewLayoutGuide = self.view.safeAreaLayoutGuide
        
        //Image
        self.albumImageView.centerXAnchor.constraint(equalTo: viewLayoutGuide.centerXAnchor).isActive = true
        self.albumImageView.topAnchor.constraint(equalTo: viewLayoutGuide.topAnchor, constant: horizontalSpace).isActive = true
        self.albumImageView.heightAnchor.constraint(equalToConstant: 250.0).isActive = true
        self.albumImageView.widthAnchor.constraint(equalToConstant: 250.0).isActive = true

        //Album Name
        self.albumNameLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        self.albumNameLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        self.albumNameLabel.topAnchor.constraint(equalTo: self.albumImageView.bottomAnchor, constant: horizontalSpace).isActive = true
        self.albumNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.artistNameLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Artist Name
        self.artistNameLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        self.artistNameLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        self.artistNameLabel.topAnchor.constraint(equalTo: self.albumNameLabel.bottomAnchor, constant: verticalSpace).isActive = true
        self.artistNameLabel.bottomAnchor.constraint(equalTo: self.albumGenerLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Album Gener
        self.albumGenerLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        self.albumGenerLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        self.albumGenerLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: verticalSpace).isActive = true
        self.albumGenerLabel.bottomAnchor.constraint(equalTo: self.albumReleaseDateLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Release Date
        self.albumReleaseDateLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        self.albumReleaseDateLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        self.albumReleaseDateLabel.topAnchor.constraint(equalTo: self.albumGenerLabel.bottomAnchor, constant: verticalSpace).isActive = true
        self.albumReleaseDateLabel.bottomAnchor.constraint(equalTo: self.albumCopyrightLabel.topAnchor, constant: -verticalSpace).isActive = true

        //Album Copyright
        self.albumCopyrightLabel.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: horizontalSpace).isActive = true
        self.albumCopyrightLabel.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -horizontalSpace).isActive = true
        self.albumCopyrightLabel.topAnchor.constraint(equalTo: albumReleaseDateLabel.bottomAnchor, constant: verticalSpace).isActive = true
        self.albumCopyrightLabel.bottomAnchor.constraint(lessThanOrEqualTo: viewWebPageButton.topAnchor, constant: -verticalSpace).isActive = true
        
        //vieWebPageButton
        self.viewWebPageButton.leadingAnchor.constraint(equalTo: viewLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.viewWebPageButton.trailingAnchor.constraint(equalTo: viewLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.viewWebPageButton.topAnchor.constraint(greaterThanOrEqualTo: self.albumCopyrightLabel.bottomAnchor).isActive = true
        self.viewWebPageButton.bottomAnchor.constraint(equalTo: viewLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.viewWebPageButton.heightAnchor.constraint(equalToConstant: lableHeight).isActive = true
        self.viewWebPageButton.addTarget(self, action: #selector(loadWebViewControler), for: .touchUpInside)
    }
    
    @IBAction func loadWebViewControler(){
        let webVC = WebViewController()
        webVC.setURL(urlString: albumInfo.iTunesWebPageUrl)
        navigationController?.pushViewController(webVC, animated: true)
    }
}

