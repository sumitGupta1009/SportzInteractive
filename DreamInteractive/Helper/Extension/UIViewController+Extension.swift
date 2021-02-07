//
//  UIViewController+Extension.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 06/02/21.
//

import UIKit

extension UIViewController {
    typealias DoubleController = (UIViewController, UIViewController)

    func addChildVC(_ viewcontrollers: DoubleController, frame: CGRect, view: UIView) -> UIViewController {
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

extension UIColor {
    class var lightGrayColor: UIColor {
        return UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1.0)
    }

    class var demBlack: UIColor {
        return UIColor(red: 3 / 255, green: 3 / 255, blue: 3 / 255, alpha: 1.0)
    }

    class var coral: UIColor {
        return UIColor(red: 223 / 255, green: 54 / 255, blue: 44 / 255, alpha: 1.0)
    }

    class var whiteSmoke: UIColor {
        return UIColor(red: 244 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
    }

    class var grayChetau: UIColor {
        return UIColor(red: 163 / 255, green: 164 / 255, blue: 168 / 255, alpha: 1.0)
    }
}
