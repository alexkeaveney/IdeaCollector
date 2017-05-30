//
//  IdeaViewController.swift
//  IdeaCollector
//
//  Created by admin on 30/05/2017.
//  Copyright © 2017 Alex Keaveney. All rights reserved.
//

import UIKit

class IdeaViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var ideaTextField: UITextField!
    @IBOutlet weak var ideaImageView: UIImageView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        //gives the user an option to select photos from their entire photo album
        imagePicker.sourceType = .photoLibrary
        
        //shows the image picker to the user
        present(imagePicker, animated: true, completion: nil)
    }
    
    //called whenever a user selects a photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //creates image from selected image
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //sets that image to the image view image
        ideaImageView.image = image
        
        //dismiss image picker
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
    }

    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let idea = Idea(context: context)
        idea.title = ideaTextField.text
        
        //convert UIImage to NSData
        idea.image = UIImagePNGRepresentation(ideaImageView.image!)! as NSData
        
        //saves the new context
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //go back to table view
        
        navigationController?.popViewController(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
