//
//  LoginVC.swift
//  NoteMeProject
//
//  Created by user on 05.12.2023.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }()
    
    private lazy var loginButton: UIButton = .yellowRoundedButton("Login")
    private lazy var newAccountButton: UIButton = .underlineYellowButton("New Account")
    private lazy var forgotPasswordtButton: UIButton = .underlineGrayButton("Forgot Password")
    
    private lazy var cancelButton: UIButton = .cancelButton()
    private lazy var logoImageView: UIImageView = UIImageView(image: .General.logo)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrains()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        
        contentView.addSubview(loginButton)
        contentView.addSubview(newAccountButton)
        contentView.addSubview(forgotPasswordtButton)

    }
    
    private func setupConstrains() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)

        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
    }
}
