//
//  WatchLandmarkDetail.swift
//  WatchLandmark Extension
//
//  Created by lipeng on 2020/10/30.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    
    @EnvironmentObject var userData:UserData
    
    var landmark:Landmark
    
    var landmarkIndex:Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
       // CircleImage(image: self.landmark.image.resizable())
       //             .scaledToFit()
        ScrollView {
         VStack {
            CircleImage(image: self.landmark.image.resizable())
                .scaledToFit()
            
            Text(self.landmark.name)
                .font(.headline)
                .lineLimit(0)
            
            Toggle(isOn: $userData.landmarks[self.landmarkIndex].isFavorite) {
                Text("Favorite")
            }
            Divider() // 分频器
            
            Text(self.landmark.park)
                .font(.caption)
                .bold()
                .lineLimit(0)
            
            Text(self.landmark.state)
                .font(.caption)
            
             Divider() // 分频器
            
            WatchMapView(lanmark: self.landmark)
                .scaledToFit()
                .padding()
        }
        .padding(16)
     }
        .navigationBarTitle("Landmarks")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
//        return WatchLandmarkDetail(landmark: userData.landmarks[0])
//                        .environmentObject(userData)
        return Group {
            WatchLandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
                .previewDevice("Apple Watch Series 6 - 44mm")
            WatchLandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
                .previewDevice("Apple Watch Series 6 - 40mm")
        }
    }
}
