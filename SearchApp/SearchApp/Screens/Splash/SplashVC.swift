//
//  SplashhVC.swift
//  SearchApp
//
//  Created by ArdaSisli on 4.06.2022.
//

import UIKit

class SplashVC: UIViewController {

    //MARK: - Views
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Invio")
        image.alpha = 0.9
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animation()
        configure()
    }
    
    func animation() {
        UIView.animate(withDuration: 2, animations: {
            self.logoImage.alpha = 1
        }, completion: { _ in
            let viewController = UINavigationController(rootViewController: MovieListBuilder.make())
            viewController.modalPresentationStyle = .fullScreen
            self.show(viewController, sender: nil)
        })
    }
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(logoImage)
        makeLogo()
    }
}

extension SplashVC {
    func makeLogo() {
        logoImage.snp.makeConstraints { make in
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .top
                .equalTo(view.frame.height / 2.5)
            make
                .height
                .equalTo(100)
        }
    }
}
