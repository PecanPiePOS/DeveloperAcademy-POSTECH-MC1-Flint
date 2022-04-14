//
//  MenuCellView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

struct MenuCellView: View {
    @Binding var menu: Menu
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.primaryColor)
            
            VStack{
                Spacer()
                Image(menu.name)
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text(menu.name)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.grayColor)
                Spacer()
                Text(String(menu.price)+"원")
                    .font(Font.mainFont)
                    .foregroundColor(Color.grayColor)
                Spacer()
            }
        }
        .padding()
        .frame(width: 200, height: 300, alignment: .center)
    }
}

struct MenuCellView_Previews: PreviewProvider {
    @State static var menu: Menu = Menu(name: "name", tag: ["tag"], price: 1000, setPrice: 6000)

    static var previews: some View {
        Group {
            MenuCellView(menu: $menu)
                .previewLayout(.fixed(width: 200, height: 300))
        }
    }
}
