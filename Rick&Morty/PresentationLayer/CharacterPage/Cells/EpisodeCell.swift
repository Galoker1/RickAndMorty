//
//  EpisodeCell.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 20.08.2023.
//

import Foundation
import UIKit

class EpisodeCell:UITableViewCell{
    static let reuseIdentifier = String(describing: EpisodeCell.self)
    
    var characterTapped: (() -> Void)?
    var cellContainerView = UIView()
    var nameLabel = UILabel()
    var numLabel = UILabel()
    var dateLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            setupStyle()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setupLayout(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        cellContainerView.translatesAutoresizingMaskIntoConstraints = false
     //   self.translatesAutoresizingMaskIntoConstraints = false
      
        contentView.addSubview(cellContainerView)
        cellContainerView.addSubview(nameLabel)
        cellContainerView.addSubview(numLabel)
        cellContainerView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            cellContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cellContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cellContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cellContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                        
            
            nameLabel.topAnchor.constraint(equalTo: cellContainerView.topAnchor,constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor,constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            numLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 16),
            numLabel.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor,constant: 16),
            numLabel.heightAnchor.constraint(equalToConstant: 22),
            numLabel.widthAnchor.constraint(equalToConstant: 140),
            
            dateLabel.topAnchor.constraint(equalTo: numLabel.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: numLabel.leadingAnchor,constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            
            
        ])
    }
    
    func setupStyle(){
        cellContainerView.backgroundColor = AppColor.blockGray.color
        self.backgroundColor = AppColor.backgroundColor.color
        contentView.layer.cornerRadius = 16
        
        nameLabel.textColor = AppColor.textWhite.color
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 17, weight: .medium)
           
        numLabel.textColor = AppColor.textGreen.color
        numLabel.textAlignment = .left
        numLabel.font = .systemFont(ofSize: 13, weight: .light)
        
        dateLabel.textColor = AppColor.textGray.color
        dateLabel.textAlignment = .right
        dateLabel.font = .systemFont(ofSize: 13, weight: .light)
        
        cellContainerView.layer.cornerRadius = 16
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tapGesture)
        
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Не вызываем super.setSelected(_:animated:) для отключения анимации
    }
    
    @objc func cellTapped() {
        characterTapped?()
    }
    
}
