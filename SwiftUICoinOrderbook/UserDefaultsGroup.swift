//
//  UserDefaultsGroup.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/30.
//

import Foundation

extension UserDefaults {
    
    static var groupShared: UserDefaults {
        let appGroupID = "group.Sun.SunWallet"
        return UserDefaults(suiteName: appGroupID)!
    }
}
