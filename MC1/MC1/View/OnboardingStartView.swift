//
//  OnboardingStartView.swift
//  MC1
//
//  Created by KYUBO A. SHIM on 2022/04/08.
//

import SwiftUI

struct OnboardingStartView: View {

    @State private var buttonNumbers = 0
    @State private var showEndView = false
    
    var body: some View {
        if showEndView {
            OnboardingEndView()
        } else {
            VStack(alignment: .center, spacing: 10) {
                //MARK: TOP TEXT
                TabView(selection: $buttonNumbers) {
                    ForEach(onboardingDatas){ i in
                        ZStack {
                            Text(i.topText)
                                .font(.system(size: 32, weight: .heavy))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .frame(width: .infinity, height: 130, alignment: .center)
                .padding(.top, 140)
                
                //MARK: Buttons and Images transitions
                ZStack {
                    HStack {
                        Button {
                            if buttonNumbers > 0 {
                                buttonNumbers -= 1
                            }
                        } label: {
                            if buttonNumbers > 0 {
                                Image(systemName: "lessthan.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                            }
                        }
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .leading)
                        .padding(.leading, 20)

                        TabView(selection: $buttonNumbers){
                            ForEach(onboardingDatas){ i in
                                ZStack {
                                    Image(i.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: .infinity, alignment: .center)
                                        .padding(.bottom, 40)
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        Button {
                            if buttonNumbers < 3 {
                                buttonNumbers += 1
                            }
                        } label: {
                            if buttonNumbers < 3 {
                                Image(systemName: "greaterthan.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                            }
                        }
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .trailing)
                        .padding(.trailing, 20)
                    }
                }
                .padding(.top)
                .frame(width: .infinity, height: 200, alignment: .center)
                
                //MARK: Bottom Text
                TabView(selection: $buttonNumbers){
                    ForEach(onboardingDatas){ i in
                        ZStack {
                            Text(i.bottomText)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 17, weight: .light))
                                .foregroundColor(.white)
                                .opacity(0.7)
                                .frame(height: 140, alignment: .leading)
                                .padding(.top, 40)
                                .padding()
                        }
                    }
                }
                .padding(.top)
                
                //MARK: Half Sheet Action Button
                Button {
                    if buttonNumbers == 3 {                            showEndView.toggle()
                    }
                } label: {
                    if buttonNumbers != 3 {
                        Capsule()
                            .fill(Color.grayBackgound)
                            .frame(width: .infinity, height: 90, alignment: .center)
                            .opacity(0.3)
                            .overlay(Text("시작하기").font(.system(size: 26, weight: .medium)).foregroundColor(.white).opacity(0.4))
                            .padding(.top, 30)
                            .padding()
                    } else {
                        Capsule()
                            .fill(Color.primaryColor)
                            .frame(width: .infinity, height: 90, alignment: .center)
                            .overlay(Text("시작하기").font(.system(size: 26, weight: .bold)).foregroundColor(.black))
                            .padding(.top, 30)
                            .padding()
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}


//MARK: Guide Struct

struct Guides: Identifiable,Hashable {
    let id: Int
    let topText: String
    let bottomText: String
    let image: String
}


//MARK: GuideDatas

let onboardingDatas = [
    Guides(id: 0, topText: "키오스크 앞에서\n 난처했던 적이 있나요?", bottomText: "60대 이상의 어르신들의 79%가 키오스크 사용에 어려움을 겪은 적이 있다고 해요.",image: "onboarding1"),
    Guides(id: 1, topText: "ATM을 사용하기\n 어려웠던 적이 있나요?", bottomText: "무인 정보 단말기를 활용한 서비스는 앞으로 늘어나고 오프라인 대면 형식의 거래는 줄어들고 있는 추세에요.",image: "onboarding2"),
    Guides(id: 2, topText: "내 주변 키오스크를\n 자동으로 쉽게 확인하고", bottomText: "'시니어 앱'은 디지털 기기에 익숙하지 않은 어르신들도 쉽게 접근할 수 있도록 위치 정보를 활용하여 자동으로 주변의 키오스크를 알려줄 거예요.",image: "onboarding3"),
    Guides(id: 3, topText: "가이드를 통해 키오스크\n 사용 방법을 익혀보세요!", bottomText: "'시니어 앱'을 통해 키오스크로 겪는 어려움을 해결할 수 있습니다.",image: "onboarding4")
]


struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartView()
    }
}
