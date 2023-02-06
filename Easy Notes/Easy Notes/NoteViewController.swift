//
//  NoteViewController.swift
//  Easy Notes
//
//  Created by Noi Berg on 04.02.2023.
//

import UIKit

class NoteViewController: UIViewController {

    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var noteLable: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLable.text = noteTitle
        noteLable.text = note
        
    }
    
}

