//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://jessesquires.github.io/ReactiveCollectionsKit
//
//  GitHub
//  https://github.com/jessesquires/ReactiveCollectionsKit
//
//  Copyright © 2019-present Jesse Squires
//

import Foundation
import UIKit

/// A namespace for the actions for the `CellViewModel` protocol.
public enum CellActions {

    /// Describes a "did select" action for a cell.
    /// - Parameter IndexPath: The index path of the cell.
    /// - Parameter UICollectionView: The collection view for the cell.
    /// - Parameter UIViewController: The containing view controller.
    public typealias DidSelect = (IndexPath, UICollectionView, UIViewController) -> Void

    /// A "no-op" `DidSelect` implementation. It does nothing.
    /// You may use this in your `CellViewModel` conformance for cell view models that
    /// do not have a `DidSelect` action, since providing a `DidSelect` action is required.
    public static var DidSelectNoOperation: DidSelect { { _, _, _ in } }
}
