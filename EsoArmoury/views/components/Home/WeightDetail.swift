//
//  WeightDetail.swift
//  EsoArmoury
//
//  Created by walnut on 8/29/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct WeightDetail: View {
    @EnvironmentObject var userData: UserData
    var weight: ItemType
    var body: some View {
        NavigationLink(
            destination: ArmorListNoScroll(weight: weight.id),
            //.environmentObject(self.userData),
            label:  {
                HStack(alignment: .top, spacing: 5) {
                    //if (weight.id >= 1003 ) {
                    ZStack(alignment: .bottomLeading) {
                        
                        weight.image
                            .resizable()
                            .scaledToFill()
                            
                            .cornerRadius(10)
                        
                        Rectangle()
                            .frame(width:UIScreen.main
                                .bounds.width * 0.9, height: 50)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .opacity(0.3)
                        
                        VStack(alignment: .center) {
                            Text(weight.weight)
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(.leading)
                                .padding(.bottom, 5)
                                .padding(.trailing)
                        }
                    }
                    
                }
                
        }
            
        )
        
    }
}

#if DEBUG
struct WeightDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return WeightDetail(weight: weightData[10])
            .environmentObject(userData)
    }
}
#endif
