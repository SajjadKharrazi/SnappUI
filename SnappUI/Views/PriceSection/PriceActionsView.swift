//
//  PriceActionsView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct PriceActionsView: View {
    
    @Binding var showPrice: Int
    
    var body: some View {
        HStack{
            Text("گزینه‌ها").frame(width:85).foregroundColor(.snappForeground).font(.custom("IRANSansMobileFaNum-Bold",size: 16))
            Image(uiImage: UIImage()).resizable().frame(width:1).background(Color.snappTextDisabled)
            Spacer()
            Text("ریال").minimumScaleFactor(0.01).foregroundColor(.snappTextDisabled)
            Text("\(self.showPrice)").foregroundColor(.snappBackground).font(.custom("IRANSansMobileFaNum-Medium",size: 25))
            Spacer()
            Image(uiImage: UIImage()).resizable().frame(width:1).background(Color.snappTextDisabled)
            Text("کد تخفیف؟").frame(width:85).foregroundColor(.snappForeground).font(.custom("IRANSansMobileFaNum-Bold",size: 16))
        }
        .frame(height: 45)
    }
}
