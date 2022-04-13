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
//        if showEndView {
//            OnboardingEndView()
//        } else {
        VStack(alignment: .center, spacing: 10) {
            //MARK: TOP TEXT
            TabView(selection: $buttonNumbers) {
                ForEach(onboardingDatas){ i in
                    ZStack {
                        Text(i.topText)
                            .font(.system(size: 32, weight: .black))
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 130, alignment: .center)
            .padding(.top, 100)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

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
                                    .frame(height: UIScreen.main.bounds.height , alignment: .center)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .padding()

                    Button {
                        if buttonNumbers < 3 {
                            buttonNumbers += 1
                        }
                    } label: {
                        if buttonNumbers < 3 {
                            Image(systemName: "greaterthan.circle.fill")
                                .resizable()
                                .foregroundColor(Color.primaryColor)
                                .opacity(1.0)
                        }
                    }
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .trailing)
                    .padding(.trailing, 20)
                }
                .padding(.bottom, -20)
            }
            .padding(.top, -30)
            .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)

            Spacer().frame(height: 20)
            
            //MARK: Bottom Text
            TabView(selection: $buttonNumbers){
                ForEach(onboardingDatas){ i in
                    ZStack {
                        Text(i.bottomText)
                            .multilineTextAlignment(.leading)
                            .lineLimit(6)
                            .frame(height: 60, alignment: .leading)
                            .padding(.bottom, -10)
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .padding(20)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top, -50)

            //MARK: Half Sheet Action Button
            
            Button {
                if buttonNumbers == 3 {
                    showEndView.toggle()
                }
            } label: {
                if buttonNumbers != 3 {
                    Capsule()
                        .fill(Color.grayBackgound)
                        .frame(width: UIScreen.main.bounds.width, height: 90, alignment: .center)
                        .opacity(0.3)
                        .overlay(Text("시작하기").font(.system(size: 26, weight: .medium)).foregroundColor(.white).opacity(0.4))
                        .padding(.top, 30)
                        .padding(5)
                } else {
                    Capsule()
                        .fill(Color.primaryColor)
                        .frame(width: UIScreen.main.bounds.width, height: 90, alignment: .center)
                        .overlay(Text("시작하기").font(.system(size: 26, weight: .bold)).foregroundColor(.black))
                        .padding(.top, 30)
                        .padding(5)
                        .halfSheet(showSheet: $showEndView) {
                            secondSheetView()
                        }
                }
            }
            .padding(.bottom, 30)
            .padding()
        }
//        }
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
    Guides(id: 2, topText: "내 주변 키오스크를\n 자동으로 쉽게 확인하고", bottomText: "위치 정보를 활용하여 자동으로 주변의 키오스크를 알려줄 거예요.",image: "onboarding3"),
    Guides(id: 3, topText: "가이드를 통해 키오스크\n 사용 방법을 익혀보세요!", bottomText: "'유캔터치'를 통해 키오스크로 겪는 어려움을 해결할 수 있습니다.",image: "onboarding4")
]


struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartView()
            .preferredColorScheme(.dark)
    }
}

struct secondSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Spacer().frame(height: 40)
            ZStack{
                Color.primaryColor.ignoresSafeArea()
                Spacer()
                VStack(spacing:10){
                    Text("더 편리한 사용을 위해 권한을 허용해주세요.")
                        .font(.system(size: 30, weight: .black))
                        .frame(width: 300, height: 100, alignment: .center)
                        .lineLimit(3)
                        .foregroundColor(.black)
                        .padding(30)
                        .padding(.top, 10)
                    
                    HStack(spacing: 10){
                        Image(systemName: "bell.badge")
                            .resizable()
                            .scaledToFit()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.red, .black)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                            
                        VStack(spacing: 0){
                            Text("알림")
                                .font(.system(size: 22, weight: .black))
                                .foregroundColor(.black)
                                .frame(width: 60, height: 30, alignment: .leading)
                                .padding(.trailing, 180)
                                
                            Text("앱을 사용 중이 아닐 때에도, 도움을 드릴 수 있도록 알림을 드려요.")
                                .font(.system(size: 13, weight: .light))
                                .foregroundColor(.black)
                                .frame(width: 240, height: 40, alignment: .leading)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                        }
                        
                    }
                    .padding()
                    .padding(.bottom, 20)
                    .padding(.top, -50)
                    
                    HStack(spacing: 10){
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                            
                        VStack(spacing: 8){
                            Text("현재 위치 정보")
                                .font(.system(size: 22, weight: .black))
                                .foregroundColor(.black)
                                .frame(width: 140, height: 30, alignment: .leading)
                                .padding(.trailing, 100)
                                
                            Text("검색 과정을 간소화 하기 위해 위치 정보를 활용해 주변의 키오스크 안내를 도와드려요.")
                                .font(.system(size: 13, weight: .light))
                                .foregroundColor(.black)
                                .frame(width: 240, height: 40, alignment: .leading)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.top, -7)
                        }
                        
                    }
                    .padding(.top, -30)
//                    .padding(.bottom, 20)
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        LocationManager.shared.requestLocation()
                        
                    } label: {
                        Text("시작하기")
                            .font(.system(size: 26, weight: .heavy))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding()
                    
                    Spacer().frame(height: 60)
                    
                    
//                    Capsule()
//                        .fill(.black)
//                        .frame(width: 330, height: 80, alignment: .center)
//                        .overlay(Text("시작하기").font(.system(size: 26, weight: .bold)).foregroundColor(.white))
//                        .padding(.top, 0)
//                        .padding()
//                        .onTapGesture {
//                            LocationManager.shared.requestLocation()
//                        }
                    //                        .halfSheet(showSheet: $showEndView) {
                    //                            secondSheetView()
                    
                    
                }
                
            }
        }
        .ignoresSafeArea()
    }
}
