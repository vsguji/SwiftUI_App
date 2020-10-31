//
//  CategoryRow.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/27.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName:String
    var items:[Landmark]
    
    // MARK : - 1
//    var body: some View {
//        Text(self.categoryName)
//            .font(.headline)
//    }
    
    // MARK : - 2
    
//    var body: some View {
//        HStack(alignment:.top,spacing:0) {
//            ForEach(self.items) { landmark in
//                Text(landmark.name)
//            }
//        }
//    }
    
    
    // MARK : - 3
    
//    var body: some View {
//        VStack(alignment:.leading){
//            Text(self.categoryName)
//                .font(.headline)
//                .padding(.leading,15)
//                .padding(.top,5)
//
//            ScrollView(.horizontal, showsIndicators: false, content: {
//                HStack(alignment: .top, spacing: 0, content: {
//                    ForEach(self.items) { landmark in
////                        Text(landmark.name)
//                        CategoryItem(landmark: landmark)
//                    }
//                })
//            })
//            .frame(height:185)
//        }
//    }
    
    // MARK: - 4
    
//    var body: some View {
//        VStack(alignment:.leading){
//            Text(self.categoryName)
//                .font(.headline)
//                .padding(.leading,15)
//                .padding(.top,5)
//
//            ScrollView(.horizontal, showsIndicators: false, content: {
//                HStack(alignment: .top, spacing: 0, content: {
//                    ForEach(self.items) { landmark in
//                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                                CategoryItem(landmark: landmark)
//                        }
//                    }
//                })
//            })
//            .frame(height:185)
//        }
//    }
    
    // MARK: - 5
    
    var body: some View {
        VStack(alignment:.leading){
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(self.items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                                CategoryItem(landmark: landmark)
                        }
                    }
                })
            })
            .frame(height:185)
        }
    }
}


struct CategoryItem: View {
    
    var landmark:Landmark
    
    var body: some View {
        
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading,15)
    }
    
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        // .prefix(3) ???
        CategoryRow(categoryName: landmarkData[0].category.rawValue, items: Array(landmarkData.prefix(4)))
    }
}
