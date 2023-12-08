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
    
    private lazy var infoView: UIView = {
        var view = UIView()
        view.cornerRadius = 5
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var emailTextField: LineTextField = {
        var textField = LineTextField()
        textField.title = "E-mail"
        textField.placeHolder = "Enter E-mail"
        return textField
    }()
    
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
        
        contentView.addSubview(infoView)
        infoView.addSubview(forgotPasswordtButton)
        infoView.addSubview(emailTextField)
    }
    
    private func setupConstrains() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(loginButton.snp.centerY)

        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(newAccountButton.snp.top).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        forgotPasswordtButton.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(16.0)
            make.height.equalTo(17.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
            make.bottom.equalTo(forgotPasswordtButton.snp.top).inset(-20.0)
        }

    }
}
