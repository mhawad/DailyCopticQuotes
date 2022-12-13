//
//  NotificationManager.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/14/22.
//

import Foundation
import SwiftUI
import UserNotifications


class NotificationManager {
    @ObservedObject var homeVC = HomeViewModel()
    static let instance = NotificationManager()
    var quotes: [Quote] = []
    var random1 = Int.random(in: 0..<50)
    
    func requestAuthorization() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    

    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String ) {
        var trigger: UNNotificationTrigger?
        
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)

            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        }

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    }
    
    
    func cancelNotification() {
        //will cancel all the upcoming notificaton that doesn't actually come yet
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }

    
}
