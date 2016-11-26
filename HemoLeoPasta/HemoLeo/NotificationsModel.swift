//
//  NotificationsModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 24/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationsModel {
    private var center = UNUserNotificationCenter.current()
    static let sharedNotificationsModel = NotificationsModel()
    
    private init() {
        registerLocal()
    }
    
    private func registerLocal() {
        center.requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
            if !granted {
                
            }
        })
    }

    func createNotification(title: String, body: String, weekDay: Int, id: String) {
        let content = UNMutableNotificationContent()
        let calendar = Calendar.current
        let date = getDate(withWeekDay: weekDay)
        
        let alarmTime = date.addingTimeInterval(60 * 60 * 24 * 7 - 300)
        let components = calendar.dateComponents([.weekday, .hour, .minute], from: alarmTime)
        
        content.title = title
        content.body = body
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        })
    }
    
    private func getDate(withWeekDay day: Int) -> Date {
        let today = Date()
        let daysToAdd: Int!
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: today)
        
        if weekday > day {
            daysToAdd = (7 - weekday) + day
        } else {
            daysToAdd = (day - weekday)
        }
        
        let newDate = calendar.date(byAdding: .weekday, value: daysToAdd, to: today)
        
        return newDate!
    }
    
    func removeNotification(withId id: String) {
        center.removePendingNotificationRequests(withIdentifiers: [id])
    }
}

