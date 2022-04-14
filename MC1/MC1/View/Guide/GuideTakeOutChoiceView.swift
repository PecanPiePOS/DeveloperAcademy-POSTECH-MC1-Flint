//
//  GuideTakeOutChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideTakeOutChoiceView: View {
    @State var isGuideHomeView = false
    @Binding var isTakeOut: Bool
    @Binding var isFinish: Bool
    
    var body: some View {
        if isGuideHomeView{
            GuideHomeView(isFinish: $isFinish)
        } else {
            ZStack{
                Color.whiteColor
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("식사 방법을\n선택해주세요")
                        .font(.titleFont)
                        .foregroundColor(.grayColor)
                    
                    Spacer()
                    
                    HStack{
                        Button(action: {isGuideHomeView=true}) {
                            Text("매장에서 식사")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .padding()
                                .frame(width: 120, height: 150)
                                .background(isTakeOut ? Color.clear : Color.primaryColor)
                                .overlay(
                                            RoundedRectangle(cornerRadius: 2)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                        }
                        
                        Button(action: {isGuideHomeView=true}) {
                            Text("테이크 아웃")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .padding()
                                .frame(width: 120, height: 150)
                                .background(isTakeOut ? Color.primaryColor : Color.clear)
                                .overlay(
                                            RoundedRectangle(cornerRadius: 2)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                        }
                    }
                    
                    Spacer()
                    
                    Text("언어")
                        .font(.mainFont)
                        .foregroundColor(.grayColor)
                        .padding(.bottom, 50)
                    
                    HStack {
                        Text("English")
                            .font(.mainFont)
                            .foregroundColor(.grayColor)
                            .padding()
                            .frame(width: 120, height: 60)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                        
                        Text("한국어")
                            .font(.mainFont)
                            .foregroundColor(.grayColor)
                            .padding()
                            .frame(width: 120, height: 60)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
//                            .border(Color.primaryColor, width: 5)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .frame(height: 650)
        }
    }
}

struct GuideTakeOutChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        GuideTakeOutChoiceView(isTakeOut: .constant(true), isFinish: .constant(false))
    }
}
