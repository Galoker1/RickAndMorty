//
//  CharacterViewControllerAssembly.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 18.08.2023.
//

import Foundation


import UIKit

struct CharacterViewControllerAssembly {
    func create(character:Character) -> UIViewController {
        let characterView = CharacterView()
        let networkService =  NetworkManager.shared

        let controller = CharacterViewController(mainView: characterView,character: character)

        characterView.delegate = controller

        return controller
    }
}
