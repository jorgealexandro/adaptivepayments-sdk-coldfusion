<cfscript>
/*
adaptivepayments.cfc
This ColdFusion component used to to simplify the
creation of payload objects and parsing of responses
from PayPal apis so you only need to call these methods
to perform these API calls
*/
component output="false" {

	public service function init() hint="I initialize the component and return myself" output="false" {

		return this;
	}

	public any function payRequest(
		required string returnUrl,
		required string cancelUrl,
		required string receiverAmount,
		required string receiverEmail,
		required string actionType,
		required string currencyCode,
		string receiverPrimary,
		string errorLanguage="en_US",
		string ipAddress,
		string deviceId,
		string applicationId,
		string model,
		string geoLocation,
		string customerType,
		string partnerName,
		string customerId,
		string feesPayer,
		string ipnNotificationUrl,
		string memo,
		string pin,
		string preapprovalKey,
		boolean reverseAllParallelPaymentsOnError,
		string senderEmail,
		string trackingId,
		boolean useCredentials,
		string email,
		string receiverCountryCode,
		string receiverPhoneNumber,
		string receiverExtension,
		string receiverInvoiceId,
		string receiverPaymentType,
		string receiverSubType,
		string fundingType,
		string returnObj='response' ) {

		var receiverList = createObject("component","ReceiverList");
		var receiver = createObject("component","Receiver");


		if(ListLen(receiverAmount) eq ListLen(receiverEmail)) {
			for (i = 1; i lte Listlen(receiverAmount,',');  i = i + 1) {

				receiver.setAmount(ListGetAt(receiverAmount,i));
				receiver.setEmail(ListGetAt(receiverEmail,i));

				if (isDefined('arguments.receiverPrimary') AND len(trim(arguments.receiverPrimary))  gt 0 ){
				    receiver.setPrimary(ListGetAt(receiverPrimary,i));
				}


				if ( (isDefined('arguments.receiverCountryCode') AND len(trim(ListGetAt(receiverCountryCode,i)))  gt 0 ) AND
					(isDefined('arguments.receiverPhoneNumber') AND len(trim(ListGetAt(receiverPhoneNumber,i)))  gt 0 ) ) {

						var phoneNumber = createObject("component","PhoneNumberType").init(ListGetAt(receiverCountryCode,i),ListGetAt(receiverPhoneNumber,i));

						if (isDefined('arguments.receiverExtension') AND len(trim(ListGetAt(receiverExtension,i)))  gt 0 ){
						    phoneNumber.setExtension(ListGetAt(receiverExtension,i));
						}
				}

				if (isDefined('arguments.receiverInvoiceId') AND len(trim(arguments.receiverInvoiceId))  gt 0 ){
				    receiver.setInvoiceId(ListGetAt(receiverInvoiceId,i));
				}

				if (isDefined('arguments.receiverPaymentType') AND len(trim(arguments.receiverPaymentType))  gt 0 ){
				    receiver.setPaymentType(ListGetAt(receiverPaymentType,i));
				}

				if (isDefined('arguments.receiverPaymentSubType') AND len(trim(arguments.receiverPaymentSubType))  gt 0 ){
				    receiver.setPaymentSubType(ListGetAt(receiverPaymentSubType,i));
				}

				receiverList.init(receiver);
			}
		}

		var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var payRequest = createObject("component","PayRequest").init(requestEnvelope,actionType, cancelURL, currencyCode, receiverList,returnURL);

		if ( (isDefined('arguments.ipAddress') AND len(trim(arguments.ipAddress))  gt 0 ) OR
				(isDefined('arguments.deviceId') AND len(trim(arguments.deviceId)) gt 0 ) OR
				(isDefined('arguments.applicationId') AND len(trim(arguments.applicationId)) gt 0 ) OR
				(isDefined('arguments.model') AND len(trim(arguments.model)) gt 0 ) OR
				(isDefined('arguments.geoLocation') AND len(trim(arguments.geoLocation)) gt 0 ) OR
				(isDefined('arguments.customerType') AND len(trim(arguments.customerType)) gt 0 ) OR
				(isDefined('arguments.partnerName') AND len(trim(arguments.partnerName)) gt 0 ) OR
				(isDefined('arguments.customerId') AND len(trim(arguments.customerId)) gt 0 ) ) {

					var clientDetails = createObject("component","ClientDetailsType");

					if ( len(trim(arguments.ipAddress)) ){
					    clientDetails.setIpAddress(arguments.ipAddress);
					}

					if ( len(trim(arguments.deviceId)) ){
					    clientDetails.setDeviceId(arguments.deviceId);
					}

					if ( len(trim(arguments.applicationId)) ){
					    clientDetails.setApplicationId(arguments.applicationId);
					}

					if ( len(trim(arguments.model)) ){
					    clientDetails.setIpAddress(arguments.model);
					}

					if ( len(trim(arguments.geoLocation)) ){
					    clientDetails.setIpAddress(arguments.geoLocation);
					}

					if ( len(trim(arguments.customerType)) ){
					    clientDetails.setIpAddress(arguments.customerType);
					}

					if ( len(trim(arguments.partnerName)) ){
					    clientDetails.setIpAddress(arguments.partnerName);
					}

					if ( len(trim(arguments.customerId)) ){
					    clientDetails.setIpAddress(arguments.customerId);
					}

					payRequest.setClientDetails(clientDetails);
				}

		if (isDefined('arguments.memo') AND len(trim(arguments.memo)) gt 0 ){
		    payRequest.setMemo(arguments.memo);
		}


		if (isDefined('arguments.feesPayer') AND len(trim(arguments.feesPayer)) gt 0 ){
		    payRequest.setFeesPayer(arguments.feesPayer);
		}


		if (isDefined('arguments.ipnNotificationUrl') AND len(trim(arguments.ipnNotificationUrl)) gt 0 ){
		    payRequest.setIpnNotificationUrl(arguments.ipnNotificationUrl);
		}


		if (isDefined('arguments.pin') AND len(trim(arguments.pin)) gt 0 ){
		    payRequest.setPin(arguments.pin);
		}


		if (isDefined('arguments.preapprovalKey') AND len(trim(arguments.preapprovalKey)) gt 0 ){
		    payRequest.setPreapprovalKey(arguments.preapprovalKey);
		}


		if (isDefined('arguments.reverseAllParallelPaymentsOnError') AND isBoolean(arguments.reverseAllParallelPaymentsOnError) ){
		    payRequest.setReverseAllParallelPaymentsOnError(arguments.reverseAllParallelPaymentsOnError);
		}


		if (isDefined('arguments.senderEmail') AND len(trim(arguments.senderEmail)) gt 0 ){
		    payRequest.setSenderEmail(arguments.senderEmail);
		}


		if (isDefined('arguments.trackingId') AND len(trim(arguments.trackingId)) gt 0 ){
		    payRequest.setTrackingId(arguments.trackingId);
		}


		if (isDefined('arguments.fundingType') AND len(trim(arguments.fundingType)) gt 0 ){

			var fundingConstraint  = createObject("component","FundingConstraint");
			var fundingTypeList = createObject("component","FundingTypeList");
			var fundingTypeInfo = createObject("component","FundingTypeInfo");

			for (i = 1; i lte Listlen(fundingType,',');  i = i + 1){

				fundingTypeInfo.setFundingType(ListGetAt(fundingType,i));
				fundingTypeList.init(fundingTypeInfo);
			}

			fundingConstraint.init(fundingTypeList);
			payRequest.setFundingConstraint(fundingConstraint);
		}

		var senderIdentifier = createObject("component","SenderIdentifier");

		if (isDefined('arguments.useCredentials') AND isBoolean(arguments.useCredentials) ){

			senderIdentifier.setUseCredentials(useCredentials);
			var accountIdentifier = createObject("component","AccountIdentifier");
		}

		var payload = payRequest.serialize();
		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','Pay',payload);

		if ( returnObj eq 'response'){
			response = this.payResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}

	}

	public any function payResponse( required string results ){

		var PayResponse = createObject("component","PayResponse");
		var response = payResponse.deserialize(results);

		return response;
	}

	public any function paymentDetailsRequest(
	   string DetailLevelCode,
	   Array errors,
	   string errorLanguage="en_US",
	   string payKey,
	   string transactionId,
	   string trackingId,
	   string returnObj='response' ){

	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var paymentDetailsRequest = createObject("component","PaymentDetailsRequest").init(requestEnvelope);

		paymentDetailsRequest.setPayKey(payKey);

		var payload = paymentDetailsRequest.serialize();
		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','PaymentDetails',payload);

		if ( returnObj eq 'response'){
			response = this.paymentDetailsResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}


	}

	public any function paymentDetailsResponse( required string results ){

		var paymentDetailsResponse = createObject("component","PaymentDetailsResponse");
		var response = paymentDetailsResponse.deserialize(results);

		return response;
	}

	public any function preapprovalRequest(
		required string returnUrl,
		required string cancelUrl,
		required string currencyCode,
		required string startingDate,
		string errorLanguage="en_US",
		string ipAddress,
		string deviceId,
		string applicationId,
		string model,
		string geoLocation,
		string customerType,
		string partnerName,
		string customerId,
		string feesPayer,
		string ipnNotificationUrl,
		string memo,
		string senderEmail,
		string paymentPeriod,
		string pinType,
		string displayMaxTotalAmount,
		string DayOfWeek,
		numeric maxAmountPerPayment,
		numeric maxNumberOfPayments,
		numeric maxNumberOfPaymentsPerPeriod,
		numeric maxTotalAmountOfAllPayments,
		string returnObj='response' ){

		var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var preapprovalRequest = createObject("component","PreapprovalRequest").init(requestEnvelope,cancelURL,currencyCode, returnURL,startingDate);

		if ( (isDefined('arguments.ipAddress') AND len(trim(arguments.ipAddress))  gt 0 ) OR
				(isDefined('arguments.deviceId') AND len(trim(arguments.deviceId)) gt 0 ) OR
				(isDefined('arguments.applicationId') AND len(trim(arguments.applicationId)) gt 0 ) OR
				(isDefined('arguments.model') AND len(trim(arguments.model)) gt 0 ) OR
				(isDefined('arguments.geoLocation') AND len(trim(arguments.geoLocation)) gt 0 ) OR
				(isDefined('arguments.customerType') AND len(trim(arguments.customerType)) gt 0 ) OR
				(isDefined('arguments.partnerName') AND len(trim(arguments.partnerName)) gt 0 ) OR
				(isDefined('arguments.customerId') AND len(trim(arguments.customerId)) gt 0 ) ) {

					var clientDetails = createObject("component","ClientDetailsType");

					if ( len(trim(arguments.ipAddress)) ){
					    clientDetails.setIpAddress(arguments.ipAddress);
					}

					if ( len(trim(arguments.deviceId)) ){
					    clientDetails.setDeviceId(arguments.deviceId);
					}

					if ( len(trim(arguments.applicationId)) ){
					    clientDetails.setApplicationId(arguments.applicationId);
					}

					if ( len(trim(arguments.model)) ){
					    clientDetails.setIpAddress(arguments.model);
					}

					if ( len(trim(arguments.geoLocation)) ){
					    clientDetails.setIpAddress(arguments.geoLocation);
					}

					if ( len(trim(arguments.customerType)) ){
					    clientDetails.setIpAddress(arguments.customerType);
					}

					if ( len(trim(arguments.partnerName)) ){
					    clientDetails.setIpAddress(arguments.partnerName);
					}

					if ( len(trim(arguments.customerId)) ){
					    clientDetails.setIpAddress(arguments.customerId);
					}


					preapprovalRequest.setClientDetails(clientDetails);
				}

		if (isDefined('arguments.memo') AND len(trim(arguments.memo)) gt 0 ){
		    preapprovalRequest.setMemo(arguments.memo);
		}


		if (isDefined('arguments.feesPayer') AND len(trim(arguments.feesPayer)) gt 0 ){
		    preapprovalRequest.setFeesPayer(arguments.feesPayer);
		}

		if (isDefined('arguments.ipnNotificationUrl') AND len(trim(arguments.ipnNotificationUrl)) gt 0 ){
		    preapprovalRequest.setIpnNotificationUrl(arguments.ipnNotificationUrl);
		}

		if (isDefined('arguments.senderEmail') AND len(trim(arguments.senderEmail)) gt 0 ){
		    preapprovalRequest.setSenderEmail(arguments.senderEmail);
		}

		if (isDefined('arguments.pinType') AND len(trim(arguments.pinType)) gt 0 ){
		    preapprovalRequest.setPinType(arguments.pinType);
		}

		if (isDefined('arguments.displayMaxTotalAmount') AND len(trim(arguments.displayMaxTotalAmount)) gt 0 ){
		    preapprovalRequest.setDisplayMaxTotalAmount(arguments.displayMaxTotalAmount);
		}

		if (isDefined('arguments.DayOfWeek') AND len(trim(arguments.DayOfWeek)) gt 0 ){
			var dayOfWeekObj = createObject("component","DayOfWeek").init(DayOfWeek);
			preapprovalRequest.setDayOfWeek(dayOfWeekObj);
		}

		if (isDefined('arguments.maxAmountPerPayment') AND isNumeric(arguments.maxAmountPerPayment) ){
		    preapprovalRequest.setMaxAmountPerPayment(arguments.maxAmountPerPayment);
		}

		if (isDefined('arguments.maxNumberOfPayments') AND isNumeric(arguments.maxNumberOfPayments) ){
		    preapprovalRequest.setMaxNumberOfPayments(arguments.maxNumberOfPayments);
		}

		if (isDefined('arguments.maxNumberOfPaymentsPerPeriod') AND isNumeric(arguments.maxNumberOfPaymentsPerPeriod) ){
		    preapprovalRequest.setMaxNumberOfPaymentsPerPeriod(arguments.maxNumberOfPaymentsPerPeriod);
		}

		if (isDefined('arguments.maxTotalAmountOfAllPayments') AND isNumeric(arguments.maxTotalAmountOfAllPayments) ){
		    preapprovalRequest.setMaxTotalAmountOfAllPayments(arguments.maxTotalAmountOfAllPayments);
		}

		if (isDefined('arguments.paymentPeriod') AND len(trim(arguments.paymentPeriod)) gt 0 ){
		    preapprovalRequest.setPaymentPeriod(arguments.paymentPeriod);
		}

		var payload = preapprovalRequest.serialize();
		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','Preapproval',payload);

		if ( returnObj eq 'response'){
			response = this.preapprovalResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}

	}

	public any function preapprovalResponse( required string results ) {

		var preapprovalResponse = createObject("component","PreapprovalResponse");
		var response = preapprovalResponse.deserialize(results);

		return response;
	}

	public any function preapprovalDetailsRequest(
		required string preapprovalKey,
		string getBillingAddress,
		string errorLanguage="en_US",
		string returnObj='response' ){

	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var preapprovalDetailsRequest = createObject("component","PreapprovalDetailsRequest").init(requestEnvelope);

		preapprovalDetailsRequest.setPreapprovalKey(preapprovalKey);

		if (isDefined('arguments.getBillingAddress') AND isBoolean(getBillingAddress) ){
		    preapprovalDetailsRequest.setGetBillingAddress(arguments.getBillingAddress);
		}

		var payload = preapprovalDetailsRequest.serialize();
		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','PreapprovalDetails',payload);

		if ( returnObj eq 'response'){
			response = this.preapprovalDetailsResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}


	}

	public any function preapprovalDetailsResponse( required string results ) {

		var preapprovalDetailsResponse = createObject("component","PreapprovalDetailsResponse");
		var response = preapprovalDetailsResponse.deserialize(results);

		return response;
	}


	public any function cancelPreapprovalRequest( required string preapprovalKey, string errorLanguage="en_US", string returnObj='response') {

	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var cancelPreapprovalRequest = createObject("component","CancelPreapprovalRequest").init(requestEnvelope);

		cancelPreapprovalRequest.setPreapprovalKey(preapprovalKey);

		var payload = cancelPreapprovalRequest.serialize();
		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','CancelPreapproval',payload);

		if ( returnObj eq 'response'){
			response = this.cancelPreapprovalResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}


	}

	public any function cancelPreapprovalResponse( required string results ) {

		var cancelPreapprovalResponse = createObject("component","CancelPreapprovalResponse");
		var response = cancelPreapprovalResponse.deserialize(results);

		return response;
	}


	public any function setPaymentOptionsRequest(
		required string payKey,
		string shippingAddressId,
		string errorLanguage="en_US",
		string institutionId,
		string firstName,
		string lastName,
		string displayName,
		string institutionCustomerId,
		string countryCode,
		string email,
		string emailHeaderImageUrl,
		string emailMarketingImageUrl,
		string headerImageUrl,
		string businessName,
		boolean senderRequireShippingAddressSelection,
		string senderReferrerCode,
		string description,
		string customId,
		string receiverReferrerCode,
		string nameInvoiceItem,
		string identifierInvoiceItem,
		string priceInvoiceItem,
		string itemPriceInvoiceItem,
		string itemCountInvoiceItem,
		string emailAccountIdentifier,
		string countryCodeAccountIdentifier,
		string phoneNumberAccountIdentifier,
		string extensionAccountIdentifier,
		string returnObj='response' ){


	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var setPaymentOptionsRequest = createObject("component","SetPaymentOptionsRequest").init(requestEnvelope,payKey);

		if (isDefined('arguments.shippingAddressId') AND len(trim(shippingAddressId)) gt 0 ){
		    setPaymentOptionsRequest.setShippingAddressId(arguments.shippingAddressId);
		}



		if ( (isDefined('arguments.institutionId') AND len(trim(arguments.institutionId))  gt 0 ) AND
				(isDefined('arguments.firstName') AND len(trim(arguments.firstName)) gt 0 ) AND
				(isDefined('arguments.lastName') AND len(trim(arguments.lastName)) gt 0 ) AND
				(isDefined('arguments.displayName') AND len(trim(arguments.displayName)) gt 0 ) AND
				(isDefined('arguments.institutionCustomerId') AND len(trim(arguments.institutionCustomerId)) gt 0 ) AND
				(isDefined('arguments.countryCode') AND len(trim(arguments.countryCode)) gt 0 ) ){

					var initiatingEntity = createObject("component","InitiatingEntity");
					var institutionCustomer = createObject("component","InstitutionCustomer");

					institutionCustomer.setInstitutionId(arguments.institutionId);
					institutionCustomer.setFirstName(arguments.firstName);
					institutionCustomer.setLastName(arguments.lastName);
					institutionCustomer.setDisplayName(arguments.displayName);
					institutionCustomer.setInstitutionCustomerId(arguments.institutionCustomerId);
					institutionCustomer.setCountryCode(arguments.countryCode);

					if (isDefined('arguments.email') AND len(trim(arguments.email))  gt 0 ){
					    institutionCustomer.setEmail(arguments.email);
					}

					initiatingEntity.setInstitutionCustomer(institutionCustomer);
					setPaymentOptionsRequest.setInitiatingEntity(initiatingEntity);
				}

		if ( (isDefined('arguments.emailHeaderImageUrl') AND len(trim(arguments.emailHeaderImageUrl))  gt 0 ) OR
				(isDefined('arguments.emailMarketingImageUrl') AND len(trim(arguments.emailMarketingImageUrl)) gt 0 ) OR
				(isDefined('arguments.headerImageUrl') AND len(trim(arguments.headerImageUrl)) gt 0 ) OR
				(isDefined('arguments.businessName') AND len(trim(arguments.businessName)) gt 0 ) ){

					var DisplayOptions = createObject("component","DisplayOptions");

					if (isDefined('arguments.emailHeaderImageUrl') AND len(trim(arguments.emailHeaderImageUrl))  gt 0 ){
					    DisplayOptions.setEmailHeaderImageUrl(arguments.emailHeaderImageUrl);
					}

					if (isDefined('arguments.emailMarketingImageUrl') AND len(trim(arguments.emailMarketingImageUrl))  gt 0 ){
					    DisplayOptions.setEmailMarketingImageUrl(arguments.emailMarketingImageUrl);
					}


					if (isDefined('arguments.headerImageUrl') AND len(trim(arguments.headerImageUrl))  gt 0 ){
					    DisplayOptions.setHeaderImageUrl(arguments.headerImageUrl);
					}

					if (isDefined('arguments.businessName') AND len(trim(arguments.businessName))  gt 0 ){
					    DisplayOptions.setBusinessName(arguments.businessName);
					}

					setPaymentOptionsRequest.setDisplayOptions(DisplayOptions);
				}


		if ( (isDefined('arguments.senderRequireShippingAddressSelection') AND isBoolean(arguments.senderRequireShippingAddressSelection) ) OR
			(isDefined('arguments.senderReferrerCode') AND len(trim(arguments.senderReferrerCode)) gt 0 ) ){

				var SenderOptions = createObject("component","SenderOptions");

				if (isDefined('arguments.senderRequireShippingAddressSelection') AND isBoolean(arguments.senderRequireShippingAddressSelection) ){
				    SenderOptions.setRequireShippingAddressSelection(arguments.senderRequireShippingAddressSelection);
				}

				if (isDefined('arguments.senderReferrerCode') AND len(trim(arguments.senderReferrerCode))  gt 0 ){
				    SenderOptions.setReferrerCode(arguments.senderReferrerCode);
				}

				setPaymentOptionsRequest.setSenderOptions(SenderOptions);
			}


			if ( (isDefined('arguments.description') AND len(trim(arguments.description))  gt 0 ) OR
					(isDefined('arguments.customId') AND len(trim(arguments.customId))  gt 0 ) OR
					(isDefined('arguments.receiverReferrerCode') AND len(trim(arguments.receiverReferrerCode))  gt 0 ) OR
					(isDefined('arguments.nameInvoiceItem') AND len(trim(arguments.nameInvoiceItem))  gt 0 ) OR
					(isDefined('arguments.identifierInvoiceItem') AND len(trim(arguments.identifierInvoiceItem))  gt 0 ) OR
					(isDefined('arguments.priceInvoiceItem') AND len(trim(arguments.priceInvoiceItem))  gt 0 ) OR
					(isDefined('arguments.itemCountInvoiceItem') AND len(trim(arguments.itemCountInvoiceItem))  gt 0 ) OR
					(isDefined('arguments.emailAccountIdentifier') AND len(trim(arguments.emailAccountIdentifier))  gt 0 ) OR
					( (isDefined('arguments.countryCodeAccountIdentifier') AND len(trim(arguments.countryCodeAccountIdentifier))  gt 0 ) AND
						(isDefined('arguments.phoneNumberAccountIdentifier') AND len(trim(arguments.phoneNumberAccountIdentifier)) gt 0 ) ) ){

					var ReceiverIdentifier = createObject("component","ReceiverIdentifier");
					var AccountIdentifier = createObject("component","AccountIdentifier");
					var ReceiverOptions = createObject("component","ReceiverOptions");

					if (isDefined('arguments.emailAccountIdentifier') AND len(trim(arguments.emailAccountIdentifier))  gt 0  ){
					    AccountIdentifier.setEmail(arguments.emailAccountIdentifier);
					}



					if ((isDefined('arguments.countryCodeAccountIdentifier') AND len(trim(arguments.countryCodeAccountIdentifier))  gt 0 ) AND
						(isDefined('arguments.phoneNumberAccountIdentifier') AND len(trim(arguments.phoneNumberAccountIdentifier)) gt 0 ) ) {

							var PhoneNumberType = createObject("component","PhoneNumberType");

							if (isDefined('arguments.countryCodeAccountIdentifier') AND len(trim(arguments.countryCodeAccountIdentifier))  gt 0  ){
							    PhoneNumberType.setCountryCode(arguments.countryCodeAccountIdentifier);
							}

							if (isDefined('arguments.phoneNumberAccountIdentifier') AND len(trim(arguments.phoneNumberAccountIdentifier))  gt 0  ){
							    PhoneNumberType.setPhoneNumber(arguments.phoneNumberAccountIdentifier);
							}

							if (isDefined('arguments.extensionAccountIdentifier') AND len(trim(arguments.extensionAccountIdentifier))  gt 0  ){
							    PhoneNumberType.setExtension(arguments.extensionAccountIdentifier);
							}


				 		AccountIdentifier.setPhone(PhoneNumberType);
				 	}

					//ReceiverIdentifier.setAccountIdentifier(AccountIdentifier);
					ReceiverOptions.init(AccountIdentifier);


					if (isDefined('arguments.description') AND len(trim(arguments.description))  gt 0  ){
					    ReceiverOptions.setDescription(arguments.description);
					}


					if (isDefined('arguments.customId') AND  len(trim(arguments.customId))  gt 0  ){
					    ReceiverOptions.setCustomId(arguments.customId);
					}


					if (isDefined('arguments.receiverReferrerCode') AND len(trim(arguments.receiverReferrerCode))  gt 0  ){
					    ReceiverOptions.setReferrerCodeReceiverOptions(arguments.receiverReferrerCode);
					}



					if ( (isDefined('arguments.nameInvoiceItem') AND len(trim(arguments.nameInvoiceItem))  gt 0 ) OR
							(isDefined('arguments.identifierInvoiceItem') AND len(trim(arguments.identifierInvoiceItem)) gt 0 ) OR
							(isDefined('arguments.priceInvoiceItem') AND len(trim(arguments.priceInvoiceItem)) gt 0 ) OR
							(isDefined('arguments.itemCountInvoiceItem') AND len(trim(arguments.itemCountInvoiceItem)) gt 0 ) ){

							var InvoiceData = createObject("component","InvoiceData");
							var InvoiceItem = createObject("component","InvoiceItem");


								for (i = 1; i lte Listlen(nameInvoiceItem,',');  i = i + 1) {

									if (isDefined('arguments.nameInvoiceItem') AND len(trim(arguments.nameInvoiceItem))  gt 0  ){
									    InvoiceItem.setName( ListGetAt(arguments.nameInvoiceItem,i) );
									}

									if (isDefined('arguments.identifierInvoiceItem') AND len(trim(arguments.identifierInvoiceItem))  gt 0  ){
									    InvoiceItem.setIdentifier( ListGetAt(arguments.identifierInvoiceItem,i) );
									}

									if (isDefined('arguments.priceInvoiceItem') AND len(trim(arguments.priceInvoiceItem))  gt 0  ){
									    InvoiceItem.setPrice( ListGetAt(arguments.priceInvoiceItem,i) );
									}

									if (isDefined('arguments.itemPriceInvoiceItem') AND len(trim(arguments.itemPriceInvoiceItem))  gt 0  ){
									    InvoiceItem.setItemPrice( ListGetAt(arguments.itemPriceInvoiceItem,i) );
									}

									if (isDefined('arguments.itemCountInvoiceItem') AND len(trim(arguments.itemCountInvoiceItem))  gt 0  ){
									    InvoiceItem.setItemCount( ListGetAt(arguments.itemCountInvoiceItem,i) );
									}

									InvoiceData.setItem(InvoiceItem);
									InvoiceData.addItem(InvoiceItem);
								}


							ReceiverOptions.setInvoiceData(InvoiceData);
						}

					setPaymentOptionsRequest.setReceiverOptions(ReceiverOptions);
					setPaymentOptionsRequest.addItem(ReceiverOptions);

				}


		var payload = setPaymentOptionsRequest.serialize();

		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','SetPaymentOptions',payload);


		if ( returnObj eq 'response'){
			response = this.setPaymentOptionsResponse(results);

			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}


	}

	public any function setPaymentOptionsResponse( required string results ){

		var setPaymentOptionsResponse = createObject("component","SetPaymentOptionsResponse");
		var response = setPaymentOptionsResponse.deserialize(results);

		return response;
	}


	public any function getPaymentOptionsRequest( required string payKey, string errorLanguage="en_US", string returnObj='response'){

	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var getPaymentOptionsRequest = createObject("component","GetPaymentOptionsRequest").init(requestEnvelope,payKey);

		var payload = getPaymentOptionsRequest.serialize();

		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','GetPaymentOptions',payload);

		if ( returnObj eq 'response'){
			response = this.getPaymentOptionsResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}


	}

	public any function getPaymentOptionsResponse( required string results ) {

		var getPaymentOptionsResponse = createObject("component","GetPaymentOptionsResponse");
		var response = getPaymentOptionsResponse.deserialize(results);

		return response;
	}


	public any function executePaymentRequest( required string payKey, string actionType, string fundingPlanId, string errorLanguage="en_US", string returnObj='response'){

	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var executePaymentRequest = createObject("component","ExecutePaymentRequest").init(requestEnvelope,payKey);

		if (isDefined('arguments.fundingPlanId') AND len(trim(arguments.fundingPlanId))  gt 0  ){
		    executePaymentRequest.setFundingPlanId(arguments.fundingPlanId);
		}

		if (isDefined('arguments.actionType') AND len(trim(arguments.actionType))  gt 0  ){
		    executePaymentRequest.setActionType(arguments.actionType);
		}

		var payload = executePaymentRequest.serialize();
		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','ExecutePayment',payload);

		if ( returnObj eq 'response'){
			response = this.executePaymentResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}

	}

	public any function executePaymentResponse( required string results ){

		var executePaymentResponse = createObject("component","ExecutePaymentResponse");
		var response = executePaymentResponse.deserialize(results);

		return response;
	}


	public any function refundRequest(
		string receiverAmount,
		string receiverEmail,
		string receiverCountryCode,
		string receiverExtension,
		string receiverPhoneNumber,
		string receiverPrimary,
		string receiverInvoiceId,
		string receiverPaymentType,
		string receiverPaymentSubType,
		string currencyCode,
		string payKey,
		string errorLanguage="en_US",
		string transactionId,
		string trackingId,
		string returnObj='response' ){

		var receiverList = createObject("component","ReceiverList");
		var receiver = createObject("component","Receiver");

		if(ListLen(receiverAmount) eq ListLen(receiverEmail)){

			for (i = 1; i lte Listlen(receiverAmount,',');  i = i + 1){

				receiver.setAmount(ListGetAt(receiverAmount,i));
				receiver.setEmail(ListGetAt(receiverEmail,i));

				if (isDefined('arguments.receiverPrimary') AND len(trim(arguments.receiverPrimary))  gt 0 ){
				    receiver.setPrimary(ListGetAt(receiverPrimary,i));
				}


				if ( (isDefined('arguments.receiverCountryCode') AND len(trim(ListGetAt(receiverCountryCode,i)))  gt 0 ) AND
					(isDefined('arguments.receiverPhoneNumber') AND len(trim(ListGetAt(receiverPhoneNumber,i)))  gt 0 ) ){

						var phoneNumber = createObject("component","PhoneNumberType").init(ListGetAt(receiverCountryCode,i),ListGetAt(receiverPhoneNumber,i));

						if (isDefined('arguments.receiverExtension') AND len(trim(ListGetAt(receiverExtension,i)))  gt 0 ){
						    phoneNumber.setExtension(ListGetAt(receiverExtension,i));
						}
				}

				if (isDefined('arguments.receiverInvoiceId') AND len(trim(arguments.receiverInvoiceId))  gt 0 ){
				    receiver.setInvoiceId(ListGetAt(receiverInvoiceId,i));
				}

				if (isDefined('arguments.receiverPaymentType') AND len(trim(arguments.receiverPaymentType))  gt 0 ){
				    receiver.setPaymentType(ListGetAt(receiverPaymentType,i));
				}

				if (isDefined('arguments.receiverPaymentSubType') AND len(trim(arguments.receiverPaymentSubType))  gt 0 ){
				    receiver.setPaymentSubType(ListGetAt(receiverPaymentSubType,i));
				}

				receiverList.init(receiver);
			}
		}

		var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var refundRequest = createObject("component","refundRequest").init(requestEnvelope);

		if (isDefined('arguments.currencyCode') AND len(trim(arguments.currencyCode)) gt 0 ){
		    refundRequest.setCurrencyCode(arguments.currencyCode);
		}


		if (isDefined('arguments.payKey') AND len(trim(arguments.payKey)) gt 0 ){
		    refundRequest.setPayKey(arguments.payKey);
		}


		if (isDefined('arguments.transactionId') AND len(trim(arguments.transactionId)) gt 0 ){
		    refundRequest.setTransactionId(arguments.transactionId);
		}


		if (isDefined('arguments.trackingId') AND len(trim(arguments.trackingId)) gt 0 ){
		    refundRequest.setTrackingId(arguments.trackingId);
		}


		refundRequest.setReceiverList(receiverList);

		var payload = refundRequest.serialize();

		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','Refund',payload);

		if ( returnObj eq 'response'){
			response = this.refundResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}

	}

	public any function refundResponse( required string results ){

		var refundResponse = createObject("component","refundResponse");
		var response = refundResponse.deserialize(results);

		return response;
	}


	public any function convertCurrencyRequest(
		string conversionType,
		string countryCode,
		string errorLanguage="en_US",
		required string fromCurrency,
		required string amount,
		required string toCurrency,
		string returnObj='response' ){

		var currencyCodeList = createObject("component","currencyCodeList").init(fromCurrency);

		currencyCodeList.addItem(toCurrency);

		var currencyType = createObject("component","CurrencyType").init(fromCurrency,amount);
		var currencyList = createObject("component","CurrencyList").init(currencyType);

	 	var requestEnvelope = createObject("component","RequestEnvelope").init(errorLanguage);
		var convertCurrencyRequest = createObject("component","convertCurrencyRequest").init(requestEnvelope,currencyList,currencyCodeList);

		if (isDefined('arguments.conversionType') AND len(trim(arguments.conversionType))  gt 0  ){
		    convertCurrencyRequest.setConversionType(arguments.conversionType);
		}

		if (isDefined('arguments.countryCode') AND len(trim(arguments.countryCode))  gt 0  ){
		    convertCurrencyRequest.setCountryCode(arguments.countryCode);
		}

		var payload = convertCurrencyRequest.serialize();

		var service = createObject("component","service").init();
		var results = service.doHttppost('AdaptivePayments','ConvertCurrency',payload);


		if ( returnObj eq 'response'){
			response = this.convertCurrencyResponse(results);
			return response;
		} else if ( returnObj eq 'payload') {
			return payload;
		} else {
			return results;
		}

	}

	public any function convertCurrencyResponse( required string results ){

		var convertCurrencyResponse = createObject("component","ConvertCurrencyResponse");
		var response = convertCurrencyResponse.deserialize(results);

		return response;
	}

}
</cfscript>