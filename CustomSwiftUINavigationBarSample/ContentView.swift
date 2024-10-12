//
//  ContentView.swift
//  CustomSwiftUINavigationBarSample
//
//  Created by Volodymyr Myroniuk on 05.10.2024.
//

import SwiftUI

enum Route: Hashable {
  case titleSubtitle
  case titleLabelSubtitleLabel
}

struct ContentView: View {
  @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      List {
        Section {
          CustomNavigationLink {
            Text("Title with Subtitle")
              .customNavigationTitle("Custom title")
              .customNavigationSubtitle("Subtitle!")
          } label: {
            Text("Title w/ Subtitle")
          }
          NavigationLink("Title Label w/ Subtitle Label") {
            Text("Title Label with Subtitle Label")
              .navigationTitle("Default title")
          }
        } header: {
          Text("Navigation Link")
        }
        Section {
          Button("Title w/ Subtitle") {
            path.append(Route.titleSubtitle)
          }
          Button("Title Label w/ Subtitle Label") {
            path.append(Route.titleLabelSubtitleLabel)
          }
        } header: {
          Text("Navigation Path")
        }
      }
      .navigationDestination(for: Route.self) { route in
        switch route {
        case .titleSubtitle:
          Text("Title with Subtitle")
            .navigationTitle("Default title")
        case .titleLabelSubtitleLabel:
          Text("Title Label with Subtitle Label")
            .navigationTitle("Default title")
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
