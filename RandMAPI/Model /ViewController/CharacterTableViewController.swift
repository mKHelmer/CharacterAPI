//
//  CharacterTableViewController.swift
//  RandMAPI
//
//  Created by Soul Master on 11/21/19.
//  Copyright © 2019 Mikki Helmer. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    var character: [Character] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as?
        CharacterTableViewCell else { return
            UITableViewCell()}

        let character = Character[indexPath.row]
        cell?.rnmCharacter = character
        }

        return cell
    }

