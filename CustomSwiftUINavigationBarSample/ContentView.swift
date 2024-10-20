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
              .customNavigationBarBackground(.blue)
              .customNavigationBarForeground(.white)
          } label: {
            Text("Title w/ Subtitle")
          }
          
          CustomNavigationLink {
            Text("Title Label with Subtitle Label")
              .customNavigationTitleLabel {
                HStack {
                  Image(systemName: "note.text")
                  Text("Title label")
                    .font(.title)
                    .fontWeight(.semibold)
                }
              }
              .customNavigationSubtitleLabel {
                HStack {
                  Image(systemName: "note.text")
                  Text("Subtitle label")
                }
              }
              .customNavigationBarBackground(.blue)
              .customNavigationBarForeground(.white)
          } label: {
            Text("Title Label w/ Subtitle Label")
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
        CustomNavigationBarContainer {
          switch route {
          case .titleSubtitle:
            Text("Title with Subtitle")
              .customNavigationTitle("Custom title")
              .customNavigationSubtitle("Subtitle!")
          case .titleLabelSubtitleLabel:
            Text("Title Label with Subtitle Label")
              .customNavigationTitleLabel {
                HStack {
                  Image(systemName: "note.text")
                  Text("Title label")
                    .font(.title)
                    .fontWeight(.semibold)
                }
              }
              .customNavigationSubtitleLabel {
                HStack {
                  Image(systemName: "note.text")
                  Text("Subtitle label")
                }
              }
              .customNavigationBarBackground(.teal)
              .customNavigationBarForeground(.black)
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
