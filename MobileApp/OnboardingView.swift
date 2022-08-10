//
//  OnboadingView.swift
//  MobileApp
//
//  Created by Mr.Donals on 03/08/2022.
//

import SwiftUI

struct OnboadingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all,edges: .all)
            VStack(spacing: 20){
                // Header
                VStack(spacing: 0){
                    Text("Shared.").font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """).font(.title3).fontWeight(.light).foregroundColor(.white).multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                }
                ZStack{
                    // Center
                    CircleGroupView(ShapeColor: .white, ShapeOpacityColor: 0.2)
                    Image("character-1").resizable().scaledToFit()
                }
                Spacer()
                ZStack{
                    // Footer
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    Text("Get started").font(.system(.title3,design: .rounded)).fontWeight(.bold).foregroundColor(.white).offset(x:20)
                    HStack{
                        Capsule().fill(Color("ColorRed")).frame(width:80)
                        Spacer()
                    }
                    HStack{
                        ZStack{
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(.black.opacity(0.15)).padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24,weight: .bold))
                        }.foregroundColor(.white).frame(width:80, height:80, alignment: .center).onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    }
                }.frame( height: 80, alignment: .center).padding()
            }
        }
    }
}

struct OnboadingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboadingView()
    }
}
