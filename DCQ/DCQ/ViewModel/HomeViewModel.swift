//
//  HomeViewModel.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/10/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    var quotes: [Quote] = []
    var random = Int.random(in: 0..<227)
    
    init() {
        let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        quotes = try! JSONDecoder().decode([Quote].self, from: data)
    }
    
    func share(sharedQuote: String) {
        let infoU = sharedQuote
        let av = UIActivityViewController(activityItems: [infoU], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            av.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            av.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2.1, y: UIScreen.main.bounds.height / 1.3, width: 200, height: 200)
        }
    }
    
}
