//
//  TakeOutView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

struct TakeOutView: View {
    @State var isStoreChoiceView = false
    
    @State var isMenuView = false
    @State var isTakeOut = false
    
    var body: some View {
        if isMenuView{
            MenuView(isTakeOut: $isTakeOut)
        }else if isStoreChoiceView{
            StoreChoiceView()
        }else{
            VStack{
                HStack {
                    VStack {
                        Button(action: {
                            isStoreChoiceView=true
                        }) {
                            Image("BackButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 122)
                        }
                    }
                    Spacer()
                    Image("ProgressBar2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 147)
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer().frame(width: 210)
                    Text("메뉴 선택하기")
                }
                .padding(.bottom, 30)
                
                HStack {
                    Text("어디에서 드실건가요?😀")
                        .font(Font.titleFont)
                        .foregroundColor(Color.whiteColor)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.bottom, 30)
                
                Spacer()
                
                // 매장에서 먹기/포장하기
                VStack {
                    Button(action: {
                        isTakeOut=false
                        isMenuView=true
                    }) {
                        Image("InRestaurant")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Button(action: {
                        isTakeOut=true
                        isMenuView=true
                    }){
                        Image("TakeOut")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct TakeOutView_Previews: PreviewProvider {
    @State static var restaurant = Restaurant(name: "맥도날드", menu: mcdonaldMenu)
    static var previews: some View {
        TakeOutView()
    }
}
