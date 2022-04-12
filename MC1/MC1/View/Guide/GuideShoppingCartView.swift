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
    @Binding var isFinish: Bool
    
    var body: some View {
        if isGuideMenuChoiceView{
            GuideMenuChoiceView(isFinish: $isFinish)
        } else if isGuidePayMethodChoiceView{
            GuidePayMethodChoiceView(isFinish: $isFinish)
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
                                            .font(.system(size: 7))
                                            .foregroundColor(.grayColor)
                                            .frame(width: 30, height: 20, alignment: .center)
                                            .border(Color.grayColor)
                                    }
                                    
                                    Image(menu.menu.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading){
                                        Text(menu.menu.name + (menu.isLargeSet ? " 라지 " : " ") + (menu.isSetMenu ? "세트" : ""))
//                                            .font(.mainFont)
                                            .font(.system(size: 7))
                                        if menu.isSetMenu{
                                            Text(menu.drink + ", " + menu.sideMenu)
                                                .font(.system(size: 7))
                                        }
                                        Text("세부정보표기")
                                            .font(.system(size: 7))
//                                            .padding()
                                            .border(Color.grayColor)
                                    }
                                    .foregroundColor(.grayColor)
                                    
                                    Spacer()
                                    
                                    Button(action: {}) {
                                        Text("-")
                                            .font(.system(size: 7))
                                            .frame(width: 20, height: 20, alignment: .center)
//                                            .padding()
                                            .border(Color.grayColor)
                                    }
                                    Text(String(menu.quantity))
                                        .font(.system(size: 7))
                                        .foregroundColor(.grayColor)
                                        .frame(width: 50, height: 20, alignment: .center)
//                                        .padding()
                                        .border(Color.grayColor)
                                    Button(action: {}) {
                                        Text("+")
                                            .font(.system(size: 7))
                                            .frame(width: 20, height: 20, alignment: .center)
//                                            .padding()
                                            .border(Color.grayColor)
                                    }
                                    
                                    Text("₩"+String((menu.menu.setPrice+(menu.isLargeSet ? 600 : 0))*menu.quantity))
                                        .font(.system(size: 7))
                                        .foregroundColor(.grayColor)
                                        .font(.mainFont)
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            isGuideMenuChoiceView=true
                            iteration+=1
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(iteration<selectedMenuList.count-1 ? Color.primaryColor : Color.whiteColor)
                                    .frame(width: 100, height: 50, alignment: .center)
                                    .border(Color.grayColor)
                                Text("추가 주문")
                                    .foregroundColor(.grayColor)
                            }
                        }
                        
                        Button(action: {isGuidePayMethodChoiceView=true}) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(iteration<selectedMenuList.count-1 ? Color.whiteColor : Color.primaryColor)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .border(Color.grayColor)
                                Text("주문 완료")
                                    .foregroundColor(.grayColor)
                            }
                        }
                    }
                }
            }
            .frame(height: 650)
        }
    }
}

//struct GuideShoppingCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuideShoppingCartView(isFinish: .constant(false))
//    }
//}
