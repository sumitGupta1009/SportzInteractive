//
//  ViewController.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 05/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var contentView: UIView!
    @IBOutlet var scrollView: UIScrollView!

    let tabItems: [TabItem] = [.summary, .scoreCard, .commentary, .mathcInfo]
    var viewControllers: [UIViewController] = []
    var initialLoad: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        title = "SportzInteractive"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if initialLoad {
            addChildViewControllers()
            initialLoad = false
        }
    }

    fileprivate func addChildViewControllers() {
        let width = max(view.frame.width, UIScreen.main.bounds.width)
        tabBar.items?.removeAll()

        for (index, item) in tabItems.enumerated() {
            let childViewController = addChildVC((self, item.viewController), frame: CGRect(x: width * CGFloat(index), y: 0, width: width, height: scrollView.frame.height), view: scrollView)
            viewControllers.append(childViewController)
            tabBar.items?.append(item.tabItem)
        }
        scrollView.contentSize = CGSize(width: width * CGFloat(viewControllers.count), height: scrollView.frame.height)
    }

    func onSelection(index _: Int) {}
}

extension ViewController: UITabBarDelegate {
    func tabBar(_: UITabBar, didSelect item: UITabBarItem) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.width * CGFloat(item.tag), y: 0), animated: true)
    }
}
