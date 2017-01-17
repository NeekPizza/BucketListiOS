//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by Nick Piazza on 1/16/17.
//  Copyright © 2017 Nick Piazza. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
	
	@IBOutlet weak var itemTextField: UITextField!
 	weak var delegate: AddItemTableViewControllerDelegate?
	var item: String?
	var indexPath: NSIndexPath?

	@IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
		print("Add item table view controller - cancel button clicked")
		if let this_delegate = delegate{
			print(this_delegate)
		}
		else{
			print("no delegate")
		}
		delegate?.cancelButtonPressed(by: self)
		
	}
	@IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
		let text =  itemTextField.text
		delegate?.itemSaved(by: self, with: text!, at: indexPath)
		
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
				itemTextField.text = item

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
