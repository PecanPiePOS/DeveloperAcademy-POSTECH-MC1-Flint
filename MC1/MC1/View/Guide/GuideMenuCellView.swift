//
//  GuideMenuCellView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideMenuCellView: View {
    @Binding var menu: Menu
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.whiteColor)
                .border(Color.grayColor)
            
            VStack{
                Image(menu.name)
                    .resizable()
                    .scaledToFit()
                Text(menu.name)
                    .font(Font.mainFont)
                    .foregroundColor(Color.grayColor)
                Text(String(menu.price)+"원")
                    .font(Font.mainFont)
                    .foregroundColor(Color.grayColor)
            }
        }
        .padding()
        .frame(width: 100, height: 150, alignment: .center)
    }
}

struct GuideMenuCellView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000)
    static var previews: some View {
        GuideMenuCellView(menu: $menu)
    }
}
