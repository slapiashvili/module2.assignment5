//
//  PopupViewController.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 30.10.23.
//

import UIKit

protocol PopupViewControllerDelegate: AnyObject {
    func addPanel(_ controller: PopupViewController, didAddName name: String)
}


class PopupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    weak var delegate: PopupViewControllerDelegate?
    
    var imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "defaultImagePop"))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter description"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var textBubble: UILabel = {
        let label = UILabel()
        label.text = "Don't let anyone stop you from adding a panel, my friend!"
        label.textColor = .customLightGray
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        return picker
    }()
    
    var selectImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Image", for: .normal)
        button.backgroundColor = .customBlueGray
        button.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        return button
    }()
    
    var selectedImageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "placeholderSelectedImageView"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.backgroundColor = .customBlueGray
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupViews() {
        setupBlurEffect()
        setupImageView()
        setupTextBubble()
        setupTextField()
        setupSelectImageButton()
        setupAddPanelButton()
        setupSelectedImageView()
        
        imagePicker.delegate = self
    }
    
    func setupAddPanelButton() {
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 40))
        button.setTitle("Add Panel", for: .normal)
        button.addTarget(self, action: #selector(didTapAddPanel), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func setupSelectedImageView() {
        let blurWidth = view.bounds.width - (view.bounds.width / 16)
        let imageViewWidth = blurWidth / 2
        let imageViewHeight = imageViewWidth
        
        let imageViewX = (view.bounds.width - imageViewWidth) / 2
        let imageViewY = selectImageButton.frame.maxY + 10
        
        selectedImageView.frame = CGRect(x: imageViewX, y: imageViewY, width: imageViewWidth, height: imageViewHeight)
        
        view.addSubview(selectedImageView)
    }
    
    func setupSelectImageButton() {
        let blurWidth = view.bounds.width - (view.bounds.width / 16)
        let blurHeight = view.bounds.height - (view.bounds.height / 4.5)
        
        let buttonWidth = 3.7 * blurWidth / 4
        let buttonHeight = blurHeight / 8
        
        let buttonX = (view.bounds.width - buttonWidth) / 2
        let buttonY = ((view.bounds.height - blurHeight) / 2) + (blurHeight / 4) - (buttonHeight / 2)
        
        selectImageButton.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        
        selectImageButton.setTitle("Select Image", for: .normal)
        selectImageButton.backgroundColor = .customBlueGray
        selectImageButton.setTitleColor(.white, for: .normal)
        selectImageButton.layer.cornerRadius = 10  // Optional rounded corners
        
        selectImageButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        view.addSubview(selectImageButton)
    }
    
    func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        let sideLengthWidth = view.bounds.width - (view.bounds.width / 16)
        let sideLengthHeight = view.bounds.height - (view.bounds.height / 4.5)
        
        blurEffectView.frame = CGRect(x: (view.bounds.width - sideLengthWidth) / 2, y: (view.bounds.height - sideLengthHeight) / 2, width: sideLengthWidth, height: sideLengthHeight)
        
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.clipsToBounds = true
        
        view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)
    }
    
    func setupTextBubble() {
        textBubble.text = "Don't let anyone stop you from adding a panel, my friend!"
        textBubble.textColor = .white
        textBubble.backgroundColor = .clear
        textBubble.textAlignment = .center
        textBubble.numberOfLines = 0
        
        let bubbleWidth: CGFloat = self.view.bounds.width * 2 / 3
        let bubbleHeight: CGFloat = self.view.bounds.width / 4
        let padding: CGFloat = 15
        
        
        let xPosition: CGFloat = (self.view.bounds.width - bubbleWidth) / 2
        let yPosition = self.view.bounds.height - bubbleHeight - padding
        
        let containerView = UIView(frame: CGRect(x: xPosition,
                                                 y: yPosition,
                                                 width: bubbleWidth,
                                                 height: bubbleHeight))
        containerView.backgroundColor = .darkGray
        containerView.layer.cornerRadius = bubbleHeight / 2
        containerView.clipsToBounds = true
        
        textBubble.frame = CGRect(x: padding, y: padding, width: bubbleWidth - 2 * padding, height: bubbleHeight - 2 * padding)
        containerView.addSubview(textBubble)
        
        self.view.addSubview(containerView)
    }
    
    func setupTextField() {
        let sideLengthWidth = view.bounds.width - (view.bounds.width / 16)
        let sideLengthHeight = view.bounds.height - (view.bounds.height / 4.5)
        
        let textFieldWidth = 3.7 * sideLengthWidth / 4
        let textFieldHeight = sideLengthHeight / 10
        let padding: CGFloat = 50
        let textFieldXPosition = (view.bounds.width - sideLengthWidth) / 2 + (sideLengthWidth - textFieldWidth) / 2
        let textFieldYPosition = (view.bounds.height - sideLengthHeight) / 2 + padding
        
        textField.frame = CGRect(x: textFieldXPosition, y: textFieldYPosition, width: textFieldWidth, height: textFieldHeight)
        textField.delegate = self
        textField.resignFirstResponder()
        view.addSubview(textField)
    }
    
    func setupImageView() {
        
        guard let image = UIImage(named: "transparentGuts") else {
            return
        }
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        
        let height = self.view.bounds.height / 3
        
        let ratio = image.size.width / image.size.height
        let width = height * ratio
        
        let size = CGSize(width: width, height: height)
        
        imageView.frame = CGRect(x: self.view.frame.width - size.width,
                                 y: self.view.frame.height - size.height,
                                 width: size.width,
                                 height: size.height)
        
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin]
        
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
    }
    
    @objc func didTapAddPanel() {
        guard let image = selectedImageView.image, let description = textField.text, !description.isEmpty else {
            return
        }
                
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        openImagePicker()
    }
    
    @objc func openImagePicker() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func dismissPopup() {
        dismiss(animated: true, completion: nil)
    }
}

extension PopupViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            selectedImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


