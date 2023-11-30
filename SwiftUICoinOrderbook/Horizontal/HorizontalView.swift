//
//  HorizontalView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/27.
//

import SwiftUI
import WidgetKit

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel(market:
                                                        Market(market: "krw-btc", korean: "비트코인", english: "Bitcoin")
    )
    
    var body: some View {
        ScrollView {
            Text(viewModel.market.korean)
            GeometryReader { proxy in
                
                let graphWidth = proxy.size.width * 0.7
                
                VStack {
                    ForEach(viewModel.askOrderBook, id: \.id) { item in
                        HStack {
                            Text(item.price.formatted())
                                .frame(width: proxy.size.width * 0.2)
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundStyle(.blue.opacity(0.4))
                                    .frame(maxWidth: graphWidth * 0.7)
                                Text(item.size.formatted())
                                    .frame(width: graphWidth)
                            }
                            .frame(maxWidth: .infinity)
                            .background(.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .background(.green)
                
            }
        }
        .onAppear {
//            viewModel.timer()
            //UserDefaults AppGroup
            print(UserDefaults.groupShared.string(forKey: "Market"))
            
            UserDefaults.groupShared.set(viewModel.market.korean, forKey: "Market")
            
            print(UserDefaults.groupShared.string(forKey: "Market"))
            
            WidgetCenter.shared.reloadTimelines(ofKind: "SunOrderbook")
        }
        
    }
}

#Preview {
    HorizontalView()
}
