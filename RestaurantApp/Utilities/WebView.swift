//
//  WebView.swift
//  RestaurantApp
//
//  Created by Diego Salazar Arp on 12-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    var url = ""
    
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let web = WKWebView()
        web.load(URLRequest(url: URL(string: url)!))
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
    
}
