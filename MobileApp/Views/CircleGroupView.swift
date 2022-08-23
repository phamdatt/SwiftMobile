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
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle().stroke(ShapeColor.opacity(ShapeOpacityColor),lineWidth: 40).frame(width: 260, height: 260, alignment: .center)
            Circle().stroke(ShapeColor.opacity(ShapeOpacityColor),lineWidth: 80).frame(width: 260, height: 260, alignment: .center)
        }//:Zstack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
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
