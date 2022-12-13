//
//  ViewC.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/7/22.
//

import SwiftUI
import AVKit


struct ViewC: View {
    @EnvironmentObject var favVM: FavoriteViewModel

    @StateObject var homeVC = HomeViewModel()
    @State var showSheet: Bool = false
   
   
    
    @State var isFaved = false
    
    var quotes: [Quote] = []
    var random3 = Int.random(in: 101..<200)
    init() {
        let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        quotes = try! JSONDecoder().decode([Quote].self, from: data)
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottomTrailing) {
            Text(quotes[random3].body)
                .foregroundColor(.black)
                .font(.custom(FontsManager.Kalam.regular, size: 17))
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 300)
            
                                
            Button {
                isFaved.toggle()
                let randomThree = Quote(title: "", body: quotes[random3].body, author: quotes[random3].author, isFaved: false)
                
                
                if isFaved {
                    favVM.favoritesList.append(randomThree)
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
                
                    homeVC.share(sharedQuote: "\(quotes[random3].body) By: \( quotes[random3].author)")
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
                
                Text(quotes[random3].author)
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

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
