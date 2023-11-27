//
//  SeSACView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/27.
//

import SwiftUI

struct SeSACView: View {
    
    @State private var textFieldText = "SwiftUI 텍스트"
    
    @State private var uiKitTextFieldText = "UIKit 텍스트"
    
    var body: some View {
        VStack {
            Text(textFieldText)
            TextField("SwiftUI 텍스트필드입니다.", text: $textFieldText)
            
            VStack {
                Text(uiKitTextFieldText)
                MyTextField(text: $uiKitTextFieldText)
            }
            .background(Color.gray)
            .padding()
            MyWebView(url: "https://www.apple.com")
            
        }
    }
}

#Preview {
    SeSACView()
}
