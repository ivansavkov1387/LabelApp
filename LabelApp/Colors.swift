//
//  Colors.swift
//  LabelApp
//
//  Created by Иван on 5/26/21.
//

import Foundation
import UIKit

enum Color: String {
    case red
    case blue
    case green
    case black
    case pink
    case cyan
    case yellow
    
    var create: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .black:
            return UIColor.black
        case .pink:
            return UIColor.systemPink
        case .cyan:
            return UIColor.cyan
        case .yellow:
            return UIColor.yellow
        }
    }
}
