//
//  Preference.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

extension Color{
    init(hex: String){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
    
    static let primaryColor = Color(hex: "#FFE456")
    static let whiteColor = Color(hex: "#F9F9F9")
    static let grayColor = Color(hex: "#1F1E1E")
}

extension Font{
    static let mainFont = Font.system(size: 18)
    static let titleFont = Font.system(size: 32, weight: .bold)
}

let altImage = Image(systemName: "nosign")
