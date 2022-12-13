//
//  SearchViews.swift
//  DCQ
//
//  Created by Mirna Helmy on 10/26/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    let quotes: [Quote]
    var random: Quote {
        guard let randomz = quotes.randomElement() else { fatalError("error")}
        return randomz
    }
    
    
    
    var searchableQuotes: [Quote] {
        if searchText.isEmpty {
            return quotes
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return quotes.filter( {
                $0.body.lowercased().contains(lowercasedQuery)
                ||
                $0.author.lowercased().contains(lowercasedQuery)
            })
        }
        
    }
    
    
    
    init() {
        let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        quotes = try! JSONDecoder().decode([Quote].self, from: data)
    }
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(searchableQuotes) { quote in
                    VStack(alignment: .leading) {
                        Text(quote.body)
                            .font(.custom(FontsManager.Kalam.light, size: 17))
                        Text("By: \(quote.author)")
                            .font(.custom(FontsManager.Kalam.bold, size: 14))
                    }
                }
                //        .background(
                //            ZStack {
                //
                //                Image("plainBackground")
                //                    .ignoresSafeArea()
                //                    .opacity(0.1)
                //
                //
                //                Image("background")
                //               .resizable()
                //                    .ignoresSafeArea()
                //                  .opacity(0.2)
                //
                //
                //                LinearGradient(gradient: Gradient(colors: [.white,.yellow, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                //                   .ignoresSafeArea()
                //                   .opacity(0.2)
                //
                //            }
                //
                //        )
                
            }
            .searchable(text: $searchText, prompt: "Search")
            .listStyle(.plain)
           
            
            
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
    
}


