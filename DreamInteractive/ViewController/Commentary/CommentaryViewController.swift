//
//  CommentaryViewController.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 06/02/21.
//

import UIKit

class CommentaryViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName:"InfoCollectionCell", bundle: nil), forCellWithReuseIdentifier:"InfoCollectionCell")
            collectionView.registerView(MatchInfoReusableView.self, viewOfKind: UICollectionView.elementKindSectionHeader)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var notesTitle: [[String]]? = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension CommentaryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var subArrayNotes: (Int) -> [String]? {
        return { [weak self] section in
            guard let strongSelf = self, let notes = strongSelf.notesTitle?[section] else { return nil }
            return notes
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return notesTitle?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notesTitle?[section].count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: InfoCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        guard let title = subArrayNotes(indexPath.section)?[safe: indexPath.row] else { return cell }
        cell.configCell(title, alignment: .left)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let loadingView: MatchInfoReusableView = collectionView.dequeueReusableView(forIndexPath: indexPath, viewOfKind: kind)
        loadingView.configView("Notes")
        return loadingView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let title = subArrayNotes(indexPath.section)?[safe: indexPath.row] else { return .zero }

        let height = title.height(withConstrainedWidth: collectionView.frame.width - 32, font: UIFont.systemFont(ofSize: 14))
        return CGSize(width: collectionView.frame.width - 32, height: height + 16)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if notesTitle?.count ?? 0 > 0, section == 0 {
            return CGSize(width: collectionView.frame.width, height: 40)
        } else {
            return .zero
        }
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

