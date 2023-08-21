//
//  LoadingCell.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 17.08.2023.
//

import Foundation
import UIKit

class LoadingCell: UICollectionViewCell{
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    static let reuseIdentifier = String(describing: LoadingCell.self)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupUI() {
            // Настраиваем внешний вид внутри ячейки
            
            // Добавляем activityIndicator
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(activityIndicator)
            
            // Располагаем activityIndicator по центру ячейки
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            startLoading()
        }
        
        func startLoading() {
            activityIndicator.startAnimating()
        }
        
        func stopLoading() {
            activityIndicator.stopAnimating()
        }
    }
