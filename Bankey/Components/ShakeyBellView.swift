//
//  ShakeyBellView.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 14.02.2022.
//

import UIKit

class ShakeyBellView: UIView {
    
    let imageView = UIImageView()
    
    let buttonView = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
    
    private func setup() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(singleTap)
        imageView.isUserInteractionEnabled = true
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "bell.fill")!.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = image
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = .systemRed
        buttonView.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        buttonView.layer.cornerRadius = 8
        buttonView.setTitle("7", for: .normal)
        buttonView.setTitleColor(.white, for: .normal)
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(buttonView)
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        buttonView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -9).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
}

extension ShakeyBellView {
    @objc private func imageViewTapped(_ recognizer: UITapGestureRecognizer) {
        shakeWith(duration: 1.0, angle: .pi/8, yOffset: 0.0)
    }
    
    private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {
        let numberOfFrames: Double = 6
        let frameDuration = Double(1 / numberOfFrames)
        
        imageView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset))
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 2, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 3, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 4, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 5, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform.identity
            }
        }, completion: nil)
    }
}
