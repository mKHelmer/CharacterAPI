//
//  CharacterTableViewCell.swift
//  RandMAPI
//
//  Created by Soul Master on 11/21/19.
//  Copyright © 2019 Mikki Helmer. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterSpecies: UILabel!
    
    //landingpad broh!
    
    var rnmCharacter: Character? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let character = rnmCharacter else { return }
        CharacterController.fetchImageFor(character) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.characterImage.image = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self.characterLabel.text = character.name
                self.characterStatus.text = character.status
                self.characterSpecies.text = character.species
            }
        }
    }
    
}
