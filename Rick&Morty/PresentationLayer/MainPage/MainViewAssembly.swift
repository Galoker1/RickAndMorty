//
//  MainViewAssembly.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 17.08.2023.
//

import Foundation
import UIKit

struct MainViewControllerAssembly {
    func create() -> UIViewController {
        let mainView = MainView()
        let networkService =  NetworkManager.shared

        let controller = MainViewController(mainView: mainView, service: networkService)

        mainView.delegate = controller

        return controller
    }
}
