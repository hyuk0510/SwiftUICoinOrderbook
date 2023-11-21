//
//  ContentViewModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/21.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published var banner = Banner()
    @Published var money: [Market] = []
    
    func fetchBanner() {
        banner = Banner()
    }
    
    func fetchAllMarket()  {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                
                DispatchQueue.main.async {
                    self.money = decodedData
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
