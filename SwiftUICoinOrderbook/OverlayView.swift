//
//  OverlayView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/21.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.yellow)
                .frame(width: 150, height: 150)
                
                Text("Hiasdfasfsfasdfasfsavavzxxvxvxv")
            }
            
            Circle()
                .fill(.yellow)
                .frame(width: 150, height: 150)
                .overlay {
                    Text("Hiasbfdbfbfasfafasfsfsfsfsfafasdfafs")
                }
        }
    }
}

#Preview {
    OverlayView()
}
