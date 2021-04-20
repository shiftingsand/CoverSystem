//
//  ContentView.swift
//  CoverSystem

//  An example of the cover system I'm trying out. I did NOT come up with the idea for the class and enum.
//  It is based off of code from Thomas Ricouard.
//
// https://github.com/Dimillian/ACHNBrowserUI/blob/main/ACHNBrowserUI/ACHNBrowserUI/env/UIState.swift
//
//
//
//  Created by Chris Wu on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var theCover = CoverSystem.shared
    @State var simpleToggle = true
    var body: some View {
        VStack {
            Button("push me") {
                if simpleToggle {
                    theCover.routeTaken = CoverSystem.RouteTaken.theBasics
                } else {
                    theCover.routeTaken = CoverSystem.RouteTaken.helloWorld
                }
                simpleToggle.toggle()
            }
        }
        .sheet(item: $theCover.routeTaken, onDismiss: {
            theCover.routeTaken = nil
        }, content: { theItemArg in // apple docs show the arg is related to the "item" from fullScreenCover
            theItemArg.makeSheetView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
