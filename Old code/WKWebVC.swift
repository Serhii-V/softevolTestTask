//
//  WKWebVC.swift
//  softevolTask
//
//  Created by Serhii on 7/18/18.
//  Copyright © 2018 Serhii. All rights reserved.
//

import UIKit
import WebKit

class WKWebVC: UIViewController, UITextFieldDelegate, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var printButton: UIButton!
    
    let homeUrl =  "http://elementstest.customertests.com/"
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateWebView(urlString: homeUrl)
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

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "print" {
            webPrint()
        } else {
            print("Some other message sent from web page...")
        }
    }

    func setup() {
        let configuration = WKWebViewConfiguration()
        let script = WKUserScript(source: "window.print = function() { window.webkit.messageHandlers.print.postMessage('print') }", injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(script)
        configuration.userContentController.add(self as WKScriptMessageHandler, name: "print")
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func printButtonTapped(_ sender: UIButton) {
        webPrint()
    }

    func webPrint() {
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

