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
  let title: String?
  let titleLabel: AnyView?
  let subtitle: String?
  let subtitleLabel: AnyView?
  let background: Color
  let foreground: Color
  
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
    .tint(foreground)
    .foregroundStyle(foreground)
    .font(.headline)
    .background(background)
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
      if let title {
        Text(title)
          .font(.title)
          .fontWeight(.semibold)
      }
      if let titleLabel {
        titleLabel
      }
      if let subtitle {
        Text(subtitle)
      }
      if let subtitleLabel {
        subtitleLabel
      }
    }
  }
}

#Preview("Titles") {
  VStack {
    CustomNavigationBar(
      showBackButton: true,
      title: "Title",
      titleLabel: nil,
      subtitle: "Subtitle",
      subtitleLabel: nil,
      background: .blue,
      foreground: .white
    )
    Spacer()
  }
}

#Preview("Labels") {
  VStack {
    CustomNavigationBar(
      showBackButton: true,
      title: nil,
      titleLabel: AnyView(
        HStack {
          Image(systemName: "text.document.fill")
          Text("Title label")
            .font(.title)
            .fontWeight(.semibold)
        }
      ),
      subtitle: nil,
      subtitleLabel: AnyView(
        HStack {
          Image(systemName: "text.document.fill")
          Text("Subtitle label")
        }
      ),
      background: .blue,
      foreground: .white
    )
    Spacer()
  }
}

