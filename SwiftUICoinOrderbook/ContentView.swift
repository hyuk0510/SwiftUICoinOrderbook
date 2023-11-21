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
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal)
                                    .onTapGesture {
                                        viewModel.fetchBanner()
                                        
                                    }
                            }
                        } // LazyHStack
                        //스크롤 하고자 하는 대상에 대한 레이아웃 설정
                        .scrollTargetLayout()
                    } // ScrollView
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
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(viewModel.banner.color)
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .offset(x: -100, y: -20)
                        .scaleEffect(1.3, anchor: .topLeading)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.title3)
                    .foregroundStyle(Color.white)
                Text(viewModel.banner.totalFormat)
                    .font(.system(.title, weight: .semibold))
                    .foregroundStyle(Color.white)
            }
//            .visualEffect { content, geometryProxy in
//                content.offset(x: scrollOffset(geometryProxy))
//            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding()
    }
    
    //GeometryProxy: 컨테이너 뷰에 대한 좌표나 크기에 접근할 수 있음!!
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -result
    }

}

#Preview {
    ContentView()
}
