//
//  MenuView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

struct MenuView: View {
    @Binding var restaurant: Restaurant
    
    /// 세트메뉴를 선택하는 뷰를 보여주는 변수
    @State var isSetChoiceView: Bool = false
    /// 메뉴 수량을 선택하는 뷰를 보여주는 변수
    @State var isMenuQuantityView: Bool = false
    /// 쇼핑카트 뷰를 보여주는 변수
    @State var isShoppingListView: Bool = false
    
    @State var curMenu: Menu = Menu(name: "", tag: [], price: 0)
    @State var isSetMenu = false
    @State var menuQuantity = 1
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        if isShoppingListView{
            MenuCheckView(isShoppingListView: $isShoppingListView)
        }else{
            ScrollView {
                HStack {
                    Text("어떤 메뉴를\n드시고 싶으세요?")
                        .font(Font.titleFont)
                        .foregroundColor(Color.whiteColor)
                    Spacer()
                }
                .padding(.bottom, 30)
                
                VStack(alignment: .leading) {
                    Section("추천 메뉴") {
                        LazyVGrid(columns: columns) {
                            ForEach($restaurant.menu){ $menu in
                                if menu.tag.contains("추천"){
                                    Button(action: {
                                        isSetChoiceView.toggle()
                                        curMenu=menu
                                    }) {
                                        MenuCellView(menu: $menu)
                                    }
                                    .halfSheet(showSheet: $isSetChoiceView) {
                                        MenuSetChoiceView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isMenuQuantityView: $isMenuQuantityView, isSetMenu: $isSetMenu)
                                    }
                                    .halfSheet(showSheet: $isMenuQuantityView) {
                                        MenuQuantityView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isShoppingListView: $isShoppingListView, isSetMenu: $isSetMenu, menuQuantity: $menuQuantity)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                    
                    Section("소고기 버거") {
                        LazyVGrid(columns: columns) {
                            ForEach($restaurant.menu){ $menu in
                                if menu.tag.contains("소고기"){
                                    Button(action: {
                                        isSetChoiceView.toggle()
                                        curMenu=menu
                                    }) {
                                        MenuCellView(menu: $menu)
                                    }
                                    .halfSheet(showSheet: $isSetChoiceView) {
                                        MenuSetChoiceView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isMenuQuantityView: $isMenuQuantityView, isSetMenu: $isSetMenu)
                                    }
                                    .halfSheet(showSheet: $isMenuQuantityView) {
                                        MenuQuantityView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isShoppingListView: $isShoppingListView, isSetMenu: $isSetMenu, menuQuantity: $menuQuantity)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                    
                    Section("치킨 버거") {
                        LazyVGrid(columns: columns) {
                            ForEach($restaurant.menu){ $menu in
                                if menu.tag.contains("치킨"){
                                    Button(action: {
                                        isSetChoiceView.toggle()
                                        curMenu=menu
                                    }) {
                                        MenuCellView(menu: $menu)
                                    }
                                    .halfSheet(showSheet: $isSetChoiceView) {
                                        MenuSetChoiceView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isMenuQuantityView: $isMenuQuantityView, isSetMenu: $isSetMenu)
                                    }
                                    .halfSheet(showSheet: $isMenuQuantityView) {
                                        MenuQuantityView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isShoppingListView: $isShoppingListView, isSetMenu: $isSetMenu, menuQuantity: $menuQuantity)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                    
                    Section("새우 버거") {
                        LazyVGrid(columns: columns) {
                            ForEach($restaurant.menu){ $menu in
                                if menu.tag.contains("새우"){
                                    Button(action: {
                                        isSetChoiceView.toggle()
                                        curMenu=menu
                                    }) {
                                        MenuCellView(menu: $menu)
                                    }
                                    .halfSheet(showSheet: $isSetChoiceView) {
                                        MenuSetChoiceView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isMenuQuantityView: $isMenuQuantityView, isSetMenu: $isSetMenu)
                                    }
                                    .halfSheet(showSheet: $isMenuQuantityView) {
                                        MenuQuantityView(menu: $curMenu, isSetChoiceView: $isSetChoiceView, isShoppingListView: $isShoppingListView, isSetMenu: $isSetMenu, menuQuantity: $menuQuantity)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                }
            }
            .padding()
            .background(Color.grayColor)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var restaurant = Restaurant(name: "맥도날드", menu: mcdonaldMenu)
    static var previews: some View {
        MenuView(restaurant: $restaurant)
    }
}

/// HalfSheet를 위한 코드
extension View{
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView)->some View{
        
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet)
            )
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
    var sheetView: SheetView
    @Binding var showSheet: Bool
    
    let controller = UIViewController()
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showSheet{
            let sheetController = CustomHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated: true){
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

class CustomHostingController<Context: View>: UIHostingController<Context>{
    override func viewDidLoad(){
        if let presentationController = presentationController as?
            UISheetPresentationController{
            presentationController.detents = [
                .medium(), .large()
            ]
        }
    }
}
