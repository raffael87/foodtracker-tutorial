//
//  ViewController.swift
//  FoodTracker
//
//  Created by Raffael Lorenz on 09.05.17.
//  Copyright © 2017 LoRa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text fields user input through delegate callbacks
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true;
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss picker if user touches cancel.
        dismiss(animated: true, completion: nil) // animated true means that the dismissal is animated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Info dictionary can contain multiple representations of the same image, but in this case we use the original image.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // display selected image.
        photoImageView.image = selectedImage
        
        // dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Actions

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard so when user taps the image field the keyboard disappears.
        nameTextField.resignFirstResponder()
        
        // create an image picker controller.
        let imagePickerController = UIImagePickerController()
        // allow only select images, not take images.
        imagePickerController.sourceType = .photoLibrary
        // make sure ViewController is notified when user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}

