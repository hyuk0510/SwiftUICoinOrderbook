//
//  HorizontalViewModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/27.
//

import SwiftUI

class HorizontalViewModel: ObservableObject {
    
    @Published var askOrderBook: [OrderBookItem] = []
    @Published var bidOrderBook: [OrderBookItem] = []

    let market: Market
    
    init(market: Market) {
        self.market = market
    }
    
    func fetchAllMarket()  {
        
        let url = URL(string: "https://api.upbit.com/v1/orderbook?markets=\(market.market)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([OrderBookModel].self, from: data)
                
                DispatchQueue.main.async {
                    let result = decodedData.first?.orderbook_units ?? [OrderBookUnit(ask_price: 0, bid_price: 0, ask_size: 0, bid_size: 0)]
                    
                    let ask = result.map {
                        OrderBookItem(price: $0.ask_price, size: $0.ask_size)
                    }.sorted(by: { $0.price > $1.price })
                    
                    let bid = result.map {
                        OrderBookItem(price: $0.bid_price, size: $0.bid_size)
                    }.sorted(by: { $0.price > $1.price })
                    
                    self.askOrderBook = ask
                    self.bidOrderBook = bid
                }
                
            } catch {
                    print(error)
                }
                                                           
        }.resume()
    }
    
    func largestAskSize() -> Double {
        return askOrderBook.sorted(by: {$0.size > $1.size }).first!.size
    }
    
    func largestBidSize() -> Double {
        return bidOrderBook.sorted(by: {$0.size > $1.size }).first!.size
    }
    
//    func timer() {
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
//            self.value += 0.5
//            self.fetchDummyData()
//        }
//    }
    
//    func fetchDummyData() {
//        dummy = [
//            HorizontalData(data: "사과"),
//            HorizontalData(data: "바나나"),
//            HorizontalData(data: "파인애플"),
//            HorizontalData(data: "포도"),
//            HorizontalData(data: "샤인머스켓"),
//            HorizontalData(data: "수박"),
//            HorizontalData(data: "메론"),
//            HorizontalData(data: "귤")
//        ]
//    }
    
    
}

struct OrderBookModel: Decodable {
    let market: String
    let timestamp: Int
    let total_ask_size, total_bid_size: Double
    let orderbook_units: [OrderBookUnit]
}

struct OrderBookUnit: Decodable {
    let ask_price, bid_price: Double
    let ask_size, bid_size: Double
}

struct OrderBookItem: Hashable, Identifiable {
    let id = UUID()
    let price: Double
    let size: Double
}
