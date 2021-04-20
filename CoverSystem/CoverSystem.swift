//
//  CoverSystem.swift
//  CoverSystem
//
//  Created by Chris Wu on 4/20/21.
//

import Foundation
import SwiftUI

class CoverSystem : ObservableObject {
    public static let shared = CoverSystem()
    
    enum RouteTaken: Identifiable {
        case theBasics
        case helloWorld
        
        var id: String {
            switch self {
                case .theBasics:
                    return "theBasics"
                case .helloWorld:
                    return "helloWorld"
            }
        }
        
        @ViewBuilder
        func makeSheetView() -> some View {
            NavigationView {
                switch self {
                    case .theBasics:
                     Basics()
                    case .helloWorld:
                        Text("Hello world")
                }
            }
        }
    }
    
    @Published var routeTaken: RouteTaken?
}
