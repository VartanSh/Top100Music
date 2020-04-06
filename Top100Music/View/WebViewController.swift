//
//  WebViewController.swift
//  Top100Music
//
//  Created by Admin on 4/6/20.
//  Copyright © 2020 Vartan Shahjahanian. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController{
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        return webView
    }()
    
    var urlString : String
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        urlString = ""
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadWebPage()
    }
    
    func loadWebPage() {
        guard let url = URL(string:self.urlString ) else { return }
        let requestURL = URLRequest(url: url)
        self.webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36"
        DispatchQueue.main.async {
            self.webView.load(requestURL)
        }
    }
    
    func setupUI() {
        self.navigationItem.title = "Album's Web Page "
        self.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setURL(urlString:String){
        self.urlString = urlString
    }
}


