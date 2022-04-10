//
//  GuideSetSizeChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideSetSizeChoiceView: View {
    @State var isGuideSideMenuChoiceView = false
    @State var isLargeSet: Bool = false
    @Binding var menu: Menu
    var body: some View {
        if isGuideSideMenuChoiceView {
            GuideSideMenuChoiceView(isLargeSet: $isLargeSet, menu: $menu)
        } else {
            ZStack{
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack{
                    VStack {
                        Text("주문 확인하기")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .frame(width: 120, height: .infinity, alignment: .center)
                        Spacer()
                    }
                    .padding(.top, 100)
                    
                    Divider()
                    
                    VStack{
                        Text(menu.name)
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.bottom, 70)
                        
                        HStack{
                            Button(action: {
                                isLargeSet=false
                                isGuideSideMenuChoiceView=true
                            }) {
                                VStack{
                                    Image(menu.name)
                                        .resizable()
                                        .scaledToFit()
                                    Text(menu.name+" 세트")
                                        .font(Font.mainFont)
                                        .foregroundColor(Color.grayColor)
                                    Text(String(menu.price)+"원")
                                        .font(Font.mainFont)
                                        .foregroundColor(Color.grayColor)
                                }
                                .frame(width: 100, height: 150, alignment: .center)
                                .border(Color.grayColor)
                            }
                            
                            Button(action: {
                                isLargeSet=true
                                isGuideSideMenuChoiceView=true
                            }) {
                                VStack{
                                    Image(menu.name)
                                        .resizable()
                                        .scaledToFit()
                                    Text(menu.name+" 라지 세트")
                                        .font(Font.mainFont)
                                        .foregroundColor(Color.grayColor)
                                    Text(String(menu.price)+"원")
                                        .font(Font.mainFont)
                                        .foregroundColor(Color.grayColor)
                                }
                                .frame(width: 100, height: 150, alignment: .center)
                                .border(Color.grayColor)
                            }
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct GuideSetSizeChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000)
    static var previews: some View {
        GuideSetSizeChoiceView(menu: $menu)
    }
}
