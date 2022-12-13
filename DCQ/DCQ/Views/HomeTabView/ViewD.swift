//
//  ViewD.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/7/22.
//

import SwiftUI

struct ViewD: View {
    @EnvironmentObject var favVM: FavoriteViewModel

    
    @StateObject var homeVC = HomeViewModel()
    @State var showSheet: Bool = false
    var quotes: [Quote] = []
    
   
    @State var isFaved = false
    
    
    var random4 = Int.random(in: 200..<226)
    init() {
        let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        quotes = try! JSONDecoder().decode([Quote].self, from: data)
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottomTrailing) {
            Text(quotes[random4].body)
                .foregroundColor(.black)
                .font(.custom(FontsManager.Kalam.regular, size: 17))
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 300)
            
                                
            Button {
                isFaved.toggle()
                let randomFour = Quote(title: "", body: quotes[random4].body, author: quotes[random4].author, isFaved: false)
                
                if isFaved {
                    favVM.favoritesList.append(randomFour)
                } else {
                    favVM.favoritesList.removeLast()
                }
        
            } label: {
         
                    Image(systemName: isFaved ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width:20, height: 20)
                        .foregroundColor(Color("brown"))
           
            }
        }
        
            HStack {
                Spacer()
                Button {
               
                    homeVC.share(sharedQuote: "\(quotes[random4].body) By: \( quotes[random4].author)")
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
                    .frame(width: 130, height: 180)
                    .padding(.bottom)
                    .offset(x: -100, y: 5)
                
                
                
                Text(quotes[random4].author)
                    .foregroundColor(.black)
                    .font(.custom(FontsManager.Courgette.regular, size: 17))
                    .padding(.leading, 30)
                    .multilineTextAlignment(.center)
                    .offset(x: 25, y:-12)
                
                
            }
            
            Spacer()
        }
    }

}

struct ViewD_Previews: PreviewProvider {
    static var previews: some View {
        ViewD()
    }
}
