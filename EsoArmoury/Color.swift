//
//  Color.swift
//  EsoArmoury
//
//  Created by walnut on 9/5/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation
import SwiftUI

    
func getColor(color: String) -> Color {
    switch color {
        case ".red":            return Color("textHealth")
        case ".light-red":      return Color("textHealthLight")
        case ".green":          return Color("textStamina")
        case ".light-green":    return Color("textStaminaLight")
        case ".blue":           return Color("textMagica")
        case ".light-blue":     return Color("textMagicaLight")
        case ".primary":        return .primary
        case ".yellow":         return Color("textSpecial")
    default:
        return .primary
    }
}


//func UpdateColor(text: String) -> NSMutableAttributedString {
//    let ogText = text
//    var updatedText = NSMutableAttributedString(string: text)
//    updatedText = CheckTextForMagica(originalText: ogText)
//    updatedText = CheckTextForStamina(originalText: ogText)
//    updatedText = CheckTextForHealth(originalText: ogText)
//    return updatedText
//}

//func CheckTextForMagica(originalText: String) -> NSMutableAttributedString {
//    let keyword = "Max Magica"
//    let color = Color(.blue)
//    return UpdateTextColor(originalText: originalText, updatedText: NSMutableAttributedString, keyword: keyword, color: color)
//}
//
//func CheckTextForStamina(originalText: String) -> NSMutableAttributedString {
//    let keyword = "Max Stamina"
//    let color = Color(.green)
//    return UpdateTextColor(originalText: originalText, updatedText: NSMutableAttributedString, keyword: keyword, color: color)
//}
//
//func CheckTextForHealth(originalText: String) -> NSMutableAttributedString {
//    let keyword = "Max Health"
//    let color = Color(.red)
//    return UpdateTextColor(originalText: originalText, updatedText: NSMutableAttributedString, keyword: keyword, color: color)
//}

func UpdateTextColor(text: String) -> NSMutableAttributedString {
    let initalString = text
    let magica = "Max Magica"
    let magicaColor = Color(.blue)
    
    let updatedText = NSMutableAttributedString(string: text)
    let magicaRange = (initalString as NSString).range(of: magica)
    
    updatedText.addAttribute(NSAttributedString.Key.foregroundColor, value: magicaColor, range: magicaRange)
    
    return updatedText
}
