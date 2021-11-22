//
//  WebView.swift
//  HackerNews
//
//  Created by Julio Ismael Robles on 22/11/2021.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView.pageNotFoundView()
        }
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: self.url) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
}
