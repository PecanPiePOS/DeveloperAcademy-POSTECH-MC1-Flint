//
//  OrderCheckView.swift
//  MC1
//

import SwiftUI

//test data
//var testSMList: [SelectedMenu] = [
//    SelectedMenu(menu: mcdonaldMenu[1], quantity: 1, isSet: true),
//    SelectedMenu(menu: mcdonaldMenu[2], quantity: 2, isSet: true),
//    SelectedMenu(menu: mcdonaldMenu[3], quantity: 3, isSet: true),
//    SelectedMenu(menu: mcdonaldMenu[0], quantity: 2, isSet: false)
//]

func printArray(arr: [SelectedMenu]){
    print("arr.menu.name is: ")
    for i in arr{
        print("'\(i.menu.name)'")
    }
}

struct OrderCheckView: View {
    @State var smList = selectedMenuList
//    @State var smList = testSMList
    @State var action: Int? //버튼용
//    @State var alertDel: Bool = false //alert용
//test data
    @State var restaurantType: Restaurant = restaurantList[0]
    
    var body: some View {
//        NavigationView{
        if self.action == 1{MenuView()}
        else if self.action == 2{BeforeGuideStartView()}
//        else if self.action == 3{OrderCheckView().refresh()}
        else{
            VStack(alignment: .leading){
                HStack(alignment: .top) {
                    VStack {
                        Button(action: {
                            self.action = 1
                        }, label:{
                            //ZStack{
                                //MARK: navi pop 쓸 수 있는지
//                                NavigationLink("BackButton", destination: MenuView()/*pop 쓸 수 있는지*/, tag:0, selection: $action)
//                                    .hidden().disabled(true)
                                Image("BackButton")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 164)
                            //}
                        })
                    }
                    Spacer()
                    Image("ProgressBar3")
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("메뉴 확인하기")
                        .padding(.trailing)
                }
                
                HStack{
                    Text("주문하신 \n내용이 맞나요?")
                        .font(Font.titleFont)
                        .foregroundColor(Color.whiteColor)
                        .padding(.leading, 20.0)
                }
                Spacer()
                
                // OrderView list
                List(){
                    ForEach($smList){sm in
                        ZStack{
                            OrderView(smenu: sm)
                                .padding(.bottom, 10.0)
                            HStack{
                                Spacer()
                                Button(action:{
                                        // MARK: 어떻게 guard 나 optional binding 쓸 수 없을까?
                                    for i in 0...($smList.count-1) {
                                        if $smList[i].wrappedValue.menu.name == sm.wrappedValue.menu.name{
                                            $smList.wrappedValue.remove(at: i)
                                            selectedMenuList.remove(at: i)
                                            //self.action = 3
                                            OrderCheckView()
                                            break
                                        }
                                    }
                                }, label: {
                                    //MARK: 영역 문제 있음
                                    ZStack{
                                        Image("TrashButton").resizable().scaledToFit().frame(height: 92.96, alignment: .trailing).padding(.trailing)
                                        //popup, delete
                                        Text("취소").font(Font.mainFont.bold()).foregroundColor(Color.whiteColor)
                                    }
                                })
                                .padding(.bottom, 10.0)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.black)
                    }
                }.background(Color.black)
                HStack{
                    Text("총 금액  \(totalPrice(smList:selectedMenuList/*testSMList*/))원").font(Font.titleFont).padding(.all, 20.0)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        //MenuView()
                        self.action=1
                    }, label:{
                        ZStack{
                            //NavigationLink("more order", destination: MenuView(), tag:1, selection: $action).hidden().disabled(true)
                            Image("WhiteButton")
                                .resizable().frame(width: 164).aspectRatio(contentMode: .fit)
                            Text("더 주문하기").font(Font.mainFont).foregroundColor(Color.grayColor)

                        }
                        
                    })
                    Spacer()
                    Button(action: {
                        //BeforeGuideStartView()
                        self.action=2
                    }, label: {
                        ZStack{
                            //NavigationLink("finish order", destination: BeforeGuideStartView(), tag:2, selection: $action).hidden().disabled(true)
                            Image("PrimaryButton")
                                //.resizable().aspectRatio(contentMode: .fit)
                            Text("주문완료").font(Font.mainFont).foregroundColor(Color.grayColor)
                        }
                    })
                
                    Spacer()
                
                }.padding(.horizontal)
            }
            }
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
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

func deleteAnOrder(smenu: SelectedMenu){
    // MARK: 어떻게 guard 나 optional binding 쓸 수 없을까?
    var index: Int = -1
    for i in 0...(selectedMenuList.count-1) {
        if selectedMenuList[i].id == smenu.menu.id{
            index = i
            break
        }
    }
    if index != -1 {
        print("index: \(index)")
        selectedMenuList.remove(at: index)
    }
    //OrderCheckView()
}


struct OrderCheckView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCheckView()
    }
}
