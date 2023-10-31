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
        self.dot.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.14,
                       options: [.allowUserInteraction]) {
            self.dot.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
