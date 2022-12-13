//
//  FavoriteViewModel.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/29/22.
//

import Foundation

class FavoriteViewModel: ObservableObject {

    @Published var favoritesList: [Quote] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    
    init() {
        getQuotes()
    }
    
    
 
    func getQuotes() {
        guard
            let data = UserDefaults.standard.data(forKey: "favorite"),
            //we gonna decode it here
            let savedFavorites = try? JSONDecoder().decode([Quote].self, from: data)
        else { return }
        
        self.favoritesList = savedFavorites
      
    }
    
    func delete(indexSet: IndexSet) {
        favoritesList.remove(atOffsets: indexSet)
    }

    
    
    
    func saveFavorites() {
            if let encodedData = try? JSONEncoder().encode(favoritesList) {
                //we start encoding here
                UserDefaults.standard.set(encodedData, forKey: "favorite")
            }
      
    }

    

}
