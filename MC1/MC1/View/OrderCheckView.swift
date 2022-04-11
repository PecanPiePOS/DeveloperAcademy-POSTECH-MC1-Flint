//
//  OrderCheckView.swift
//  MC1
//

import SwiftUI

//test data
let testSMList: [SelectedMenu] = [
    SelectedMenu(menu: mcdonaldMenu[1], quantity: 1, isSet: true),
    SelectedMenu(menu: mcdonaldMenu[2], quantity: 2, isSet: true),
    SelectedMenu(menu: mcdonaldMenu[3], quantity: 3, isSet: true),
    SelectedMenu(menu: mcdonaldMenu[0], quantity: 2, isSet: false)
]

struct OrderCheckView: View {
    @State var smList = selectedMenuList
//    @State var smList = testSMList
    @State var action: Int?
//test data
    @State var restaurantType: Restaurant = restaurantList[0]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack {
                    VStack {/*
                        Button(action: {
                            self.action=
                        }, label:{
                            ZStack{
                                NavigationLink("BakcButton", destination: pop, tag:1, selection: $action).hidden().disabled(true)
                                Image("WhiteButton")
                                    .resizable().frame(width: 164).aspectRatio(contentMode: .fit)
                                Text("더 주문하기").font(Font.mainFont).foregroundColor(Color.grayColor)

                            }*/
/*                        Button(action: {
                            self.action = 0
                            NavigationLink(destination: <#T##() -> _#>, label: <#T##() -> _#>)
                        }) {
                            Image("BackButton")
                        }*/
                    }
                    Spacer()
                    Image("ProgressBar2")
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("메뉴 선택하기")
                    Spacer()
                }
                
                HStack{
                    Text("주문하신 \n내용이 맞나요?").font(Font.titleFont).foregroundColor(Color.whiteColor).padding(.leading, 20.0)
                }
                Spacer()
                // OrderView list
                List(){
                    ForEach($smList){sm in
                        OrderView(smenu: sm).listRowInsets(EdgeInsets()).padding(.bottom, 10.0).listRowBackground(Color.black)
                    }
                }//.listRowInsets(EdgeInsets()).background(Color.black)
                HStack{
                    Text("총 금액  \(totalPrice(smList:smList))원").font(Font.titleFont).padding(.all, 20.0)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.action=1
                    }, label:{
                        ZStack{
                            NavigationLink("more order", destination: MenuView(), tag:1, selection: $action).hidden().disabled(true)
                            Image("WhiteButton")
                                .resizable().frame(width: 164).aspectRatio(contentMode: .fit)
                            Text("더 주문하기").font(Font.mainFont).foregroundColor(Color.grayColor)

                        }
                        
                    })
                    Spacer()
                    Button(action: {self.action=2}, label: {
                        ZStack{
                            NavigationLink("finish order", destination: BeforeGuideStartView(), tag:2, selection: $action).hidden().disabled(true)
                            Image("PrimaryButton")
                                //.resizable().aspectRatio(contentMode: .fit)
                            Text("주문완료").font(Font.mainFont).foregroundColor(Color.grayColor)
                        }
                    })
                    Spacer()
                }.padding(.horizontal)
            }
        }.navigationBarHidden(true)
        
    }
}

func totalPrice(smList: [SelectedMenu])->Int{
    var price: Int = 0
    for i in smList{
        if i.isSet {price += i.quantity * i.menu.setPrice}
        else {price += i.quantity * i.menu.price}
    }
    return price
}

struct OrderCheckView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCheckView()
    }
}
