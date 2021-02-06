//
//  UIViewController+Extension.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 06/02/21.
//

import UIKit

extension UIViewController {
    typealias DoubleController = (UIViewController, UIViewController)
    
    func addChildVC(_ viewcontrollers: DoubleController, frame: CGRect, view: UIView) -> UIViewController{
        let vcs = viewcontrollers
        vcs.0.addChild(vcs.1)
        vcs.1.view.frame = frame
        vcs.1.view.widthAnchor.constraint(equalToConstant: frame.size.width).isActive = true
        view.addSubview(vcs.1.view)
        vcs.1.didMove(toParent: vcs.0)
        return vcs.1
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
