//
//  CustomNavigationBarPreferenceKeys.swift
//  CustomSwiftUINavigationBarSample
//
//  Created by Volodymyr Myroniuk on 12.10.2024.
//

import SwiftUI

struct CustomNavigationBarShowBackButtonPreferenceKey: PreferenceKey {
  static var defaultValue: Bool = true
  static func reduce(value: inout Bool, nextValue: () -> Bool) {
    value = nextValue()
  }
}

struct CustomNavigationBarTitlePreferenceKey: PreferenceKey {
  static var defaultValue: String = ""
  static func reduce(value: inout String, nextValue: () -> String) {
    value = nextValue()
  }
}

struct CustomNavigationBarSubtitlePreferenceKey: PreferenceKey {
  static var defaultValue: String? = nil
  static func reduce(value: inout String?, nextValue: () -> String?) {
    value = nextValue()
  }
}

struct CustomNavigationBarTitleLabelPreferenceKey: PreferenceKey {
  static var defaultValue: EquatableViewContainer? = nil
  static func reduce(value: inout EquatableViewContainer?, nextValue: () -> EquatableViewContainer?) {
    value = nextValue()
  }
}

struct CustomNavigationBarSubtitleLabelPreferenceKey: PreferenceKey {
  static var defaultValue: EquatableViewContainer? = nil
  static func reduce(value: inout EquatableViewContainer?, nextValue: () -> EquatableViewContainer?) {
    value = nextValue()
  }
}

extension View {
  func showBackButton(_ showBackButton: Bool) -> some View {
    preference(key: CustomNavigationBarShowBackButtonPreferenceKey.self, value: showBackButton)
  }
  
  func customNavigationTitle(_ title: String) -> some View {
    preference(key: CustomNavigationBarTitlePreferenceKey.self, value: title)
  }
  
  func customNavigationSubtitle(_ subtitle: String?) -> some View {
    preference(key: CustomNavigationBarSubtitlePreferenceKey.self, value: subtitle)
  }
  
  func customNavigationTitleLabel<Label: View>(@ViewBuilder label: @escaping () -> Label) -> some View {
    let container = EquatableViewContainer(view: AnyView(label()))
    return preference(key: CustomNavigationBarTitleLabelPreferenceKey.self, value: container)
  }
  
  func customNavigationSubtitleLabel<Label: View>(@ViewBuilder label: @escaping () -> Label) -> some View {
    let container = EquatableViewContainer(view: AnyView(label()))
    return preference(key: CustomNavigationBarSubtitleLabelPreferenceKey.self, value: container)
  }
}

struct EquatableViewContainer: Equatable {
  let id = UUID().uuidString
  let view: AnyView
  
  static func == (lhs: EquatableViewContainer, rhs: EquatableViewContainer) -> Bool {
    lhs.id == rhs.id
  }
}
