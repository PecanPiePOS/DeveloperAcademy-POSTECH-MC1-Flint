//
//  GuideMenuCheckView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideMenuCheckView: View {
    @State var isGuideSetSizeChoiceView = false
    @State var count: Int = 1
    @Binding var menu: Menu
    @Binding var isSetMenu: Bool
    @Binding var isFinish: Bool
    
    var body: some View {
        if isGuideSetSizeChoiceView{
            if isSetMenu{
                GuideSetSizeChoiceView(menu: $menu, count: $count, isFinish: $isFinish)
            }else{
                GuideFinalMenuCheckView(menu: $menu, count: $count, isSetMenu: .constant(false), isLargeSet: .constant(false), sideMenu: .constant(""), drink: .constant(""), isFinish: $isFinish)
            }
        } else {
            ZStack{
                Color.whiteColor
                
                VStack{
                    Image(menu.name)
                        .resizable()
                        .scaledToFit()
                    
                    Text(menu.name)
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                    
                    Text("₩"+String(menu.price))
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                    
                    Text("영양정보")
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                        .padding(.horizontal)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text("제품 추가/변경")
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                        .padding(.horizontal, 50)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    HStack{
                        Button(action: {
                            if count>1{
                                count-=1
                            }
                        }) {
                            Text("-")
                                .padding()
                                .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        }
                        .disabled(count>1 ? false : true)
                        
                        Text(String(count))
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding()
                            .padding(.horizontal, 50)
                            .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        
                        Button(action: {
                            count+=1
                        }) {
                            Text("+")
                                .padding()
                                .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                                .background((selectedMenuList[iteration].quantity == count) ? Color.whiteColor : Color.primaryColor)
                        }
                    }
                    
                    Button(action: {isGuideSetSizeChoiceView=true}) {
                        Text("장바구니에 추가")
                            .foregroundColor(.grayColor)
                            .padding()
                            .padding(.horizontal, 50)
                            .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                            .background((selectedMenuList[iteration].quantity == count) ? Color.primaryColor : Color.whiteColor)
//                            .background(Color.primaryColor)
                    }
                }
            }
            .frame(height: 650)
        }
    }
}

//struct GuideMenuCheckView_Previews: PreviewProvider {
//    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 4000, setPrice: 5600)
//    static var previews: some View {
//        GuideMenuCheckView(menu: $menu, isSetMenu: .constant(true), isFinish: .constant(false))
//    }
//}
