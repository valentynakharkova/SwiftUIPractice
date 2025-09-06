//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 01.09.2025.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftUIPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                LaunchScreen()
            }
        }
    }
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
