//
//  OnbordingView.swift
//  Restart
//
//  Created by Luiz Oliveira on 23/12/21.
//

import SwiftUI

struct OnbordingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - Header
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.").font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we out into giving
                    """).font(.title3).fontWeight(.light).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal, 10)
                }
                
                // MARK: - Center
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1").resizable().scaledToFit()
                }
                
                Spacer()
                
                // MARK: - Footer
                
                ZStack {
                    
                    // 1 - Background
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    
                    // 2 - Call-To-Action
                    
                    Text("Get started").font(.system(.title3, design: .rounded)).fontWeight(.bold).foregroundColor(.white).offset(x: 20)
                    
                    // 3 - Capsule
                    HStack {
                        Capsule().fill(Color("ColorRed")).frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    // 4 - Circle
                    
                    HStack {
                        ZStack {
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(.black.opacity(0.15)).padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24, weight: .bold))
                        }.foregroundColor(.white).frame(width: 80, height: 80, alignment: .center).offset(x: buttonOffset).gesture(
                            DragGesture().onChanged { gesture in
                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 70{
                                    buttonOffset = gesture.translation.width
                                }
                            }.onEnded { _ in
                                if buttonOffset > buttonWidth / 2 {
                                    buttonOffset = buttonWidth + 80
                                    isOnboardingViewActive = false
                                }
                                buttonOffset = 0
                            }
                        )
                        
                        Spacer()
                    }
                }.frame(width: buttonWidth, height: 80, alignment: .center).padding()
            }
        }
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}
