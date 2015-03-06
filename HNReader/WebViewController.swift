//
//  WebViewController.swift
//  HNReader
//
//  Created by Boris on 11.02.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var storyWebView: UIWebView!
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentUrl = url {
            if let source = NSURL(string: currentUrl) {
                let request = NSURLRequest(URL: source)
                storyWebView.loadRequest(request)
            }
        }
    }

}
