//
//  PageControl.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/29.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
   
    //
  // 去掉 typealias UIViewType = UIPageControl;  UIViewType 改为 目标控件;  去掉 some
    
    var numberOfPags:Int
    @Binding var currentPage:Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPags
        control.currentPageIndicatorTintColor = .red
        control.pageIndicatorTintColor = .blue
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        
        var control:PageControl
        
        init(_ control:PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender:UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

//struct PageControl_Previews: PreviewProvider {
//    static var previews: some View {
//        PageControl(numberOfPags: 4, currentPage: 0)
//    }
//}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
