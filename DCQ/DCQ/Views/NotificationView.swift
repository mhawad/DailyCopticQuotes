//
//  NotificationView.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/14/22.
//

import SwiftUI
import UserNotifications

struct NotificationView: View {
    @State private var selectedDate = Date()
  
    var quotes: [Quote] = []
    var random1 = Int.random(in: 0..<50)
    
    
    init() {
         let url = Bundle.main.url(forResource: "quotes", withExtension: "json")!
         let data = try! Data(contentsOf: url)
         quotes = try! JSONDecoder().decode([Quote].self, from: data)
     }
        
        
    var body: some View {
        
        VStack {
        
            
            DatePicker("", selection: $selectedDate, in: Date()... , displayedComponents: .hourAndMinute)
                
                .datePickerStyle(.wheel)
                .padding()
                .padding(.bottom, 50)
            
            HStack(spacing: 5) {
                Image(systemName: "timer")
                    .resizable()
                    .frame(width: 20, height: 20)
                Button {
                    NotificationManager.instance.sendNotification(
                        date: selectedDate,
                        type: "date",
                        title: "Coptic Quotes",
                        body: "\(quotes[random1].body) By: \( quotes[random1].author)"
                      
                    )
                 
                } label: {
                   Text("Schedule Notification")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            .frame(width:200, height: 18)
            .padding(.all, 10)
            
            .background(Color("yellow"))
            .cornerRadius(10)
            .shadow(color: .brown, radius: 3)
          

       
 
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
