//
//  ViewController.swift
//  tempAni
//
//  Created by Ярослав on 31.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let dot1: UIView = {
        let width: CGFloat = 200
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.snp.makeConstraints {
            $0.size.equalTo(width)
        }
        view.layer.cornerRadius = width / 2
        view.alpha = 0.10
        return view
    }()
    
    let dot2: UIView = {
        let width: CGFloat = 150
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.snp.makeConstraints {
            $0.size.equalTo(width)
        }
        view.layer.cornerRadius = width / 2
        view.alpha = 0.20
        return view
    }()
    
    let dot3: UIView = {
        let width: CGFloat = 100
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.snp.makeConstraints {
            $0.size.equalTo(width)
        }
        view.layer.cornerRadius = width / 2
        view.alpha = 0.30
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
}

private extension ViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(dot1)
        view.addSubview(dot2)
        view.addSubview(dot3)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animate))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func makeConstraints() {
        dot1.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        dot2.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        dot3.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func animate() {
        dot1.layer.add(makeAnimation(stiffness: 100, damping: 12), forKey: nil)
        dot2.layer.add(makeAnimation(stiffness: 200, damping: 10), forKey: nil)
        dot3.layer.add(makeAnimation(stiffness: 300, damping: 12), forKey: nil)
    }
    
    func makeAnimation(stiffness: CGFloat, damping: CGFloat) -> CASpringAnimation {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 1
        animation.stiffness = stiffness
        animation.damping = damping
        animation.mass = 1
        animation.fromValue = 0
        animation.toValue = 1
        return animation
    }
}
