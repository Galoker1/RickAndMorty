//
//  DinamicHeightTableView.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 21.08.2023.
//

import Foundation
import UIKit

class DynamicHeightTableView: UITableView {
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
