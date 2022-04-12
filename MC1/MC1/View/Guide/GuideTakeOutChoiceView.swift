//
//  GuideTakeOutChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideTakeOutChoiceView: View {
    @State var isGuideHomeView = false
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
                                .background(Color.primaryColor)
                                .border(Color.grayColor)
                        }
                        
                        Button(action: {isGuideHomeView=true}) {
                            Text("테이크 아웃")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .padding()
                                .frame(width: 120, height: 150)
                                .border(Color.grayColor)
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
                            .border(Color.grayColor)
                        
                        Text("한국어")
                            .font(.mainFont)
                            .foregroundColor(.grayColor)
                            .padding()
                            .frame(width: 120, height: 60)
                            .border(Color.grayColor)
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
        GuideTakeOutChoiceView(isFinish: .constant(false))
    }
}
