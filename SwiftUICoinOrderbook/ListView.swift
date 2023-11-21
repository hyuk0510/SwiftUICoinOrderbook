//
//  ListView.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/21.
//

import SwiftUI

struct ListView: View {
    
    //ObservedObject(초기화) vs StateObject(유지)
    @ObservedObject var viewModel = ListViewModel()
    
    var body: some View {
        
        LazyVStack {
            Button("서버 통신") {
                viewModel.fetchAllMarket()
            }
            ForEach(viewModel.market, id: \.self) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.korean)
                            .fontWeight(.bold)
                        Text(item.english)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    } // VStack
                    Spacer()
                    Text(item.market)
                } // HStack
                .padding()
            }
        }
        .onAppear {
            print("====================")
            viewModel.fetchAllMarket()
        }
       
    }
}

#Preview {
    ListView()
}
