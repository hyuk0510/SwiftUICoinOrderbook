//
//  WalletModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 선상혁 on 2023/11/22.
//

import SwiftUI

struct WalletModel: Hashable {
    let color = Color.random()
    let name: String
    let index: Int
}

var walletList = [
    WalletModel(name: "a Card", index: 0),
    WalletModel(name: "b Card", index: 1),
    WalletModel(name: "c Card", index: 2),
    WalletModel(name: "d Card", index: 3)
]
