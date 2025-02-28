//
//  NavigationPath.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import SwiftUI
import ComposableArchitecture

@Reducer
enum PathFeature {
  case firstFeature(FirstFeature)
  case secondFeature(SecondFeature)
  case thirdFeature(ThirdFeature)
  case fourthFeature(FourthFeature)
}

extension PathFeature.State: Equatable {}

enum FeatureType {
  case first, second, third, fourth
  func toPathState() -> PathFeature.State {
    switch self {
    case .first:
      return .firstFeature(FirstFeature.State())
    case .second:
      return .secondFeature(SecondFeature.State())
    case .third:
      return .thirdFeature(ThirdFeature.State())
    case .fourth:
      return .fourthFeature(FourthFeature.State())
    }
  }
}

struct NavigationHandler: View {
  let store: StoreOf<PathFeature>
  
  var body: some View {
    switch store.case {
    case let .firstFeature(firstFeature):
      FirstView(store: firstFeature)
    case let .secondFeature(secondFeature):
      SecondView(store: secondFeature)
    case let .thirdFeature(thirdFeature):
      ThirdView(store: thirdFeature)
    case let .fourthFeature(fourthFeature):
      FourthView(store: fourthFeature)
    }
  }
}

