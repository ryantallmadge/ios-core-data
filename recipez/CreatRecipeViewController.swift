//
//  CreatRecipeViewController.swift
//  recipez
//
//  Created by Ryan Tallmadge on 12/15/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit
import CoreData;

class CreatRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addImage: CircleImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeItems: UITextField!
    @IBOutlet weak var recipeTitle: UITextField!
    
    var imagePicker : UIImagePickerController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addImageButtonPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal);
        presentViewController(imagePicker, animated: true, completion: nil);
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil);
        addImage.image = image;
    }
    
    

    @IBAction func addRecipeButtonPressed(sender: AnyObject) {
        
        if let title = recipeTitle.text where title != "" {
            
            let app     = UIApplication.sharedApplication().delegate as! AppDelegate;
            let context = app.managedObjectContext;
            let entity  = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context);
            
            let recipe = Recipe(entity: entity!, insertIntoManagedObjectContext : context);
            
            recipe.title = title;
            recipe.steps = recipeSteps.text;
            recipe.items = recipeItems.text;
            recipe.setRecipeImage(addImage.image!);
            
            context.insertObject(recipe);
            do {
                try context.save();
            } catch {
                print("could not save recipe");
            }
            
            self.navigationController?.popViewControllerAnimated(true);
            
        }
        
    }

    

}
