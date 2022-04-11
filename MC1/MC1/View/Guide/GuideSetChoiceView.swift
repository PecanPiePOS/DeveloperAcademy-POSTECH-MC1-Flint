//
//  GuideSetChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideSetChoiceView: View {
    @State var isGuideMenuCheckView = false
    @State var isSetMenu = false
    @Binding var menu: Menu
    
    var body: some View {
        if isGuideMenuCheckView{
            GuideMenuCheckView(menu: $menu, isSetMenu: $isSetMenu)
        } else {
            ZStack{
                Color.whiteColor
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Image("mcdonaldLogo")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                        Text(menu.name)
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                    }
                    
                    Spacer()
                    
                    Text("세트로 주문하시겠습니까?")
                        .foregroundColor(.grayColor)
                        .font(.titleFont)
                    
                    HStack{
                        Button(action: {
                            isGuideMenuCheckView=true
                            isSetMenu=true
                        }) {
                            ZStack {
                                selectedMenuList[iteration].isSet ? Color.primaryColor : Color.whiteColor
                                
                                Text("세트 선택")
                                    .foregroundColor(.grayColor)
                                    .font(.mainFont)
                            }
                            .frame(width: 150, height: 200, alignment: .center)
                            .border(Color.grayColor)
                        }
                        
                        Button(action: {
                            isGuideMenuCheckView=true
                            isSetMenu=false
                        }) {
                            ZStack {
                                selectedMenuList[iteration].isSet ? Color.whiteColor : Color.primaryColor
                                
                                Text("단품 선택")
                                    .foregroundColor(.grayColor)
                                    .font(.mainFont)
                            }
                            .frame(width: 150, height: 200, alignment: .center)
                            .border(Color.grayColor)
                        }
                    }
                    
                    Button(action: {}) {
                        Text("취소")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .frame(width: 310, height: 50, alignment: .center)
                            .border(Color.grayColor)
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 600)
        }
    }
}
//
//struct GuideSetChoiceView_Previews: PreviewProvider {
//    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000, setPrice: 6000)
//    static var previews: some View {
//        GuideSetChoiceView(menu: $menu)
//    }
//}
