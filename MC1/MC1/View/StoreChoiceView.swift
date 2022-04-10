//
//  StoreChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/07.
//

import SwiftUI

struct StoreChoiceView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators:false){
                VStack(){
                    HStack(){
                    Text("어떤 매장의 키오스크\n안내가 필요하세요?")
                    .font(Font.titleFont)
                    .foregroundColor(Color.whiteColor)
                    .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                    }
                    HStack(){
                    Text("가까운 매장")
                        .font(Font.body)
                        .foregroundColor(Color.whiteColor)
                        .padding(.top, 72.0)
                        Spacer()
                    }
                                     
                    HStack {
                        
                        NavigationLink(destination: MenuView()){
                            Image("McdonaldBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image("BurgerKingBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }

                            }
                    Spacer()
                    
                    HStack(){
                    Text("은행")
                        .font(Font.body)
                        .foregroundColor(Color.whiteColor)
                        Spacer()
                        
                    }
                    .padding(.top, 72.0)
                    
                }
                 
                VStack{
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {}) {
                            Image("농협Box")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image("신한Box")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                    }
                    
                    HStack {
                        
                        Button(action: {}) {
                            Image("IBKBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image("KBBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(){
                    Text("교통")
                        .font(Font.body)
                        .foregroundColor(Color.whiteColor)
                        Spacer()
                    }
                    .padding(.top, 72.0)
                    
                    HStack{
                        Button(action: {}) {
                            Image("KTXBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                        Button(action: {}) {
                            Image("BustagoBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                        
                    }
                    HStack(){
                    Text("음식점")
                        .font(Font.body)
                        .foregroundColor(Color.whiteColor)
                        Spacer()
                    }
                    .padding(.top, 72.0)
                    
                    HStack{
                        Button(action: {}) {
                            Image("McdonaldBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                        Button(action: {}) {
                            Image("BurgerKingBox")
                                .resizable()
                                .frame(width:164, height: 164)
                        }
                    }

                    
                    
                    
                    
                }
                .frame(width: 344.0)
                
            }
            .frame(width: 344.0)

        }
               
    }
}

struct StoreChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        StoreChoiceView()
    }
}
