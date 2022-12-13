//
//  ViewA.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/7/22.
//

import SwiftUI
import Foundation
import AVFoundation

struct ViewA: View {
    @EnvironmentObject var favVM: FavoriteViewModel
    
    
    @StateObject var homeVC = HomeViewModel()
    @State var showSheet: Bool = false
    @State var musicOff: Bool = false
    @ObservedObject var musicVC = SoundManager()
    
    
    @State var isFaved = false
    
    var quotes: [Quote] = []
    var random1 = Int.random(in: 0..<50)
    
    
    
    init() {
        let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        quotes = try! JSONDecoder().decode([Quote].self, from: data)
    }
    
    
    var body: some View {
        
        
        
        ZStack(alignment: .topLeading) {
            Button {
                musicOff.toggle()
                musicVC.doMusic()
                
            } label: {
                Image(systemName: musicOff ?  "speaker" : "speaker.slash")
                    .resizable()
                    .frame(width:20, height: 23)
                    .foregroundColor(.black)
                
            }
            VStack {
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    Text(quotes[random1].body)
                        .foregroundColor(.black)
                        .font(.custom(FontsManager.Kalam.regular, size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 350, height: 300)
                    
                    
                    Button {
                        isFaved.toggle()
                        let randomOne = Quote(title: "", body: quotes[random1].body, author: quotes[random1].author, isFaved: false)
                        
                        if isFaved {
                            favVM.favoritesList.append(randomOne)
                        } else {
                            favVM.favoritesList.removeLast()
                        }
                        
                    } label: {
                        let randomOne = Quote(title: "", body: quotes[random1].body, author: quotes[random1].author, isFaved: false)
                        Image(systemName: isFaved ? "heart.fill" : "heart")
                        
                            .resizable()
                            .frame(width:20, height: 20)
                            .foregroundColor(Color("brown"))
                        
                    }
                    
                }
                
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                        homeVC.share(sharedQuote: "\(quotes[random1].body) By: \( quotes[random1].author)")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width:20, height: 23)
                            .foregroundColor(.black)
                            .padding(.horizontal,20)
                            .padding(.vertical, 10)
                            .background(Color("yellow"))
                            .cornerRadius(10)
                            .shadow(color: .brown, radius: 3)
                    }
     
                    
                    Spacer()
                }
                Spacer()
                ZStack(alignment: .bottomTrailing){
                    
                    Image("pen")
                        .resizable()
                        .frame(width: 150, height: 200)
                        .padding(.bottom)
                        .offset(x: -100, y: 5)
                    
                    
                    Text(quotes[random1].author)
                        .foregroundColor(.black)
                        .font(.custom(FontsManager.Courgette.regular, size: 17))
                        .padding(.leading,30)
                        .multilineTextAlignment(.center)
                        .offset(x: 25, y:-12)
                    
                    
                }
                Spacer()
            }
        }
    }
    
    
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}



