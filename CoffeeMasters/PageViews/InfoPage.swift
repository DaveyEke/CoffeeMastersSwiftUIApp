//
//  InfoPage.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/18/25.
//

import SwiftUI
import WebKit


// UIKIT

class WebInterfaceDialogs: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView  {
        let webview = WKWebView()
        return webview
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let url = URL(string: "https://firtman.github.io/coffeemasters/webapp")!
        webView.load(URLRequest(url: url))
    }
}

struct InfoPage: View {
    var body: some View {
        WebView()
    }
}

#Preview {
    InfoPage()
}
