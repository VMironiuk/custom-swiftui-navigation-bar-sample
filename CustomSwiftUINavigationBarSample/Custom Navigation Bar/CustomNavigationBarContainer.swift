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
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    VStack(spacing: 0) {
      CustomNavigationBar(
        showBackButton: showBackButton,
        title: title,
        subtitle: subtitle
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
  }
}

#Preview {
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
