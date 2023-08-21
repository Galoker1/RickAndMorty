//
//  AppColor.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 16.08.2023.
//

import Foundation
import UIKit

enum AppColor{
    case backgroundColor
    case blockGray
    case textWhite
    case textGray
    case textSecondGray
    case textGreen
    case planetBackground
    
    var color: UIColor{
        switch self{
        case .backgroundColor:
            return UIColor(hex:"#040C1E")
        case .blockGray:
            return UIColor(hex:"#262A38")
        case .textWhite:
            return UIColor(hex:"#FFFFFF")
        case .textGray:
            return UIColor(hex:"#C4C9CE")
        case .textSecondGray:
            return UIColor(hex:"#93989C")
        case .textGreen:
            return UIColor(hex:"#47C60B")
        case .planetBackground:
            return UIColor(hex:"#191C2A")
        }
    }
}
