//
//  MainView.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 16.08.2023.
//
import Foundation
import UIKit

class MainView: UIView {
    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    private let topView = UIView()
    private let topLabel = UILabel()
    
    weak var delegate: MainViewController?
    
    let layout = CharactersFlowLayout()
    
    lazy var collectionView:UICollectionView = DynamicHeightCollectionView(frame: .zero,collectionViewLayout: layout)
    func setupLayout(){
        let scrollContentGuide = scrollView.contentLayoutGuide

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(topView)
        topView.addSubview(topLabel)
        scrollContainerView.addSubview(collectionView)
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            topView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 32),
            
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 31),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor),
            
            ])
    }
    func setupStyle(){
        scrollView.backgroundColor = AppColor.backgroundColor.color
        
        topLabel.text = "Characters"
        topLabel.textColor = AppColor.textWhite.color
        topLabel.font = .systemFont(ofSize: 28, weight: .bold)
        scrollView.delegate = self.delegate
        collectionView.dataSource = self.delegate
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseIdentifier)
        collectionView.register(LoadingCell.self, forCellWithReuseIdentifier: LoadingCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
    }
    func loadData(){
       
    }
    
    func didLoad(){
        setupStyle()
        setupLayout()
        
    }
    func reloadView(){
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }

    }
}
