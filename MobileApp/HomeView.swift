//
//  HomeView.swift
//  MobileApp
//
//  Created by Mr.Donals on 03/08/2022.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                CircleGroupView(ShapeColor: .gray, ShapeOpacityColor: 0.1)
                Image("character-2").resizable().scaledToFit().padding()
            }
            Text("The time that leads to master intensity of our focus.").font(.title3).fontWeight(.light).foregroundColor(.secondary).multilineTextAlignment(.center).padding()
            Spacer()
            Button(action:{
                isOnboardingViewActive=true
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Restart").font(.system(.title3,design: .rounded)).fontWeight(.bold)
            }.buttonStyle(.borderedProminent).buttonBorderShape(.capsule).controlSize(.large)
        }
    }
}	
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
