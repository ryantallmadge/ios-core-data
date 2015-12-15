//
//  RecipeTableViewCell.swift
//  recipez
//
//  Created by Ryan Tallmadge on 12/15/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(recipe : Recipe){
        recipeTitle.text = recipe.title;
        recipeImage.image = recipe.getRecipeImage();
        
    }

}
