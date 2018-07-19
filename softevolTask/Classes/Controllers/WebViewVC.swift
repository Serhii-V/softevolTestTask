//
//  WebViewVC.swift
//  softevolTask
//
//  Created by Serhii on 7/19/18.
//  Copyright © 2018 Serhii. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {

    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        let script = WKUserScript(source: "window.print = function() { window.webkit.messageHandlers.print.postMessage('print') }", injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        webConfiguration.userContentController.addUserScript(script)
        webConfiguration.userContentController.add(self, name: "print")
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "http://elementstest.customertests.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if (navigationAction.navigationType == .linkActivated){
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "print" {
            webPrint()
        } else {
            print("Some other message sent from web page...")
        }
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
