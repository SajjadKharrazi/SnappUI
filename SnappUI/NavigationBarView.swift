//
//  navig.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/12/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI


struct NavigationBarView: View {
    
    
    var body: some View {
        VStack {
            
            Rectangle()
                .foregroundColor(Color.red)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 100)
//Spacer()
            Rectangle()
                
                .frame(height: 64)
                .overlay(
                    HStack{
                        Text("close")
                        Spacer()
                        
                        Text("سفر به سلامت")
                            //                        .font(Font.navigationTitle)
                            .color(.black)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        Text("menu")
                    }
            )
            
            Spacer()
        }.frame(height: 64)
            .foregroundColor(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
    
}
