//
//  WKWebVC.swift
//  softevolTask
//
//  Created by Serhii on 7/18/18.
//  Copyright © 2018 Serhii. All rights reserved.
//

import UIKit
import WebKit

class WKWebVC: UIViewController, UITextFieldDelegate, WKNavigationDelegate, WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var printButton: UIButton!
    
    // home url "https://www.google.com.ua"
    var currentUrl: String = "https://www.google.com.ua" {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateWebView(urlString: currentUrl)
    }

    func updateWebView(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        urlTextField.text = urlString
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let newUrl = textField.text else { return true }
        updateWebView(urlString: newUrl)
        textField.resignFirstResponder()
        return true
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        urlTextField.text = webView.url?.absoluteString
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func printButtonTapped(_ sender: UIButton) {
        let printController = UIPrintInteractionController.shared

        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "print webPage"//(webView.url?.absoluteString)!
        printInfo.duplex = UIPrintInfoDuplex.none
        printInfo.orientation = UIPrintInfoOrientation.portrait
        printController.printPageRenderer = nil
        printController.printingItems = nil
        printController.printingItem = webView.url?.absoluteString
        printController.printInfo = printInfo
        printController.showsNumberOfCopies = true
        printController.printFormatter = webView.viewPrintFormatter()

        printController.present(animated: true, completionHandler: nil)
    }




}

