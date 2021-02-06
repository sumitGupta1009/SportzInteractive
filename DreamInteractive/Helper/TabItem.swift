//
//  TabItem.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 05/02/21.
//

import UIKit
enum TabItem: Int, CaseIterable {
    case summary = 0
    case scoreCard = 1
    case commentary = 2
    case mathcInfo = 3

    var viewController: UIViewController {
        switch self {
        case .summary:
            let cont = SumaryViewController()
            cont.view.backgroundColor = .green
            return cont
        case .scoreCard:
            let cont = ScoreCardViewController()
            cont.view.backgroundColor = .black
            return cont
        case .commentary:
            let cont = CommentaryViewController()
            cont.view.backgroundColor = .blue
            return cont
        case .mathcInfo:
            let cont = MatchInfoViewController()
            cont.view.backgroundColor = .orange
            return cont
        }
    }

    var icon: UIImage {
        switch self {
        case .summary:
            return UIImage(named: "ic_summary")!
        case .scoreCard:
            return UIImage(named: "ic_scoreCard")!
        case .commentary:
            return UIImage(named: "ic_commentary")!
        case .mathcInfo:
            return UIImage(named: "ic_mstchInfo")!
        }
    }

    var displayTitle: String {
        switch self {
        case .summary:
            return "summary".capitalized
        case .scoreCard:
            return "scoreCard".capitalized
        case .commentary:
            return "commentary".capitalized
        case .mathcInfo:
            return "mathcInfo".capitalized
        }
    }

    var tabItem: UITabBarItem {
        return UITabBarItem(title: displayTitle, image: icon, tag: rawValue)
    }
}

class ViewControllerManager: NSObject {
    class func summaryNavVC() -> UINavigationController {
        let vc = SumaryViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }

    class func scoreCardNavVC() -> UINavigationController {
        let vc = ScoreCardViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }

    class func commentaryNavVC() -> UINavigationController {
        let vc = CommentaryViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }

    class func matchInfoNavVC() -> UINavigationController {
        let vc = MatchInfoViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
}
