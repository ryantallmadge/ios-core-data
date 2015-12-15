//
//  Recipe.swift
//  recipez
//
//  Created by Ryan Tallmadge on 12/15/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation
import CoreData
import UIKit;

class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setRecipeImage(img : UIImage) {
        let data = UIImagePNGRepresentation(img);
        self.image = data;
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!);
        return img!;
    }
    

}
