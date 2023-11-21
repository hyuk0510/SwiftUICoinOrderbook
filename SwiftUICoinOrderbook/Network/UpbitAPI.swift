//
//  UpbitAPI.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/21.
//

import Foundation

struct Market: Codable, Hashable {
    let market: String
    let korean: String
    let english: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case korean = "korean_name"
        case english = "english_name"
    }
}

struct UpbitAPI {
    
    private init() {}
    
    static func fetchAllMarket(completion: @escaping ([Market]) -> Void )  {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                
                DispatchQueue.main.async {
                    completion(decodedData)
                }
                
            } catch {
                    print(error)
                }
                                                           
        }.resume()
    }
}
