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
    var body: some View {
        if isGuideSetSizeChoiceView{
            if isSetMenu{
                GuideSetSizeChoiceView(menu: $menu, count: $count)
            }else{
                GuideFinalMenuCheckView(menu: $menu, count: $count, isSetMenu: .constant(false), isLargeSet: .constant(false), sideMenu: .constant(""), drink: .constant(""))
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
                        .border(Color.grayColor)
                    
                    Text("제품 추가/변경")
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                        .padding(.horizontal, 50)
                        .padding()
                        .border(Color.grayColor)
                    
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
                                .background((selectedMenuList[iteration].quantity == count) ? Color.whiteColor : Color.primaryColor)
                        }
                    }
                    
                    Button(action: {isGuideSetSizeChoiceView=true}) {
                        Text("장바구니에 추가")
                            .foregroundColor(.grayColor)
                            .padding()
                            .padding(.horizontal, 50)
                            .border(Color.grayColor)
                            .background((selectedMenuList[iteration].quantity == count) ? Color.primaryColor : Color.whiteColor)
//                            .background(Color.primaryColor)
                    }
                }
            }
            .frame(height: 600)
        }
    }
}

//struct GuideMenuCheckView_Previews: PreviewProvider {
//    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 4000, setPrice: 5600)
//    static var previews: some View {
//        GuideMenuCheckView(menu: $menu, isSetMenu: .constant(true))
//    }
//}
