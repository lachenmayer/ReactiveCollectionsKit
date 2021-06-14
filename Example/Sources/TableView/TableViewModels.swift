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

import ReactiveCollectionsKit
import UIKit

struct PersonTableCellViewModel: CellViewModel {
    let person: PersonModel
    let didSelect: CellActions.DidSelect

    var id: UniqueIdentifier { self.person.name }

    let registration = ReusableViewRegistration(classType: PersonTableCell.self)

    func height<V: UIView & CellContainerViewProtocol>(in containerView: V) -> CGFloat {
        60
    }

    func apply(to cell: Self.CellType) {
        let cell = cell as! PersonTableCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.person.name
        cell.detailTextLabel?.text = "\(self.person.nationality) \(self.person.birthDateText)"
    }
}

struct PersonTableHeaderViewModel: SupplementaryViewModel {
    let kind = SupplementaryViewKind.header
    let style = SupplementaryViewStyle.title("Comrades")

    func height<V: UIView & CellContainerViewProtocol>(in containerView: V) -> CGFloat {
        44
    }
}

struct PersonTableFooterViewModel: SupplementaryViewModel {
    let kind = SupplementaryViewKind.footer
    let style = SupplementaryViewStyle.title("Note: list is incomplete")

    func height<V: UIView & CellContainerViewProtocol>(in containerView: V) -> CGFloat {
        44
    }
}

struct ColorTableCellViewModel: CellViewModel {
    let color: ColorModel

    var id: UniqueIdentifier { "\(self.color.red)_\(self.color.green)_\(self.color.blue)" }

    let registration = ReusableViewRegistration(classType: UITableViewCell.self)

    let didSelect = CellActions.DidSelectNoOperation

    let shouldHighlight = false

    func height<V: UIView & CellContainerViewProtocol>(in containerView: V) -> CGFloat {
        50
    }

    func apply(to cell: Self.CellType) {
        let cell = cell as! UITableViewCell
        cell.backgroundColor = self.color.uiColor
    }
}

struct ColorTableHeaderViewModel: SupplementaryViewModel {
    let kind = SupplementaryViewKind.header
    let style = SupplementaryViewStyle.title("Random Colors")

    func height<V: UIView & CellContainerViewProtocol>(in containerView: V) -> CGFloat {
        44
    }
}
