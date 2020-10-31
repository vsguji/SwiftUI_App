//
//  PageViewController.swift
//  SwiftUIWorkAndControl
//
//  Created by lipeng on 2020/10/29.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
   
    // 'UIViewControllerRepresentable' requires the types 'some View' and 'Never' be equivalent
    // equivalent 等效
    
    typealias UIViewControllerType = UIPageViewController
    // 修改前 Cannot convert value of type 'UIViewController' to expected argument type '[UIViewController]?'
    // var controllers:[UIViewController]
    // 修改后
    var controllers:[UIViewController]
    
    @Binding var currentPage:Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
        
    class Coordinator:NSObject,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
           if completed, let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
                }
        }
        
        var parent:PageViewController
        
        init(_ pageViewController:PageViewController) {
            self.parent = pageViewController
        }
        
    }
}

//struct PageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//         PageViewController(controllers: <#[UIViewController]#>)
//    }
//}

//struct PageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}


struct PageViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
