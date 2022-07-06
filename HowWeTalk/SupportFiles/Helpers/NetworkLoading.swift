//
//  NetworkLoading.swift
//  HowWeTalk
//
//  Created by The Ngoc on 2022/07/06.
//

import UIKit
import Lottie

class NetworkLoading {
    
    let window = UIApplication.shared.windows[0]
    var blurView = UIVisualEffectView()
    var animationView = AnimationView()
    var loadingView = UIView()
    var loadingLabel = UILabel()
  
    func endLoading() {
        animationView.removeFromSuperview()
        blurView.removeFromSuperview()
    }
    
    func startLoading() {
        window.addSubview(blurView)
        blurView.frame = window.frame
        blurView.effect = UIBlurEffect(style: .dark)
        setupLoadingView()
        setupAnimationView()
        setupLoadingLabel()
    }
   
    private func setupLoadingView() {
        blurView.contentView.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.backgroundColor = .white
        loadingView.layer.cornerRadius = 75
        loadingView.layer.masksToBounds = true
        let constraints = [
            loadingView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 150),
            loadingView.heightAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupAnimationView() {
        loadingView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animation = Animation.named("loading")
        animationView.play()
        animationView.loopMode = .loop
        let constraints = [
            animationView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupLoadingLabel() {
        loadingView.addSubview(loadingLabel)
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.text = "LOADING"
        loadingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        loadingLabel.textColor = .black
        let constraints = [
            loadingLabel.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            loadingLabel.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: -18),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

