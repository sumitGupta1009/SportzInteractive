//
//  ScoreCardViewController.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 06/02/21.
//

import Segmentio
import UIKit

class ScoreCardViewController: UIViewController {
    let items = [SegmentioItem(title: "Recent", image: nil), SegmentioItem(title: "Searches", image: nil)]

    @IBOutlet var segementControl: Segmentio!
    override func viewDidLoad() {
        super.viewDidLoad()
        SegmentioBuilder.buildSegmentioView(segmentioView: segementControl, segmentioStyle: .onlyLabel)
        segementControl.valueDidChange = { [weak self] _, _ in
        }
        segementControl.selectedSegmentioIndex = selectedSegmentioIndex()
    }

    private func selectedSegmentioIndex() -> Int {
        return 1
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

struct SegmentioBuilder {
    private static func segmentioContent() -> [SegmentioItem] {
        return [SegmentioItem(title: "Recent", image: nil),
                SegmentioItem(title: "Searches", image: nil)]
    }

    static func buildSegmentioView(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 3)) {
        segmentioView.setup(
            content: segmentioContent(),
            style: segmentioStyle,
            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
        )
    }

    private static func segmentioOptions(segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 3)) -> SegmentioOptions {
        var imageContentMode = UIView.ContentMode.center
        switch segmentioStyle {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }

        return SegmentioOptions(
            backgroundColor: UIColor.white,
            segmentPosition: segmentioPosition,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: segmentioHorizontalSeparatorOptions(),
            verticalSeparatorOptions: segmentioVerticalSeparatorOptions(),
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            labelTextNumberOfLines: 1,
            segmentStates: segmentioStates(),
            animationDuration: 0.3
        )
    }

    private static func segmentioStates() -> SegmentioStates {
        let font = UIFont.systemFont(ofSize: 14)
        return SegmentioStates(defaultState: SegmentioState(backgroundColor: .clear, titleFont: font, titleTextColor: .grayChetau, titleAlpha: 1.0),
                               selectedState: SegmentioState(backgroundColor: .clear, titleFont: font, titleTextColor: .coral, titleAlpha: 1.0),
                               highlightedState: SegmentioState(backgroundColor: .whiteSmoke, titleFont: font, titleTextColor: .grayChetau, titleAlpha: 1.0))
    }

    private static func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 5,
            color: UIColor.coral
        )
    }

    private static func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(
            type: .topAndBottom,
            height: 1,
            color: UIColor.whiteSmoke
        )
    }

    private static func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
        return SegmentioVerticalSeparatorOptions(
            ratio: 1,
            color: UIColor.whiteSmoke
        )
    }
}
