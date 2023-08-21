//
//  CharacterView.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 18.08.2023.
//

import Foundation
import UIKit

class CharacterView: UIView {
    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    private let topView = UIView()
    private let navbar = UINavigationBar()
    let backButton = UIButton()
    
    let avatar = UIImageView()
    let nameTitle = UILabel()
    let status = UILabel()
    
    private let infoTitle = UILabel()
    private let infoStack = UIView()
    private let speciesKey = UILabel()
    private let speciesValue = UILabel()
    private let typeKey = UILabel()
    private let typeValue = UILabel()
    private let genderKey = UILabel()
    private let genderValue = UILabel()
    
    private let originTitle = UILabel()
    private let originView = UIView()
    private let planetBackground = UIView()
    private let planetImage = UIImageView(image: UIImage(named: "Planet"))
    private let planetName = UILabel()
    private let planetType = UILabel()
    
    private let episodesTitle = UILabel()
    let episodesTable = DynamicHeightTableView()
    weak var delegate: CharacterViewController?
    
 
    func setupLayout(){
        let scrollContentGuide = scrollView.contentLayoutGuide

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        navbar.translatesAutoresizingMaskIntoConstraints = false
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        status.translatesAutoresizingMaskIntoConstraints = false

        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        
        speciesKey.translatesAutoresizingMaskIntoConstraints = false
        speciesValue.translatesAutoresizingMaskIntoConstraints = false
        
        typeKey.translatesAutoresizingMaskIntoConstraints = false
        typeValue.translatesAutoresizingMaskIntoConstraints = false
        
        genderKey.translatesAutoresizingMaskIntoConstraints = false
        genderValue.translatesAutoresizingMaskIntoConstraints = false
        
        originView.translatesAutoresizingMaskIntoConstraints = false
        originTitle.translatesAutoresizingMaskIntoConstraints = false
        
        planetBackground.translatesAutoresizingMaskIntoConstraints = false
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetType.translatesAutoresizingMaskIntoConstraints = false
        
        
        episodesTable.translatesAutoresizingMaskIntoConstraints = false
        episodesTitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(navbar)

        scrollContainerView.addSubview(avatar)
        scrollContainerView.addSubview(nameTitle)
        scrollContainerView.addSubview(status)
        scrollView.addSubview(backButton)
        scrollContainerView.addSubview(infoTitle)
        scrollContainerView.addSubview(infoStack)
        
        infoStack.addSubview(speciesKey)
        infoStack.addSubview(speciesValue)
        infoStack.addSubview(typeKey)
        infoStack.addSubview(typeValue)
        infoStack.addSubview(genderKey)
        infoStack.addSubview(genderValue)
//
        scrollContainerView.addSubview(originTitle)
        scrollContainerView.addSubview(originView)
        
        originView.addSubview(planetName)
        originView.addSubview(planetType)
        originView.addSubview(planetBackground)
        planetBackground.addSubview(planetImage)
        

        
        scrollContainerView.addSubview(episodesTitle)
        scrollContainerView.addSubview(episodesTable)
        
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
            
            navbar.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 0),
            navbar.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            navbar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navbar.heightAnchor.constraint(equalToConstant: 32),
            
            backButton.topAnchor.constraint(equalTo: navbar.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: navbar.leadingAnchor),
            backButton.bottomAnchor.constraint(equalTo: navbar.bottomAnchor),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            avatar.topAnchor.constraint(equalTo: navbar.bottomAnchor, constant: 16),
            avatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 148),
            avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor),
            
            nameTitle.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 24),
            nameTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            status.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 8),
            status.leadingAnchor.constraint(equalTo: leadingAnchor),
            status.trailingAnchor.constraint(equalTo: trailingAnchor),
            status.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoTitle.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 24),
            infoTitle.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            infoTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoStack.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 16),
            infoStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            infoStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            infoStack.heightAnchor.constraint(equalToConstant: 124),
            
            speciesKey.topAnchor.constraint(equalTo: infoStack.topAnchor, constant: 16),
            speciesKey.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 16),
            speciesKey.heightAnchor.constraint(equalToConstant: 20),
            speciesKey.widthAnchor.constraint(equalToConstant: 70),
            
            typeKey.topAnchor.constraint(equalTo: speciesKey.bottomAnchor, constant: 16),
            typeKey.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 16),
            typeKey.heightAnchor.constraint(equalToConstant: 20),
            typeKey.widthAnchor.constraint(equalToConstant: 70),
            
            genderKey.topAnchor.constraint(equalTo: typeKey.bottomAnchor, constant: 16),
            genderKey.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 16),
            genderKey.heightAnchor.constraint(equalToConstant: 20),
            genderKey.widthAnchor.constraint(equalToConstant: 70),
            
            speciesValue.topAnchor.constraint(equalTo: infoStack.topAnchor, constant: 16),
            speciesValue.leadingAnchor.constraint(equalTo: speciesKey.trailingAnchor, constant: 10),
            speciesValue.heightAnchor.constraint(equalToConstant: 20),
            speciesValue.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor, constant: -16),
            
            typeValue.topAnchor.constraint(equalTo: speciesValue.bottomAnchor, constant: 16),
            typeValue.leadingAnchor.constraint(equalTo: typeKey.trailingAnchor, constant: 10),
            typeValue.heightAnchor.constraint(equalToConstant: 20),
            typeValue.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor, constant: -16),
            
            genderValue.topAnchor.constraint(equalTo: typeValue.bottomAnchor, constant: 16),
            genderValue.leadingAnchor.constraint(equalTo: genderKey.trailingAnchor, constant: 10),
            genderValue.heightAnchor.constraint(equalToConstant: 20),
            genderValue.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor, constant: -16),
            
            originTitle.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 24),
            originTitle.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            originTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            originTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            originView.topAnchor.constraint(equalTo: originTitle.bottomAnchor, constant: 16),
            originView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            originView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            originView.heightAnchor.constraint(equalToConstant: 80),
            
            planetBackground.topAnchor.constraint(equalTo: originView.topAnchor, constant: 8),
            planetBackground.leadingAnchor.constraint(equalTo: originView.leadingAnchor, constant: 8),
            planetBackground.heightAnchor.constraint(equalToConstant: 64),
            planetBackground.widthAnchor.constraint(equalToConstant: 64),
            
            planetImage.topAnchor.constraint(equalTo: planetBackground.topAnchor, constant: 20),
            planetImage.leadingAnchor.constraint(equalTo: planetBackground.leadingAnchor, constant: 20),
            planetImage.widthAnchor.constraint(equalToConstant: 24),
            planetImage.heightAnchor.constraint(equalToConstant: 24),
            
            planetName.topAnchor.constraint(equalTo: originView.topAnchor, constant: 16),
            planetName.leadingAnchor.constraint(equalTo: planetBackground.trailingAnchor, constant: 16),
            planetName.heightAnchor.constraint(equalToConstant: 22),
            planetName.trailingAnchor.constraint(equalTo: originView.trailingAnchor, constant: 16),
            
            planetType.topAnchor.constraint(equalTo: planetName.bottomAnchor, constant: 8),
            planetType.leadingAnchor.constraint(equalTo: planetBackground.trailingAnchor, constant: 16),
            planetType.heightAnchor.constraint(equalToConstant: 18),
            planetType.trailingAnchor.constraint(equalTo: originView.trailingAnchor, constant: 16),
            
            
            episodesTitle.topAnchor.constraint(equalTo: originView.bottomAnchor, constant: 24),
            episodesTitle.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            episodesTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            episodesTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            episodesTable.topAnchor.constraint(equalTo: episodesTitle.bottomAnchor, constant: 16),
            episodesTable.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
            episodesTable.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            episodesTable.heightAnchor.constraint(greaterThanOrEqualToConstant: 300),
            episodesTable.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor),
            
           
            
            ])
    }
    func setupStyle(){
        scrollView.backgroundColor = AppColor.backgroundColor.color
        backButton.setImage(UIImage(systemName:"chevron.backward"), for: .normal)
        backButton.tintColor = AppColor.textWhite.color
        
        
        avatar.contentMode = .scaleAspectFill
        avatar.layer.cornerRadius = 16
        avatar.clipsToBounds = true
        
        nameTitle.text = delegate?.character.name
        nameTitle.font = .systemFont(ofSize: 22,weight: .semibold)
        nameTitle.textColor = AppColor.textWhite.color
        nameTitle.textAlignment = .center
        
        status.text = delegate?.character.status
        status.font = .systemFont(ofSize: 16,weight: .light)
        status.textColor = AppColor.textGreen.color
        status.textAlignment = .center
        
        infoTitle.text = "Info"
        infoTitle.font = .systemFont(ofSize: 17, weight: .medium)
        infoTitle.textColor = AppColor.textWhite.color
        
        infoStack.backgroundColor = AppColor.blockGray.color
        infoStack.layer.cornerRadius = 16
        
        speciesKey.text = "Species:"
        speciesKey.font = .systemFont(ofSize: 16, weight: .medium)
        speciesKey.textColor = AppColor.textGray.color
        speciesKey.textAlignment = .left
        
        typeKey.text = "Type::"
        typeKey.font = .systemFont(ofSize: 16, weight: .medium)
        typeKey.textColor = AppColor.textGray.color
        typeKey.textAlignment = .left
        
        genderKey.text = "Gender:"
        genderKey.font = .systemFont(ofSize: 16, weight: .medium)
        genderKey.textColor = AppColor.textGray.color
        genderKey.textAlignment = .left
        
        speciesValue.text = delegate?.character.species
        speciesValue.font = .systemFont(ofSize: 16, weight: .medium)
        speciesValue.textColor = AppColor.textWhite.color
        speciesValue.textAlignment = .right
        
        typeValue.text = delegate?.character.type == "" ? "None" : delegate?.character.type
        typeValue.font = .systemFont(ofSize: 16, weight: .medium)
        typeValue.textColor = AppColor.textWhite.color
        typeValue.textAlignment = .right
        
        genderValue.text = delegate?.character.gender
        genderValue.font = .systemFont(ofSize: 16, weight: .medium)
        genderValue.textColor = AppColor.textWhite.color
        genderValue.textAlignment = .right
        
        originTitle.text = "Origin"
        originTitle.font = .systemFont(ofSize: 17, weight: .medium)
        originTitle.textColor = AppColor.textWhite.color
        
        originView.backgroundColor = AppColor.blockGray.color
        originView.layer.cornerRadius = 16
        
        planetBackground.backgroundColor = AppColor.planetBackground.color
        planetBackground.layer.cornerRadius = 10
        
        planetName.text = delegate?.planet?.name ?? "Unknown"
        planetName.textColor = AppColor.textWhite.color
        planetName.textAlignment = .left
        planetName.font = .systemFont(ofSize: 17, weight: .medium)
        
        planetType.text = delegate?.planet?.type
        planetType.textColor = AppColor.textGreen.color
        planetType.textAlignment = .left
        planetType.font = .systemFont(ofSize: 13, weight: .medium)
        
        episodesTitle.text = "Episodes"
        episodesTitle.font = .systemFont(ofSize: 17, weight: .medium)
        episodesTitle.textColor = AppColor.textWhite.color
        
        
        episodesTable.delegate = self.delegate
        episodesTable.dataSource = self.delegate
        episodesTable.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.reuseIdentifier)
        episodesTable.isScrollEnabled = false
        episodesTable.backgroundColor = AppColor.backgroundColor.color
        
        
        
    }
    
    @objc private func goBack(){
        print("кнопка была нажата")
        delegate?.closeVC()
    }
    
    func reloadView(){
        episodesTable.reloadData()
    }
    func loadData(){
        delegate?.loadData()
    }
    
    func didLoad(){

        delegate?.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.setupLayout()
            self.setupStyle()
        }


    }
}
