//
//  CircleGroupView.swift
//  DORIC
//
//  Created by Mr.Donals on 10/08/2022.
//

import SwiftUI

struct CircleGroupView: View {
    
    //Property
    @State var ShapeColor:Color
    @State var ShapeOpacityColor:Double
    var body: some View {
        ZStack{
            Circle().stroke(ShapeColor.opacity(ShapeOpacityColor),lineWidth: 40).frame(width: 260, height: 260, alignment: .center)
            Circle().stroke(ShapeColor.opacity(ShapeOpacityColor),lineWidth: 80).frame(width: 260, height: 260, alignment: .center)
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all,edges: .all)
            CircleGroupView(ShapeColor: .white,ShapeOpacityColor: 0.2)
        }
    }
}
