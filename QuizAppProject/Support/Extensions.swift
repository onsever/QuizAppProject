//
//  Extensions.swift
//  QuizAppProject
//
//  Created by Onurcan Sever on 2021-11-01.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let darkCharcoal = UIColor.rgb(red: 20, green: 25, blue: 51)
    static let lightCharcoal = UIColor.rgb(red: 36, green: 49, blue: 81)
    static let aqua = UIColor.rgb(red: 45, green: 131, blue: 120)
}
