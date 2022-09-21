//
//  WayfyndrView.swift
//  WebView
//
//  Created by Sahil Ramesh Satralkar on 21/09/22.
//

import UIKit
import WebKit

public class WayfyndrView: UIView {
    
    private var webView: WKWebView = WKWebView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    convenience public init(urlString: String) {
        self.init(frame: .zero)
        setupView(urlString: urlString)
    }
    
    private func setupView(urlString: String? = nil) {
        guard let urlStr = urlString, let url = URL(string: urlStr) else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        addSubview(webView)
        addConstraintsToWebView()
    }
    
    private func addConstraintsToWebView() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.topAnchor.constraint(equalTo: topAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
