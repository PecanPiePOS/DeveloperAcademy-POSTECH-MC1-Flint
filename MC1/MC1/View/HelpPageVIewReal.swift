//
//  HelpPageVIewReal.swift
//  MC1
//
//  Created by uiskim on 2022/04/11.
//

import SwiftUI

struct HelpPageViewReal: View {

    @State private var buttonNumbers = 0
    @State private var showEndView = false
    
    var body: some View {
        if showEndView{
            StoreChoiceView()
        }else{
            ZStack{
                TabView(selection: $buttonNumbers) {
                    ForEach(helpingDatas){context in
                        ZStack {
                            Color.primaryColor.edgesIgnoringSafeArea(.all)
                            Text(context.topText)
                                .font(.system(size: 32, weight: .heavy))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 200)
                            
                            Image(context.image)
                                .padding(.top, 150)
                            
                            Button {
                                if buttonNumbers > 0{
                                    buttonNumbers -= 1
 
                                }
                            } label: {
                                if buttonNumbers > 0 {
                                    Image("HelpingBackwardButton")
                                        .padding(.top, 140)
                                        .padding(.trailing, 300)
                                }
                            }
                            
                            Button {
                                if buttonNumbers < 3 {
                                    buttonNumbers += 1
                                }
                            } label: {
                                if buttonNumbers < 3 {
                                    Image("HelpingForwardButton")
                                        .padding(.top, 140)
                                        .padding(.leading, 300)
                                }
                            }
                            
                            Button {
                                if buttonNumbers == 3{
                                    showEndView.toggle()
                                }
                            } label: {
                                if buttonNumbers != 3 {
                                    Image("HelpingGuideStartButton")
                                        .padding(.top, 500)
                                        .frame(width: .infinity, height: 90, alignment: .center)
                                    
                                }else{
                                    Image("GuideStartLast")
                                        .padding(.top, 500)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


//MARK: Guide Struct

struct helpGuides: Identifiable,Hashable {
    let id: Int
    let topText: String
    let image: String
}


//MARK: GuideDatas

let helpingDatas = [
    helpGuides(id: 0, topText: "시작을 하면 주변\n 매장을 검색해 드려요", image: "HelpingGuideImg1"),
    helpGuides(id: 1, topText: "안내를 따라 도움이\n 필요한 서비스를 선택하세요", image: "HelpingGuideImg2"),
    helpGuides(id: 2, topText: "선택하신 서비스에 맞는\n 맞춤 사용법을 안내해드려요", image: "onboarding3"),
    helpGuides(id: 3, topText: "‘시니어 앱’을 따라\n 키오스크를 사용해보세요!", image: "onboarding4")
]


struct HelpPageViewReal_Preview: PreviewProvider {
    static var previews: some View {
        HelpPageViewReal()
    }
}

