//
//  PageView.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/29.
//

import SwiftUI

struct PageView<Page:View> : View {
    
    // UIHostringController
    // UIPageViewController
    var viewControllers:[UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views:[Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    var body: some View {
        
        ZStack(alignment:.bottomTrailing) {
            PageViewController(controllers: viewControllers,currentPage: $currentPage)
            PageControl(numberOfPags: viewControllers.count, currentPage: $currentPage)
                                                                    .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            PageView(features.map {
                 FeatureCard(landmark:$0)
            })
            .aspectRatio(3/2, contentMode: .fit)
            PageView(features.map {
                FeatureCard(landmark:$0)
            })
            .aspectRatio(3/2, contentMode: .fit)
        }
    }
}

//RemoteHumanReadableError: Failed to update preview.
//
//The preview process appears to have crashed.
//
//Error encountered when sending 'render' message to agent.
//
//==================================
//
//|  RemoteHumanReadableError: The operation couldn’t be completed. (BSServiceConnectionErrorDomain error 3.)
//|
//|  BSServiceConnectionErrorDomain (3):
//|  ==BSErrorCodeDescription: OperationFailed
