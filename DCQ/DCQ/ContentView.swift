//
//  ContentView.swift
//  DCQ
//
//  Created by Mirna Helmy on 10/12/22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            HomeView()
            
            HStack {
            
                Spacer()
                
                NavigationLink(destination: EnableNotificationView()) {
                    Image(systemName:"bell")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Spacer()
             NavigationLink(destination: FavoritesView()) {
                    Image(systemName:"heart.text.square")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
          Spacer()
                
                NavigationLink(destination: SearchView()) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
          Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        
        
        
        
        
        
        
        
        /*
        TabView {
            HomeView()
                .padding()
            
                .tabItem {
                    Image(systemName:"house.fill")
                }
                .tag(1)
            
            
            
            
            EnableNotificationView()
                .padding()
                .tabItem {
                    Image(systemName:"bell.fill")
                }
                .tag(2)
            
            
            FavoritesView()
                .padding()
            
                .tabItem {
                    Image(systemName:"heart.text.square")
                }
                .tag(3)
        }
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
