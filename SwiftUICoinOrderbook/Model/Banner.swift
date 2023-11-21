//
//  Banner.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/21.
//

import SwiftUI

struct Banner: Hashable, Identifiable {
    let id = UUID()
    var total = Int.random(in: 1000...5000) * 150
    let color = Color.random()
    
    var totalFormat: String {
        return String(total.formatted()) + "원"
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

