//
//  GuideShoppingCartView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideFinalMenuCheckView: View {
    @Binding var menu: Menu
    @Binding var count: Int
    @Binding var isLargeSet: Bool
    @Binding var sideMenu: String
    @Binding var drink: String
    
    var body: some View {
        ZStack{
            Color.whiteColor
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    Text(menu.name + (isLargeSet ? "세트" : ""))
                    Text("₩"+String(menu.price + (isLargeSet ? 600 : 0)))
                }
                .foregroundColor(.grayColor)
                .font(.titleFont)
                
                altImage
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.grayColor)
                
                HStack{
                    Button(action: {
                        if count>1{
                            count-=1
                        }
                    }) {
                        Text("-")
                            .padding()
                            .border(Color.grayColor)
                    }
                    .disabled(count>1 ? false : true)
                    
                    Text(String(count))
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                        .padding()
                        .padding(.horizontal, 50)
                        .border(Color.grayColor)
                    
                    Button(action: {
                        count+=1
                    }) {
                        Text("+")
                            .padding()
                            .border(Color.grayColor)
                    }
                }
                
                Button(action: {}) {
                    Text("장바구니에 추가")
                        .foregroundColor(.grayColor)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color.primaryColor)
                }
            }
        }
    }
}

struct GuideShoppingCartView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000)
    static var previews: some View {
        GuideFinalMenuCheckView(menu: $menu, count: .constant(1), isLargeSet: .constant(true), sideMenu: .constant("사이드메뉴"), drink: .constant("음료"))
    }
}
