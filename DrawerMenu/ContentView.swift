//
//  ContentView.swift
//  DrawerMenu
//
//  Created by LiYong on 22.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            HStack{
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing, 18)
                    .frame(width: 90, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 20)
                }.offset(x: -40, y: 50)
                
                Spacer()
            }
            
            MenuView(show: $show)
        }
    }
}

struct MenuView: View {
    
    @Binding var show: Bool
    
    var menu = [
        Menu(title: "My Account", icon: "person.crop.circle"),
        Menu(title: "Settings", icon: "gear"),
        Menu(title: "Billing", icon: "creditcard"),
        Menu(title: "Sign out", icon: "arrow.uturn.down")
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(20)
        .frame(minWidth: 0, maxWidth: 320)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.easeOut)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}


struct MenuRow: View {
    
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}


#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone X")
    }
}
#endif
