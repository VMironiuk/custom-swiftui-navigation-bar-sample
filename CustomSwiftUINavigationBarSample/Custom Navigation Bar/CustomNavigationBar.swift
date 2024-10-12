//
//  CustomNavigationBar.swift
//  CustomSwiftUINavigationBarSample
//
//  Created by Volodymyr Myroniuk on 12.10.2024.
//

import SwiftUI

struct CustomNavigationBar: View {
  @Environment(\.dismiss) private var dismiss
  let showBackButton: Bool
  let title: String
  let subtitle: String?
  
  var body: some View {
    HStack {
      if showBackButton {
        backButton
      }
      Spacer()
      titleSection
      Spacer()
      if showBackButton {
        backButton
          .opacity(0)
      }
    }
    .padding()
    .tint(.white)
    .foregroundStyle(.white)
    .font(.headline)
    .background(Color.blue)
  }
}

private extension CustomNavigationBar {
  private var backButton: some View {
    Button {
      dismiss()
    } label: {
      Image(systemName: "chevron.left")
    }
  }
  
  private var titleSection: some View {
    VStack {
      Text(title)
        .font(.title)
        .fontWeight(.semibold)
      if let subtitle {
        Text(subtitle)
      }
    }
  }
}

#Preview {
  VStack {
    CustomNavigationBar(
      showBackButton: true,
      title: "Title",
      subtitle: "Subtitle"
    )
    Spacer()
  }
}
