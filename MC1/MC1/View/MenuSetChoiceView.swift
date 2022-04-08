//
//  MenuSetChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/07.
//

import SwiftUI

struct MenuSetChoiceView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var menu: Menu
    @Binding var isMenuSelected: Bool
    @Binding var isSetChoiced: Bool
    @Binding var isSetMenu: Bool
    @State var disableNextButton = true
    @State var singleCheckImageName = "circle"
    @State var setCheckImageName = "circle"
    
    var body: some View {
        ZStack{
            Image("SheetBackground")
            
            VStack {
                Text(menu.name)
                    .foregroundColor(.grayColor)
                    .font(.titleFont)
                Text("단품 메뉴를 드실지 세트 메뉴를 드실지 선택 해주세요")
                    .foregroundColor(.grayColor)
                    .padding(.bottom, 30)
                
                HStack{
                    Button(action: {
                        isSetMenu=false
                        singleCheckImageName="checkmark.circle"
                        setCheckImageName="circle"
                        disableNextButton=false
                    }) {
                        VStack {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(.whiteColor)
                                VStack {
                                    Image(menu.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100, alignment: .center)
                                    Text("단품")
                                        .font(.mainFont)
                                        .foregroundColor(.grayColor)
                                }
                            }
                            
                            Image(systemName: singleCheckImageName)
                                .foregroundColor(.grayColor)
                                .padding()
                        }
                    }
                    Button(action: {
                        isSetMenu=true
                        singleCheckImageName="circle"
                        setCheckImageName="checkmark.circle"
                        disableNextButton=false
                    }) {
                        VStack {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .foregroundColor(.whiteColor)
                                VStack {
                                    Image(menu.name)
                                        .resizable()
                                        .scaledToFit()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    Text("세트")
                                        .font(.mainFont)
                                        .foregroundColor(.grayColor)
                                }
                            }
                            
                            Image(systemName: setCheckImageName)
                                .foregroundColor(.grayColor)
                                .padding()
                        }
                    }
                }
                
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Image("PreviousButton")
                    }
                    
                    Button(action: {
//                        
                        presentationMode.wrappedValue.dismiss()
                        isSetChoiced.toggle()
                    }) {
                        Image("NextButton")
                    }
                    .disabled(disableNextButton)
                }
            }
        }
    }
}

struct MenuSetChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "트리플 치즈버거", tag: [], price: 5000)
    
    static var previews: some View {
        MenuSetChoiceView(menu: $menu, isMenuSelected: .constant(true), isSetChoiced: .constant(false), isSetMenu: .constant(false))
    }
}
