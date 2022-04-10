//
//  HelpPageView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/07.
//

import SwiftUI

struct HelpPageView: View {
    @State var GoStoreChoceView = false
    var body: some View {
        if GoStoreChoceView{
            StoreChoiceView()
        }else{
            ZStack {
                Image("HelpView1")
                
                Button {
                    print("FrontWardButton")
                } label: {
                    Image("FrontWardButton")
                    
                }
                .padding(.leading, 300.0)
                .padding(.top, 350)
                
                Button {
                    GoStoreChoceView=true
                } label: {
                    Image("MenuChoiceButton")
                }
                .padding(.top, 700)

            }
        
        }
    }
}

struct HelpPageView_Previews: PreviewProvider {
    static var previews: some View {
        HelpPageView()
    }
}
