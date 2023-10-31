//
//  ViewController.swift
//  tempAni
//
//  Created by Ярослав on 31.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let dot: UIView = {
        let width: CGFloat = 150
        let view = UIView()
        view.backgroundColor = .systemMint
        view.snp.makeConstraints {
            $0.size.equalTo(width)
        }
        view.layer.cornerRadius = width / 2
        view.alpha = 1
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
        view.addSubview(dot)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animate))
        dot.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func makeConstraints() {
        dot.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func animate() {
        let animation = CASpringAnimation(keyPath: "transform")
        animation.stiffness = 150
        animation.damping = 10
        animation.mass = 1
        animation.fromValue = CGAffineTransform(scaleX: 0, y: 0)
        animation.toValue = CGAffineTransform.identity
        dot.layer.add(animation, forKey: nil)
    }
}
