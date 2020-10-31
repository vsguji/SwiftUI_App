//
//  WatchMapView.swift
//  WatchLandmark Extension
//
//  Created by lipeng on 2020/10/31.
//

import SwiftUI

// Now that you’ve created the basic detail view, it’s time to add a map to show the landmark’s location. Unlike CircleImage, you can’t just reuse the iOS app’s MapView. Instead, you’ll need to create a WKInterfaceObjectRepresentable structure to wrap the WatchKit map.

// Mark: - Instead, you’ll need to create a WKInterfaceObjectRepresentable structure to wrap the WatchKit map.

struct WatchMapView: WKInterfaceObjectRepresentable {
   
    // View
    
    var lanmark:Landmark
    
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) ->  WKInterfaceMap {
        // 'init()' was deprecated in watchOS 7.0: Use MapKit.MapView instead.
        return WKInterfaceMap()
    }
    
    func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: lanmark.locationCoordinate, span: span)
        
        wkInterfaceObject.setRegion(region)
    }
    
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(lanmark: UserData().landmarks[0])
    }
}
