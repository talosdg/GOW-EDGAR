//
//  LabelExtensions.swift
//  GOW
//
//  Created by Edgar Vargas on 13/03/25.
//
import UIKit


extension UILabel{
    
    func setCustomFont(fontName: String, size: CGFloat, textStyle : UIFont.TextStyle) {
        guard let customFont = UIFont(name: fontName, size: size) else {
            self.font = UIFont.systemFont(ofSize: size)
            return
        }
        self.font = customFont
        
        // es una opcion de acesibilidad, se agregó arriba , textStyle : UIFont.TextStyle
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        self.font = fontMetrics.scaledFont(for: customFont) // fuente por escalar
        self.adjustsFontForContentSizeCategory = true // sea activa
    }
}

