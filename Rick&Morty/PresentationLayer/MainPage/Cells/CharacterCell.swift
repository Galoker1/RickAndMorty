//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 17.08.2023.
//

import Foundation
import UIKit
class CharacterCell: UICollectionViewCell{
    static let reuseIdentifier = String(describing: CharacterCell.self)
    
    var characterTapped: (() -> Void)?
    let nameLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        setupLayout()
        setupStyle()
        isUserInteractionEnabled = true
        
    }
    
    func setupLayout(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 22)
            
            
        ])
    }
    
    func setupStyle(){
        contentView.backgroundColor = AppColor.blockGray.color
        contentView.layer.cornerRadius = 16
        
        nameLabel.textColor = AppColor.textWhite.color
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10 
        imageView.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tapGesture)
        
        
        
    }
    @objc func cellTapped() {
        characterTapped?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
