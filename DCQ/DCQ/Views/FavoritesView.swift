//
//  FavoritesView.swift
//  DCQ
//
//  Created by Mirna Helmy on 10/20/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favVM: FavoriteViewModel
    
    
    
    @State var isFaved = false
    var quotes: [Quote] = []
    
    
    
    var body: some View {
        
        if favVM.favoritesList.isEmpty {
            Text("No favorites yet")
        } else {
            NavigationView {
                
                
                List {
                    ForEach(favVM.favoritesList) { favs in
                        VStack(alignment: .leading){
                            Text(favs.body)
                                .font(.custom(FontsManager.Kalam.light, size: 17))
                            Text(favs.author)
                                .font(.custom(FontsManager.Kalam.bold, size: 14))
                            
                        }
                        
                    }
                    
                    .onDelete(perform: favVM.delete)
                    
                }
                
                .listStyle(.plain)
                
                .toolbar {
                    EditButton()
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
            }
            .navigationTitle("My Favorites")
            
        }
        
    }
    
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}



