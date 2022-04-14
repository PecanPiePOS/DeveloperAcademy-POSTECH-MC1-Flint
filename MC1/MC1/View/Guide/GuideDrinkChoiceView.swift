//
//  GuideDrinkChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideDrinkChoiceView: View {
    @State var isGuideShoppingCartView = false
    @Binding var menu: Menu
    @Binding var count: Int
    @Binding var isLargeSet: Bool
    @Binding var sideMenu: String
    @State var drink: String = ""
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Binding var isFinish: Bool
    
    var body: some View {
        if isGuideShoppingCartView{
            GuideFinalMenuCheckView(menu: $menu, count: $count, isSetMenu: .constant(true), isLargeSet: $isLargeSet, sideMenu: $sideMenu, drink: $drink, isFinish: $isFinish)
        } else {
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack {
                    VStack{
                        Image("mcdonaldLogo")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                        
                        Text(menu.name + " 세트")
                            .foregroundColor(.grayColor)
//                            .font(.mainFont)
                            .font(.caption)
                            .padding(.vertical)
                        
                        Text(sideMenu)
                            .foregroundColor(.grayColor)
//                            .font(.mainFont)
                            .font(.caption)
                            .padding(.vertical)
                        
                        Text("세트메뉴 음료를 선택해주세요.")
                            .foregroundColor(.grayColor)
//                            .font(.mainFont)
                            .font(.caption)
                            .padding(.vertical)
                        
                        Text("주문 확인하기")
                            .foregroundColor(.grayColor)
//                            .font(.mainFont)
                            .font(.caption)
                            .padding(.vertical)
                        
                        Spacer()
                    }
                    .frame(width: 120, alignment: .center)
                    
                    Divider()
                    
                    VStack {
                        HStack {
                            Text(menu.name + " 세트")
                                .foregroundColor(.grayColor)
//                                .font(.mainFont)
                                .font(.caption)
                            
                            Text("영양 정보")
                                .foregroundColor(.grayColor)
//                                .font(.mainFont)
                                .font(.caption)
                                .padding()
                                .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        }
                        
                        Text("세트메뉴 음료를 선택해주세요")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                        
                        ScrollView{
                            LazyVGrid(columns: columns) {
                                ForEach(mcdonaldDrink, id: \.self){ d in
                                    Button(action: {
                                        drink=d
                                        isGuideShoppingCartView=true
                                    }) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 2)
                                                .foregroundColor(d == "코카 콜라" ? Color.primaryColor : Color.whiteColor)
                                                .overlay(
                                                            RoundedRectangle(cornerRadius: 2)
                                                                .stroke(Color.gray, lineWidth: 1)
                                                        )
                                            
                                            VStack{
                                                Image(d)
                                                    .resizable()
                                                    .scaledToFit()
                                                Text(d)
                                //                    .font(Font.mainFont)
                                                    .font(.caption)
                                                    .foregroundColor(Color.grayColor)
                                            }
                                        }
                                        .padding(.horizontal)
                                        .frame(width: 100, height: 110)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .frame(height: 650)
        }
    }
}

struct GuideDrinkChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000, setPrice: 6000)
    static var previews: some View {
        GuideDrinkChoiceView(menu: $menu, count: .constant(1), isLargeSet: .constant(true), sideMenu: .constant("사이드메뉴"), isFinish: .constant(false))
    }
}
