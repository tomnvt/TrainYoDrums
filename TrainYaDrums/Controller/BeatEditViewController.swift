//
//  BeatEditViewController.swift
//  DrumTrainer
//
//  Created by NVT on 08.09.18.
//  Copyright © 2018 NVT. All rights reserved.
//

import UIKit
import CollectionViewGridLayout

class BeatEditViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    public var numberOfRows: Int = 16

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: String(describing: PathCollectionViewCell.self), bundle: nil),
                                     forCellWithReuseIdentifier: PathCollectionViewCell.identifier)

        self.collectionView.register(UINib(nibName: String(describing: CollectionReusableView.self), bundle: nil),
                                     forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                     withReuseIdentifier: CollectionReusableView.identifier)

        self.collectionView.register(UINib(nibName: String(describing: CollectionReusableView.self), bundle: nil),
                                     forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
                                     withReuseIdentifier: CollectionReusableView.identifier)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension BeatEditViewController: CollectionViewDelegateHorizontalGridLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               rowSpacingForSection section: Int) -> CGFloat {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               columnSpacingForSection section: Int) -> CGFloat {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               insetForSection section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               widthForItemAt indexPath: IndexPath, rowHeight columnHeight: CGFloat) -> CGFloat {
        return 80
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               widthForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               numberOfRowsForSection section: Int) -> Int {
        return self.numberOfRows
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select [\(indexPath.section), \(indexPath.row)]")
    }
}

extension BeatEditViewController: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 128
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PathCollectionViewCell.identifier,
                                                            for: indexPath) as? PathCollectionViewCell else {
            fatalError("Cannot retrieve PathCollectionViewCell")
        }
        cell.setIndexPath(indexPath)
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: CollectionReusableView.identifier,
                                              for: indexPath) as? CollectionReusableView else {
            fatalError("Cannot retrieve CollectionReusableView")
        }
        view.setIndexPath(indexPath, kind: kind)
        return view
    }

}