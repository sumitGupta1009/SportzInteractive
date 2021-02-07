//
//  MatchInfoViewController.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 06/02/21.
//

import UIKit

class MatchInfoViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName:"InfoCollectionCell", bundle: nil), forCellWithReuseIdentifier:"InfoCollectionCell")
            collectionView.registerView(MatchInfoReusableView.self, viewOfKind: UICollectionView.elementKindSectionHeader)
            if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            }
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    var infoTitles: [String]? = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MatchInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return infoTitles?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: InfoCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        guard let infoTitle = infoTitles, let title = infoTitle[safe: indexPath.row] else { return cell }
        cell.configCell(title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let loadingView: MatchInfoReusableView = collectionView.dequeueReusableView(forIndexPath: indexPath, viewOfKind: kind)
        loadingView.configView("Highlights")
        return loadingView
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if infoTitles?.count ?? 0 > 0{
            return CGSize(width: collectionView.frame.width, height: 40)
        } else {
            return .zero
        }
    }
}
