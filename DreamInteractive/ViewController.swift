//
//  ViewController.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 05/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let tabItems: [TabItem] = [.summary, .scoreCard, .commentary, .mathcInfo]
    var viewControllers: [UIViewController] = []
    var initialLoad: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if initialLoad {
            addChildViewControllers()
            initialLoad = false
        }
    }
    
    fileprivate func addChildViewControllers() {
        let width = max(self.view.frame.width, UIScreen.main.bounds.width)
        self.tabBar.items?.removeAll()
        
        for (index, item)in tabItems.enumerated() {
            let childViewController = self.addChildVC((self, item.viewController), frame: CGRect(x: width * CGFloat(index), y: 0, width: width, height: scrollView.frame.height), view: scrollView)
            viewControllers.append(childViewController)
            tabBar.items?.append(item.tabItem)
        }
        scrollView.contentSize = CGSize(width: width * CGFloat(viewControllers.count), height: scrollView.frame.height)
    }
    
    func onSelection(index: Int) {
    }
}

extension ViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.width * CGFloat(item.tag), y: 0), animated: true)
    }
}
