//
//  WKWebVC.swift
//  softevolTask
//
//  Created by Serhii on 7/18/18.
//  Copyright © 2018 Serhii. All rights reserved.
//

import UIKit
import WebKit

class WKWebVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!

    // home url "https://www.google.com.ua"
    var currentUrl: String = "https://www.google.com.ua" {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateWebView(urlString: currentUrl)
    }

    func updateWebView(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let newUrl = textField.text else { return true }
        updateWebView(urlString: newUrl)
        textField.resignFirstResponder()
        return true
    }

}
