//
//  CharactersFlowLayout.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 17.08.2023.
//

import UIKit

class CharactersFlowLayout: UICollectionViewFlowLayout {
    let cellPadding: CGFloat = 16
    
    override init() {
        super.init()
        
        let columns: CGFloat = 2
        let availableWidth = UIScreen.main.bounds.width - cellPadding * (columns + 1)
        let itemWidth = availableWidth / columns
        self.itemSize = CGSize(width: itemWidth, height: itemWidth + 48)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
