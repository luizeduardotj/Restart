//
//  HomeView.swift
//  Restart
//
//  Created by Luiz Oliveira on 23/12/21.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            // MARK: - Header
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2").resizable().scaledToFit().padding()
            }
            
            // MARK: - Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.").font(.title3).fontWeight(.light).foregroundColor(.secondary).multilineTextAlignment(.center).padding()
            
            // MARK: - Footer
            
            Spacer()
            
            
            
            Button(action: {
                isOnboardingViewActive = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Restart").font(.system(.title3, design: .rounded)).fontWeight(.bold)
            }.buttonStyle(.borderedProminent).buttonBorderShape(.capsule).controlSize(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
