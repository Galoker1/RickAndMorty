//
//  DinamicHerightCollectionView.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 17.08.2023.
//

import Foundation
import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()

        guard !CGSizeEqualToSize(bounds.size, intrinsicContentSize)
        else { return }

        invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

