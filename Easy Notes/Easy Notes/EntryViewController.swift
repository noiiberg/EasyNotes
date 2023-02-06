//
//  EntryViewController.swift
//  Easy Notes
//
//  Created by Noi Berg on 04.02.2023.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet public var titleField: UITextField!
    @IBOutlet public var noteField: UITextView!
    
    public var complition: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
       
    }

    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            complition?(text, noteField.text)
        }
    }

}

