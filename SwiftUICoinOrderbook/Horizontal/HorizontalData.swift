//
//  HorizontalData.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/27.
//

import Foundation

struct HorizontalData: Identifiable {
    let id = UUID()
    let data: String
    let point = Int.random(in: 10...3000)
}

let horizontalDummy = [
    HorizontalData(data: "사과"),
    HorizontalData(data: "바나나"),
    HorizontalData(data: "딸기"),
    HorizontalData(data: "포도"),
    HorizontalData(data: "파인애플"),
    HorizontalData(data: "귤"),
    HorizontalData(data: "수박"),
    HorizontalData(data: "샤인머스켓"),
    HorizontalData(data: "메론")
]

func largest() -> Int {
    let data = horizontalDummy.sorted(by: {$0.point > $1.point})
    return data.first!.point
}
