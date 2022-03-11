//
//  LocalizedKeys.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 11/3/22.
//

import Foundation

struct LocalizedKeys {
	
	struct Generic {
		static let genericContinueButton = "generic_continue_button".localized // Continue
	}
	
	struct Splash {
		static let splashFirstTitleLabel = "splash_first_title_label".localized // An agile and simple relationship with public administrations
		static let splashSecondTitleLabel  = "splash_second_title_label".localized // Address change
		static let splashSubtitleLabel = "splash_subtitle_label".localized // Communicate your change of address to the different organizations without having to do it in person
	}
	
	struct Login {
		static let loginTitleLabel = "login_title_label".localized // To access the notification of change of address, you must do so through your electronic identity Key
		static let loginSwitchTextLabel = "login_switch_text_label".localized // I have read and accept the legal conditions
		static let loginButtonContinueTextLabel = "login_button_continue_text_label".localized // Access with Key
		static let loginButtonQuestionTextLabel = "login_button_question_text_label".localized // ¿What is the Key?
	}
	
	struct Message {
		static let messageTitleLabel = "message_title_label".localized // Info
		static let messageDescriptionLabel = "message_description_label".localized // Once you have completed a new registration, here you will be able to notify the different administration bodies (such as the General Directorate of Traffic, the tax agency and Social Security, among others), of your change of address without having to do it in person at each of them. \n\n In the event that the correct information for the last registration carried out does not appear, you should contact your registration office.
	}
	
	struct Identity {
		static let IdentityGreetingLabel = "identity_greeting_label".localized // Hello
		static let IdentityLastNamePlaceHolder = "identity_last_name_placeHolder".localized // Last Name
		static let IdentityNIFPlaceHolder = "identity_nif_placeHolder".localized // NIF
		static let IdentityValidationPlaceHolder = "identity_validation_placeHolder".localized // validation
		static let IdentityAddressRegisteredPlaceHolder = "identity_address_registered_placeHolder".localized // Registered Address
		static let IdentityCityPlaceHolder = "identity_city_placeHolder".localized // City
		
	}
	
}

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
