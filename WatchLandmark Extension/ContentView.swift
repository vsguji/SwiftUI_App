//
//  ContentView.swift
//  WatchLandmark Extension
//
//  Created by lipeng on 2020/10/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList {WatchLandmarkDetail(landmark: $0)}
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        LandmarkList { WatchLandmarkDetail(landmark: $0)}
            .environmentObject(UserData())
    }
}
