//
//  GuideSideMenuChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideSideMenuChoiceView: View {
    @State var isGuideDrinkChoiceView = false
    @Binding var menu: Menu
    @Binding var count: Int
    @Binding var isLargeSet: Bool
    @Binding var isFinish: Bool
    
    @State var sideMenu: String = ""
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        if isGuideDrinkChoiceView{
            GuideDrinkChoiceView(menu: $menu, count: $count, isLargeSet: $isLargeSet, sideMenu: $sideMenu, isFinish: $isFinish)
        } else {
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack {
                    VStack{
                        Image("mcdonaldLogo")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                        
                        Text(menu.name + (isLargeSet ? " 라지" : "") + " 세트")
                            .foregroundColor(.grayColor)
//                            .font(.mainFont)
                            .font(.caption)
                            .padding(.vertical)
                        
                        Text("세트메뉴 사이드를 선택해주세요.")
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
                            Text(menu.name + (isLargeSet ? " 라지" : "") + " 세트")
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
                        
                        Text("세트 메뉴 사이드를 선택해주세요")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                        
                        ScrollView{
                            LazyVGrid(columns: columns) {
                                Button(action: {
                                    sideMenu="후렌치 후라이"
                                    isGuideDrinkChoiceView=true
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .foregroundColor(.primaryColor)
                                            .overlay(
                                                        RoundedRectangle(cornerRadius: 2)
                                                            .stroke(Color.gray, lineWidth: 1)
                                                    )
                                        
                                        VStack{
                                            Image("후렌치 후라이")
                                                .resizable()
                                                .scaledToFit()
                                            Text("후렌치 후라이")
                            //                    .font(Font.mainFont)
                                                .font(.caption)
                                                .foregroundColor(Color.grayColor)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .frame(width: 100, height: 110)
                                }
                                
                                Button(action: {
                                    sideMenu="맥너겟"
                                    isGuideDrinkChoiceView=true
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .foregroundColor(.whiteColor)
                                            .overlay(
                                                        RoundedRectangle(cornerRadius: 2)
                                                            .stroke(Color.gray, lineWidth: 1)
                                                    )
                                        
                                        VStack{
                                            Image("맥너겟")
                                                .resizable()
                                                .scaledToFit()
                                            Text("맥너겟")
                            //                    .font(Font.mainFont)
                                                .font(.caption)
                                                .foregroundColor(Color.grayColor)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .frame(width: 100, height: 110)
                                }
                                
                                Button(action: {
                                    sideMenu="골든 모짜렐라 치즈스틱"
                                    isGuideDrinkChoiceView=true
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .foregroundColor(.whiteColor)
                                            .overlay(
                                                        RoundedRectangle(cornerRadius: 2)
                                                            .stroke(Color.gray, lineWidth: 1)
                                                    )
                                        
                                        VStack{
                                            Image("골든 모짜렐라 치즈스틱")
                                                .resizable()
                                                .scaledToFit()
                                            Text("골든 모짜렐라 치즈스틱")
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
            .frame(height: 650)
        }
    }
}

struct GuideSideMenuChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000, setPrice: 6000)
    static var previews: some View {
        GuideSideMenuChoiceView(menu: $menu, count: .constant(1), isLargeSet: .constant(true), isFinish: .constant(false))
    }
}
