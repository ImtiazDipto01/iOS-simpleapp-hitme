//
//  AboutViewController.swift
//  HitMe
//
//  Created by Imtiaz Uddin Ahmed on 28/3/20.
//  Copyright © 2020 Imtiaz. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }
    
    @IBAction func CloseTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
