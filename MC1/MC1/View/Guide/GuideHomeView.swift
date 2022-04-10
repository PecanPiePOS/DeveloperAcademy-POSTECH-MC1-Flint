//
//  GuideHomeView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideHomeView: View {
    @State var isGuideMenuChoiceView = false
    var body: some View {
        if isGuideMenuChoiceView{
            GuideMenuChoiceView()
        }else{
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack {
                    VStack {
                        altImage
                            .foregroundColor(.grayColor)
                            .frame(width: 50, height: 50, alignment: .center)
                        
                        VStack{
                            Text("홈")
                                .padding(.bottom)
                            
                            Text("추천메뉴")
                                .padding(.bottom)
                        
                            Text("맥런치")
                                .padding(.bottom)
                            
                            Button(action: {isGuideMenuChoiceView=true}) {
                                Text("버거")
                                    .padding(.bottom)
                            }
                            
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
                    .frame(width: 100, height: .infinity, alignment: .center)
                    
                    Divider()
                
                    VStack {
                        Text("탁월한 선택! 맥런치")
                            .foregroundColor(.grayColor)
                            .font(.titleFont)
                            .padding(.vertical)
                        Text("메뉴 알아보기")
                            .foregroundColor(.grayColor)

                        HStack{
                            Text("추천메뉴")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .frame(width: 100, height: 80, alignment: .center)
                                .border(Color.grayColor)

                            Text("맥런치")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .frame(width: 100, height: 80, alignment: .center)
                                .border(Color.grayColor)
                        }
                        
                        HStack{
                            Text("이달의 해피스낵")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .frame(width: 100, height: 80, alignment: .center)
                                .border(Color.grayColor)

                            Text("커피&디저트")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .frame(width: 100, height: 80, alignment: .center)
                                .border(Color.grayColor)
                        }
                        
                        altImage
                            .foregroundColor(.grayColor)
                            .frame(width: 210, height: 50)
                        altImage
                            .foregroundColor(.grayColor)
                            .frame(width: 210, height: 50)
                        
                        Text("인기 메뉴")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                        
                        HStack {
                            altImage
                                .foregroundColor(.grayColor)
                                .frame(width: 65, height: 100)
                            altImage
                                .foregroundColor(.grayColor)
                                .frame(width: 65, height: 100)
                            altImage
                                .foregroundColor(.grayColor)
                                .frame(width: 65, height: 100)
                        }
                    }
                }
            }
        }
    }
}

struct GuideHomeView_Previews: PreviewProvider {
    static var previews: some View {
        GuideHomeView()
    }
}
