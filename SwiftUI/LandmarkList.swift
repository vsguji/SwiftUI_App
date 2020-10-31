//
//  LandmarkList.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/26.
//

import SwiftUI

struct LandmarkList<DetailView:View>: View {
    
//    @State var showFavoritesOnly = false
    
    @EnvironmentObject var userData:UserData
    
    let detailViewProducers:(Landmark) -> DetailView
    
//    var body: some View {
//        List {
//            LandmarkRow(landmark:landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
//    }
    
//
//    var body: some View {
//
//        List(landmarkData,id:\.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
//    }
    
    // MARK: - 添加导航
    
//    var body: some View {
//
//        NavigationView {
//            List(landmarkData) { landmark in
//                LandmarkRow(landmark: landmark)
//            }
//        }
//    }
    
    // MARK: - 添加导航添加主题
    
//    var body: some View {
//
//        NavigationView {
//            List(landmarkData) { landmark in
//                LandmarkRow(landmark: landmark)
//            }
//            .navigationBarTitle(Text("Landmarks"))
//        }
    
//    }
//
    // MARK: - 添加导航添加主题,添加导航链接
    
//    var body: some View {
//
//        NavigationView {
//            List(landmarkData) { landmark in
//                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
//            .navigationBarTitle(Text("Landmarks"))
//        }
//    }
    
    
    // MARK: - 添加导航添加主题,添加导航链接,添加状态控制
//
//    var body: some View {
//        // Type '() -> LandmarkRow' cannot conform to 'View'; only struct/enum/class types can conform to protocols
//        NavigationView {
//            List(landmarkData) { landmark in
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                            LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Landmarks"))
//        }
//    }
    
    // MARK: - 添加导航添加主题,添加导航链接,添加状态控制,开关状态控制
    var body: some View {
        // Type '() -> LandmarkRow' cannot conform to 'View'; only struct/enum/class types can conform to protocols
        NavigationView {
            List{
                Toggle(isOn: $userData.showFavoritesOnly){
                    Text("Favorites Only")
                }
                ForEach(landmarkData) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination:self.detailViewProducers(landmark).environmentObject(self.userData)) {
                            // LandmarkDetail(landmark: landmark)
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
    
}

#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif

struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkList()
//    }
    
   // MARK: - 列表机型展示
//    static var previews: some View {
//        ForEach(["iPhone SE","iPhone XS Max"],id:\.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//        }
//    }
    
//    static var previews: some View {
//        ForEach(["iPhone SE","iPhone XS Max"],id:\.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//    }
    
    static var previews: some View {
//        LandmarkList<LandmarkDetail>(detailViewProducers: { landmark in
//            LandmarkDetail(landmark: landmark)
//        }).environmentObject(UserData())
        LandmarkList { PreviewDetailView(landmark: $0)}
            .environmentObject(UserData())
    }
}
