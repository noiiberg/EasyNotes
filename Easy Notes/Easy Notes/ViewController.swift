//
//  ViewController.swift
//  Easy Notes
//
//  Created by Noi Berg on 04.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet var lable: UILabel!
    
    // Data
    var arrayNotes: [(title: String, notes: String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        table.delegate = self
        table.dataSource = self
        
    }
    
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.complition = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.arrayNotes.append((title: noteTitle, notes: note))
            self.lable.isHidden = true
            self.table.isHidden = false
            
            self.table.reloadData()
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }

    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayNotes[indexPath.row].title
        cell.detailTextLabel?.text = arrayNotes[indexPath.row].notes
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let arrayNote = arrayNotes[indexPath.row]
        
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = arrayNote.title
        vc.note = arrayNote.notes
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // Delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            arrayNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
}

