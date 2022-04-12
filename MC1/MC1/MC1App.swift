//
//  MC1App.swift
//  MC1
//
//  Created by Hyorim Nam on 2022/04/05.
//

import SwiftUI

@main
struct MC1App: App {
    @State var isSplashView = true
    
    var body: some Scene {
        WindowGroup {
            if isSplashView{
                LaunchView()
                    .onAppear{
                        let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { timer in
                            isSplashView = false
                        })
                    }
            }else{
                FirstView()
            }
        }
    }
}


