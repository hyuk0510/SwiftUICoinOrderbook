//
//  MyWebView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/27.
//

//SwiftUI 프로젝트에 UIKit 객체들을 활용하는 방법 => UIViewRepresentable
import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
