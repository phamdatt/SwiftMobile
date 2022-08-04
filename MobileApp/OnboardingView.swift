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
        VStack(spacing:20){
            Text("onBoarding").font(.largeTitle)
            Button(action:{
                isOnboardingViewActive = false
            }){
                Text("Startsss")
            }
        }
    }
}

struct OnboadingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboadingView()
    }
}
