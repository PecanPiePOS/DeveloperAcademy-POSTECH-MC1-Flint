//
//  GuideMenuChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideMenuChoiceView: View {
    @State var isGuideSetChoiceView = false
    @State var curMenu = Menu(name: "", tag: [], price: 0, setPrice: 0)
    @State var menus = mcdonaldMenu
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Binding var isFinish: Bool
    
    var body: some View {
        if isGuideSetChoiceView{
            GuideSetChoiceView(menu :$curMenu, isFinish: $isFinish)
        }else{
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack {
                    VStack {
                        Image("mcdonaldLogo")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                        
                        VStack{
                            Text("홈")
                                .padding(.bottom)
                            
                            Text("추천메뉴")
                                .padding(.bottom)
                        
                            Text("맥런치")
                                .padding(.bottom)
                            
                            Text("버거")
                                .padding(.bottom)
                            
                            Text("해피스낵")
                                .padding(.bottom)
                            
                            Text("사이드")
                                .padding(.bottom)
                        
                            Text("커피")
                                .padding(.bottom)
                        
                            Text("디저트")
                                .padding(.bottom)
                        
                            Text("음료")
                        }
                        .font(.mainFont)
                        .foregroundColor(.grayColor)
                        .padding()
                        
                        Spacer()
                    }
                    .frame(width: 120, alignment: .center)
                    
                    Divider()
                    
                    VStack{
                        Text("버거")
                            .foregroundColor(.grayColor)
                            .font(.titleFont)
                        Text("아래에서 세부메뉴를 확인하세요")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                        
                        ScrollView{
                            LazyVGrid(columns: columns){
                                ForEach($menus){ $menu in
                                    Button(action: {
                                        curMenu=menu
                                        isGuideSetChoiceView=true
                                    }) {
                                        GuideMenuCellView(menu: $menu, isFinish: $isFinish)
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
//
//struct GuideMenuChoiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuideMenuChoiceView(isFinish: .constant(false))
//    }
//}
