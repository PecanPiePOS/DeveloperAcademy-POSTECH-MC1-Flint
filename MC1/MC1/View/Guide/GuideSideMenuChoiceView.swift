//
//  GuideSideMenuChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideSideMenuChoiceView: View {
    @Binding var isLargeSet: Bool
    @Binding var menu: Menu
    
    var body: some View {
        ZStack {
            Color.whiteColor
            
            HStack {
                VStack{
                    Text(menu.name + (isLargeSet ? " 라지" : "") + " 세트")
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                    
                    
                }
                .frame(width: 120, height: .infinity, alignment: .center)
                
                Divider()
                
                Text(menu.name + (isLargeSet ? " 라지" : "") + " 세트")
                    .foregroundColor(.grayColor)
                    .font(.mainFont)
            }
        }
    }
}

struct GuideSideMenuChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000)
    static var previews: some View {
        GuideSideMenuChoiceView(isLargeSet: .constant(true), menu: $menu)
    }
}
