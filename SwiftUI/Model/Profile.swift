//
//  Porfile.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import Foundation

struct Profile {
    
    var userName:String = ""
    
    var prefersNotificaitons:Bool = false
    
    var goalDate:Date = Date()
    
    var seasonalPhoto:Season = .winter
    
    
    static let `default` = Self(userName:"qian suo")
    
    init(userName:String,prefersNotifications:Bool = true,seasonalPhoto:Season = .winter) {
        self.userName = userName
        self.prefersNotificaitons = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
   
    enum Season:String,CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
