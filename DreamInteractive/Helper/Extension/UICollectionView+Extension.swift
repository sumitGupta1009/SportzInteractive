//
//  UICollectionView+Extension.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 07/02/21.
//

import Foundation
import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        let reuserId = String(describing: T.self)
        register(cellType, forCellWithReuseIdentifier: reuserId)
    }
    
    func registerNibWithBundle<T: UICollectionViewCell>(_: T.Type) {
        let reuserId = String(describing: T.self)
        let nib = UINib(nibName: reuserId, bundle: Bundle(for: T.self))
        register(nib, forCellWithReuseIdentifier: reuserId)
    }

    func dequeueReusableView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath, viewOfKind: String) -> T {
        let name = String(describing: T.self)
        guard let cell = dequeueReusableSupplementaryView(ofKind: viewOfKind, withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Could not dequeue Reusable View with identifier: \(name)")
        }
        return cell
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_ identifier: String? = nil, forIndexPath indexPath: IndexPath) -> T {
        var cellName = String(describing: T.self)
        if let id = identifier {
            cellName = id
        }
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellName)")
        }
        return cell
    }
    
    func registerView<T: UICollectionReusableView>(_: T.Type, viewOfKind: String) {
        let name = String(describing: T.self)
        let nib = UINib(nibName: name, bundle: Bundle(for: T.self))
        register(nib, forSupplementaryViewOfKind: viewOfKind, withReuseIdentifier: name)
    }
}
