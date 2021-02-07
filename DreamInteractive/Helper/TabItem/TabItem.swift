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
            cont.view.backgroundColor = UIColor.lightGrayColor
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

    var icon: UIImage? {
        switch self {
        case .summary:
            return UIImage(named: "ic_summary")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        case .scoreCard:
            return UIImage(named: "ic_scoreCard")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        case .commentary:
            return UIImage(named: "ic_commentary")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        case .mathcInfo:
            return UIImage(named: "ic_mstchInfo")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        }
    }

    var selectedIcon: UIImage? {
        switch self {
        case .summary:
            return UIImage(named: "ic_summary_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        case .scoreCard:
            return UIImage(named: "ic_scoreCard_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        case .commentary:
            return UIImage(named: "ic_commentary_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        case .mathcInfo:
            return UIImage(named: "ic_mstchInfo_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
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
        let tarBarItem = UITabBarItem(title: displayTitle, image: icon, selectedImage: selectedIcon)
        tarBarItem.tag = rawValue
        let edge: CGFloat = 5.0
        tarBarItem.imageInsets = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        return tarBarItem
    }
}
