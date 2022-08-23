//
//  OnboadingView.swift
//  MobileApp
//
//  Created by Mr.Donals on 03/08/2022.
//

import SwiftUI

struct OnboadingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth:Double = UIScreen.main.bounds.width-80;
    @State private var buttonOffset:CGFloat=0
    @State private var isAnimation: Bool = false
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    
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
                }.opacity(isAnimation ? 1 : 0)
                    .offset(y:isAnimation ? 0 : -40)
                    .animation(.easeOut(duration: 1),value:isAnimation)
                ZStack{
                    // Center
                    CircleGroupView(ShapeColor: .white, ShapeOpacityColor: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1").resizable().scaledToFit()
                        .opacity(isAnimation ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimation)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(DragGesture().onChanged{ value in
                            if abs(imageOffset.width) <= 150 {
                                imageOffset = value.translation
                            }
                        }
                                    .onEnded{
                            _ in
                                     imageOffset = .zero
                        }
                        ).animation(.easeOut(duration: 1), value: imageOffset)
                }
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44,weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y:20)
                        .opacity(isAnimation ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimation)
                    ,alignment: .bottom)
                Spacer()
                ZStack{
                    // Footer
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    Text("Get started").font(.system(.title3,design: .rounded)).fontWeight(.bold).foregroundColor(.white).offset(x:20)
                    HStack{
                        Capsule().fill(Color("ColorRed")).frame(width:buttonOffset + 80)
                        Spacer()
                    }
                    HStack{
                        ZStack{
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(.black.opacity(0.15)).padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24,weight: .bold))
                        }.foregroundColor(.white).frame(width:80, height:80, alignment: .center)
                            .offset(x:buttonOffset)
                            .gesture(
                                DragGesture().onChanged{
                                    gesture in
                                        if gesture.translation.width > 0 && buttonOffset<=buttonWidth-80{
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                    .onEnded{
                                        _ in
                                        withAnimation(Animation.easeOut(duration: 0.4)){
                                            if buttonOffset > buttonWidth / 2{
                                                buttonOffset = buttonWidth - 80
                                                isOnboardingViewActive = false
                                            }else{
                                                buttonOffset = 0
                                            }
                                        }
                                    }
                            )
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    }
                }.frame( width:buttonWidth ,height: 80, alignment: .center).padding().opacity(isAnimation ? 1 : 0).offset(y:isAnimation ? 0 : 40).animation(.easeOut(duration: 1), value: isAnimation)
            }
        }.onAppear(perform:  {
            isAnimation = true
        })
    }
}

struct OnboadingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboadingView()
    }
}
