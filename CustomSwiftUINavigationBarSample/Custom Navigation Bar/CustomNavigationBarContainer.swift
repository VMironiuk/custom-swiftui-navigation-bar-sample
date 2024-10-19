//
//  CustomNavigationBarContainer.swift
//  CustomSwiftUINavigationBarSample
//
//  Created by Volodymyr Myroniuk on 12.10.2024.
//

import SwiftUI

struct CustomNavigationBarContainer<Content: View>: View {
  var content: Content
  @State private var showBackButton: Bool = true
  @State private var title: String = "Title"
  @State private var subtitle: String? = "Subtitle"
  @State private var titleLabel: EquatableViewContainer? = nil
  @State private var subtitleLabel: EquatableViewContainer? = nil
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    VStack(spacing: 0) {
      CustomNavigationBar(
        showBackButton: showBackButton,
        title: title,
        titleLabel: titleLabel?.view,
        subtitle: subtitle,
        subtitleLabel: subtitleLabel?.view
      )
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .toolbar(.hidden)
    .onPreferenceChange(CustomNavigationBarTitlePreferenceKey.self) { value in
      title = value
    }
    .onPreferenceChange(CustomNavigationBarSubtitlePreferenceKey.self) { value in
      subtitle = value
    }
    .onPreferenceChange(CustomNavigationBarShowBackButtonPreferenceKey.self) { value in
      showBackButton = value
    }
    .onPreferenceChange(CustomNavigationBarTitleLabelPreferenceKey.self) { value in
      titleLabel = value
    }
    .onPreferenceChange(CustomNavigationBarSubtitleLabelPreferenceKey.self) { value in
      subtitleLabel = value
    }
  }
}

#Preview("Titles") {
  CustomNavigationBarContainer {
    ZStack {
      Color.green.ignoresSafeArea()
      Text("Content")
        .foregroundStyle(.white)
        .customNavigationTitle("Title")
        .customNavigationSubtitle("Subtitle")
    }
  }
}

#Preview("Labels") {
  CustomNavigationBarContainer {
    ZStack {
      Color.green.ignoresSafeArea()
      Text("Content")
        .foregroundStyle(.white)
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
    }
  }
}
