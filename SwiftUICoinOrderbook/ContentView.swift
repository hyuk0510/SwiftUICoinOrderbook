//
//  ContentView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/20.
//

import SwiftUI

struct ContentView: View { // 상위뷰
    
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var renderingTestNumber = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("테스트: \(renderingTestNumber)")
                NavigationLink("배너 테스트", value: renderingTestNumber)
                VStack {
                    ScrollView(.horizontal) {
                        BannerView()                        
                    } // ScrollView
                    //스크롤 하고자 하는 대상에 대한 레이아웃 설정
                    .scrollTargetLayout()
                    .scrollTargetBehavior(.viewAligned)
//                    .safeAreaPadding([.horizontal], 40)
                    ListView() // 하위뷰
                } // Vstack
            } // ScrollView
            .scrollIndicators(.hidden)
            .refreshable { //iOS15+
                viewModel.fetchBanner()
                renderingTestNumber = Int.random(in: 1...100)
            }
            .navigationTitle("SangHyuk's Wallet")
            .navigationDestination(for: Int.self) { _ in
                BannerTestView(testNumber: $renderingTestNumber)
            }
        } // NavigationStack
        
    }
    
}

#Preview {
    ContentView()
}
