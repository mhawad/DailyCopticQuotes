//
//  HomeView.swift
//  DCQ
//
//  Created by Mirna Helmy on 10/12/22.
//

import Foundation
import SwiftUI
import AVKit



struct HomeView: View {
    @State var showSheet: Bool = false
    var quotes: [Quote] = []
    var random = Int.random(in: 0..<227)
    
    init() {
        let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        quotes = try! JSONDecoder().decode([Quote].self, from: data)
    }
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                TabView {
                    ViewA()
                        .padding()
                    
                    ViewB()
                        .padding()
                    
                    ViewC()
                        .padding()
                    
                    ViewD()
                        .padding()
                    
                }
                
                .background(
                    ZStack {
                        
                        Image("plainBackground")
                            .ignoresSafeArea()
                            .opacity(0.1)
                        
                        
                        Image("background")
                            .resizable()
                            .ignoresSafeArea()
                            .opacity(0.2)
                        
                        
                        LinearGradient(gradient: Gradient(colors: [.white,.yellow, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
                            .opacity(0.2)
                        
                    }
                    
                    
                    
                )
                .tabViewStyle(PageTabViewStyle())
                
            }
            .padding(.bottom)
            Spacer()
        }
    }    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}











