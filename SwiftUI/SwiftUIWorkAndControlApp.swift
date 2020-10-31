//
//  SwiftUIWorkAndControlApp.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

@main
struct SwiftUIWorkAndControlApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            // 为什么不能预览
          PageView(features.map({FeatureCard(landmark: $0)}))
                           .aspectRatio(3/2, contentMode: .fit)
        }
    }
}
