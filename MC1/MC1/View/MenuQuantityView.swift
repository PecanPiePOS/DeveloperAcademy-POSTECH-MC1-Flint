//
//  MenuQuantityView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/07.
//

import SwiftUI

struct MenuQuantityView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var menu: Menu
    
    @Binding var isSetMenu: Bool
    @Binding var menuQuantity: Int
    @Binding var isShoppingCartListView: Bool
    
    @State var isSetChoiceView = false
    @State var isMenuCheckView = false
    
    var body: some View {
        if isSetChoiceView{
            MenuSetChoiceView(menu: $menu, isSetMenu: $isSetMenu, menuQuantity: $menuQuantity, isShoppingCartListView: $isShoppingCartListView)
        } else if isMenuCheckView{
            OrderCheckView()
        } else {
            ZStack{
                Image("SheetBackground")

                VStack {
                    Text(menu.name)
                        .foregroundColor(.grayColor)
                        .font(.titleFont)
                    Text("주문하실 수량을 선택해주세요")
                        .foregroundColor(.grayColor)
                        .padding(.bottom, 30)

                    ZStack{
                        Image("StepperBackground")
                        HStack {
                            Button(action: {
                                if menuQuantity>1{
                                    menuQuantity-=1
                                }
                            }) {
                                Image(systemName: "minus.circle")
                            }
                            .foregroundColor(.grayColor)
                            
                            Text(String(menuQuantity)+"개")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .padding(.horizontal, 70)
                            
                            Button(action: {
                                menuQuantity+=1
                            }) {
                                Image(systemName: "plus.circle")
                            }
                            .foregroundColor(.grayColor)
                        }
                    }
                    .padding(.bottom, 70)

                    HStack{
                        Button(action: {
                            isSetChoiceView.toggle()
                        }) {
                            Image("PreviousButton")
                        }

                        Button(action: {
                            selectedMenuList.append(SelectedMenu(menu: menu, quantity: menuQuantity, isSet: isSetMenu))
                            menuQuantity=1
                            isSetMenu=false
                            presentationMode.wrappedValue.dismiss()
                            isShoppingCartListView=true
                        }) {
                            Image("NextButton")
                        }
                    }
                }
            }
        }
    }
}

struct MenuQuantityView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "트리플 치즈버거", tag: [], price: 5000, setPrice: 6000)
    static var previews: some View {
        MenuQuantityView(menu: $menu, isSetMenu: .constant(false), menuQuantity: .constant(1), isShoppingCartListView: .constant(false))
    }
}
