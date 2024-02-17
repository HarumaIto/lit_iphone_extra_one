//
//  ContentView.swift
//  CountSwiftUI
//
//  Created by Haruma Ito on 2024/02/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    @State var textColor: Color = .black
    
    func changeTextColor() {
        if count >= 10 {
            textColor = .red
        } else if count <= -10 {
            textColor = .blue
        } else {
            textColor = .black
        }
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .frame(width: 100, height: 100)
                .font(.system(size: 48))
                .foregroundStyle(textColor)
                .padding()
            
            HStack {
                Button("+") {
                    count = count + 1
                    
                    changeTextColor()
                }
                .font(.system(size: 48))
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .background(.red)
                
                Button("-") {
                    count = count - 1
                    
                    changeTextColor()
                }
                .font(.system(size: 48))
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .background(.blue)
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
