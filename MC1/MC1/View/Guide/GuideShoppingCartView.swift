//
//  GuideShoppingCartView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideShoppingCartView: View {
    @State var isGuideMenuChoiceView = false
    @State var isGuidePayMethodChoiceView = false
    var body: some View {
        if isGuideMenuChoiceView{
            GuideMenuChoiceView()
        } else if isGuidePayMethodChoiceView{
            GuidePayMethodChoiceView()
        }else{
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView{
                        VStack {
                            Text("주문")
                                .foregroundColor(.grayColor)
                            .font(.titleFont)
                            
                            ForEach(guideShoppingList){ menu in
                                HStack{
                                    Button(action: {}) {
                                        Text("취소")
                                            .foregroundColor(.grayColor)
                                            .frame(width: 30, height: 30, alignment: .center)
                                            .border(Color.grayColor)
                                    }
                                    
                                    altImage
                                        .frame(width: 30, height: 30, alignment: .center)
                                    
                                    VStack(alignment: .leading){
                                        Text(menu.menu.name + (menu.isLargeSet ? " 라지 " : " ") + (menu.isSetMenu ? "세트" : ""))
                                            .font(.mainFont)
                                        if menu.isSetMenu{
                                            Text(menu.drink + ", " + menu.sideMenu)
                                        }
                                        Text("세부정보표기")
                                            .padding()
                                            .border(Color.grayColor)
                                    }
                                    .foregroundColor(.grayColor)
                                    
                                    Button(action: {}) {
                                        Text("-")
                                            .padding()
                                            .border(Color.grayColor)
                                    }
                                    Text(String(menu.quantity))
                                        .foregroundColor(.grayColor)
                                        .padding()
                                        .border(Color.grayColor)
                                    Button(action: {}) {
                                        Text("+")
                                            .padding()
                                            .border(Color.grayColor)
                                    }
                                    
                                    Text("₩"+String((menu.menu.setPrice+(menu.isLargeSet ? 600 : 0))*menu.quantity))
                                        .foregroundColor(.grayColor)
                                        .font(.mainFont)
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Button(action: {isGuideMenuChoiceView=true}) {
                            Text("추가 주문")
                                .foregroundColor(.grayColor)
                                .padding()
                                .frame(width: 100, height: 50, alignment: .center)
                                .border(Color.grayColor)
                        }
                        
                        Button(action: {isGuidePayMethodChoiceView=true}) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(.primaryColor)
                                
                                Text("주문 완료")
                                    .foregroundColor(.grayColor)
                                    .padding()
                            }
                                
                        }
                    }
                }
            }
        }
    }
}

struct GuideShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        GuideShoppingCartView()
    }
}
