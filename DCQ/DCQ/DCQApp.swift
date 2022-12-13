//
//  DCQApp.swift
//  DCQ
//
//  Created by Mirna Helmy on 10/12/22.
//

import SwiftUI

@main

struct DCQApp: App {
    @StateObject var favVM: FavoriteViewModel = FavoriteViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(favVM)
        }
        
    }
}
