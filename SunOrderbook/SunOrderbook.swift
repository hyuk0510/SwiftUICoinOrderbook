//
//  SunOrderbook.swift
//  SunOrderbook
//
//  Created by 선상혁 on 2023/11/29.
//

import WidgetKit
import SwiftUI

struct SunOrderbook: Widget {
    let kind: String = "SunOrderbook" // 위젯 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                SunOrderbookEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                SunOrderbookEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("보유 코인")
        .description("실시간 시세를 확인하세요")
        .supportedFamilies([.systemSmall, .systemLarge, .systemMedium])
    }
}

//systemSmall -> widgetURL (Link X)
//systemLarge, systemMedium -> Link

//#Preview(as: .systemSmall) {
//    SunOrderbook()
//} timeline: {
//    SimpleEntry(date: .now, emoji: "😀")
//    SimpleEntry(date: .now, emoji: "🤩")
//}
