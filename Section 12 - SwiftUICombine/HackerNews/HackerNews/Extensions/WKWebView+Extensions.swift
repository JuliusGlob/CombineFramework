//
//  WKWebView+Extensions.swift
//  HackerNews
//
//  Created by Julio Ismael Robles on 22/11/2021.
//

import Foundation
import WebKit

extension WKWebView {
    static func pageNotFoundView() -> WKWebView {
        
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><H1>Page Not Found!<H1><body><html>", baseURL: nil)
        return wk
    }
}
