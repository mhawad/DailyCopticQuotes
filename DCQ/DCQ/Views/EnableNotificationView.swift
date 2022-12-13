//
//  EnableNotificationView.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/16/22.
//

import SwiftUI

struct EnableNotificationView: View {
    
    @State var enableNotification = false
    var body: some View {
        VStack{
            Group {
                Spacer()
                Text("CAN WE NOTIFY YOU?")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "bell.and.waveform")
                    .resizable()
                    .frame(width:100, height: 100)
                Spacer()
                Text("Please allow us to send you notifications")
                    .font(.caption)
                Button {
                    NotificationManager.instance.requestAuthorization()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName:enableNotification ? "app.badge" : "square.slash")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Toggle(isOn: $enableNotification) {
                            Text(enableNotification ?"Enable Notification" : "Disable Notification")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .bold))
                                .onChange(of: enableNotification) { _ in
                                    enableNotification ? NotificationManager.instance.requestAuthorization() : NotificationManager.instance.cancelNotification()
                                }
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                        
                    }
                    .frame(width:250, height: 18)
                    .padding(.all, 10)
                    .background(Color("yellow"))
                    .cornerRadius(10)
                    .shadow(color: .brown, radius: 3)
                    
                }
            }
            
            Spacer()
            
            NotificationView()
            
            Spacer()
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

struct EnableNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        EnableNotificationView()
    }
}
