//
//  ContentView.swift
//  SubscriptionExampleApp
//
//  Created by Doğanay Şahin on 25.06.2022.
//

import SwiftUI

struct HomeView: View {
    @State var isSubscribed : Bool = false
    @State var showAlert : Bool = false
    
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.gray)
                Text("For using premium features, please subscribe.")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }.padding()

            GroupBox(label : Text("Premium content")){
                VStack{
  
                Image(systemName: "gear").foregroundColor(.green)
                    .font(.largeTitle)
                    .padding()
                    
                    
                    Button {
                        print("You are premium user now!")
                        self.showAlert.toggle()
                    } label: {
                        Text("Do something.")
                            .padding()
                            .foregroundColor(.gray)
                    }.disabled(!isSubscribed)
                    .alert("You are premium <3", isPresented: $showAlert) {
                                   Button("OK", role: .cancel) { }
                               }
                    
                    .background(.green)
                }
            }.blur(radius: isSubscribed ? 0 : 20)
        }.padding()
            .onAppear {
                isSubscribed = (UserDefaults.standard.bool(forKey: "purchased"))
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
