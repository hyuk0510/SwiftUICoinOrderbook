//
//  BannerView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/21.
//

import SwiftUI

struct BannerView: View {
    
    @ObservedObject var viewModel = BannerViewModel()
    
    var body: some View {
        LazyHStack {
            ForEach(1..<5) { _ in
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
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .onTapGesture {
                    viewModel.fetchBanner()
                }
                .padding()
                .containerRelativeFrame(.horizontal)
            }
        }
        
       
    }
        
        //            .visualEffect { content, geometryProxy in
        //                content.offset(x: scrollOffset(geometryProxy))
        //            }
    
    
    //GeometryProxy: 컨테이너 뷰에 대한 좌표나 크기에 접근할 수 있음!!
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -result
    }

    
}

#Preview {
    BannerView()
}
