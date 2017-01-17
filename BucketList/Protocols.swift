//
//  Protocols.swift
//  BucketList
//
//  Created by Nick Piazza on 1/16/17.
//  Copyright © 2017 Nick Piazza. All rights reserved.
//

import UIKit

protocol AddItemTableViewControllerDelegate: class {
	func itemSaved(by controller:AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
	func cancelButtonPressed(by controller: AddItemTableViewController)
}
