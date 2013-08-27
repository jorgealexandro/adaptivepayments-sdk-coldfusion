<cfscript>
    component name="PreapprovalRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="clientDetails" type="ClientDetailsType" display="clientDetails" required="no" hint="";
        property name="cancelUrl" type="string" display="cancelUrl" required="yes" hint="";
        property name="currencyCode" type="string" display="currencyCode" required="yes" hint="";
        property name="dateOfMonth" type="numeric" display="dateOfMonth" required="no" hint="";
        property name="dayOfWeek" type="DayOfWeek" display="dayOfWeek" required="no" hint="";
        property name="endingDate" type="string" display="endingDate" required="no" hint="";
        property name="maxAmountPerPayment" type="numeric" display="maxAmountPerPayment" required="no" hint="";
        property name="maxNumberOfPayments" type="numeric" display="maxNumberOfPayments" required="no" hint="";
        property name="maxNumberOfPaymentsPerPeriod" type="numeric" display="maxNumberOfPaymentsPerPeriod" required="no" hint="";
        property name="maxTotalAmountOfAllPayments" type="numeric" display="maxTotalAmountOfAllPayments" required="no" hint="";
        property name="paymentPeriod" type="string" display="paymentPeriod" required="no" hint="";
        property name="returnUrl" type="string" display="returnUrl" required="yes" hint="";
        property name="memo" type="string" display="memo" required="no" hint="";
        property name="ipnNotificationUrl" type="string" display="ipnNotificationUrl" required="no" hint="";
        property name="senderEmail" type="string" display="senderEmail" required="no" hint="";
        property name="startingDate" type="string" display="startingDate" required="yes" hint="";
        property name="pinType" type="string" display="pinType" required="no" hint="";
        property name="feesPayer" type="string" display="feesPayer" required="no" hint="";
        property name="displayMaxTotalAmount" type="boolean" display="displayMaxTotalAmount" required="no" hint="";
        property name="requireInstantFundingSource" type="boolean" display="requireInstantFundingSource" required="no" hint="";
        property name="sender" type="SenderIdentifier" display="sender" required="no" hint="";

        public PreapprovalRequest function init(RequestEnvelope requestEnvelope="", string cancelUrl="", string currencyCode="", string returnUrl="", string startingDate="") hint="I initialize the component and return myself" output="false" {

            this.setRequestEnvelope(arguments.requestEnvelope);

            this.setCancelUrl(arguments.cancelUrl);

            this.setCurrencyCode(arguments.currencyCode);

            this.setReturnUrl(arguments.returnUrl);

            this.setStartingDate(arguments.startingDate);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setRequestEnvelope(RequestEnvelope requestEnvelope) {
            this.requestEnvelope = arguments.requestEnvelope;
        }

        public RequestEnvelope function getRequestEnvelope() {
            return this.requestEnvelope;
        }

        public void function setClientDetails(ClientDetailsType clientDetails) {
            this.clientDetails = arguments.clientDetails;
        }

        public ClientDetailsType function getClientDetails() {
            return this.clientDetails;
        }

        public void function setCancelUrl(string cancelUrl) {
            this.cancelUrl = arguments.cancelUrl;
        }

        public string function getCancelUrl() {
            return this.cancelUrl;
        }

        public void function setCurrencyCode(string currencyCode) {
            this.currencyCode = arguments.currencyCode;
        }

        public string function getCurrencyCode() {
            return this.currencyCode;
        }

        public void function setDateOfMonth(numeric dateOfMonth) {
            this.dateOfMonth = arguments.dateOfMonth;
        }

        public numeric function getDateOfMonth() {
            return this.dateOfMonth;
        }

        public void function setDayOfWeek(DayOfWeek dayOfWeek) {
            this.dayOfWeek = arguments.dayOfWeek;
        }

        public DayOfWeek function getDayOfWeek() {
            return this.dayOfWeek;
        }

        public void function setEndingDate(string endingDate) {
            this.endingDate = arguments.endingDate;
        }

        public string function getEndingDate() {
            return this.endingDate;
        }

        public void function setMaxAmountPerPayment(numeric maxAmountPerPayment) {
            this.maxAmountPerPayment = arguments.maxAmountPerPayment;
        }

        public numeric function getMaxAmountPerPayment() {
            return this.maxAmountPerPayment;
        }

        public void function setMaxNumberOfPayments(numeric maxNumberOfPayments) {
            this.maxNumberOfPayments = arguments.maxNumberOfPayments;
        }

        public numeric function getMaxNumberOfPayments() {
            return this.maxNumberOfPayments;
        }

        public void function setMaxNumberOfPaymentsPerPeriod(numeric maxNumberOfPaymentsPerPeriod) {
            this.maxNumberOfPaymentsPerPeriod = arguments.maxNumberOfPaymentsPerPeriod;
        }

        public numeric function getMaxNumberOfPaymentsPerPeriod() {
            return this.maxNumberOfPaymentsPerPeriod;
        }

        public void function setMaxTotalAmountOfAllPayments(numeric maxTotalAmountOfAllPayments) {
            this.maxTotalAmountOfAllPayments = arguments.maxTotalAmountOfAllPayments;
        }

        public numeric function getMaxTotalAmountOfAllPayments() {
            return this.maxTotalAmountOfAllPayments;
        }

        public void function setPaymentPeriod(string paymentPeriod) {
            this.paymentPeriod = arguments.paymentPeriod;
        }

        public string function getPaymentPeriod() {
            return this.paymentPeriod;
        }

        public void function setReturnUrl(string returnUrl) {
            this.returnUrl = arguments.returnUrl;
        }

        public string function getReturnUrl() {
            return this.returnUrl;
        }

        public void function setMemo(string memo) {
            this.memo = arguments.memo;
        }

        public string function getMemo() {
            return this.memo;
        }

        public void function setIpnNotificationUrl(string ipnNotificationUrl) {
            this.ipnNotificationUrl = arguments.ipnNotificationUrl;
        }

        public string function getIpnNotificationUrl() {
            return this.ipnNotificationUrl;
        }

        public void function setSenderEmail(string senderEmail) {
            this.senderEmail = arguments.senderEmail;
        }

        public string function getSenderEmail() {
            return this.senderEmail;
        }

        public void function setStartingDate(string startingDate) {
            this.startingDate = arguments.startingDate;
        }

        public string function getStartingDate() {
            return this.startingDate;
        }

        public void function setPinType(string pinType) {
            this.pinType = arguments.pinType;
        }

        public string function getPinType() {
            return this.pinType;
        }

        public void function setFeesPayer(string feesPayer) {
            this.feesPayer = arguments.feesPayer;
        }

        public string function getFeesPayer() {
            return this.feesPayer;
        }

        public void function setDisplayMaxTotalAmount(boolean displayMaxTotalAmount) {
            this.displayMaxTotalAmount = arguments.displayMaxTotalAmount;
        }

        public boolean function getDisplayMaxTotalAmount() {
            return this.displayMaxTotalAmount;
        }

        public void function setRequireInstantFundingSource(boolean requireInstantFundingSource) {
            this.requireInstantFundingSource = arguments.requireInstantFundingSource;
        }

        public boolean function getRequireInstantFundingSource() {
            return this.requireInstantFundingSource;
        }

        public void function setSender(SenderIdentifier sender) {
            this.sender = arguments.sender;
        }

        public SenderIdentifier function getSender() {
            return this.sender;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.requestEnvelope')) {
                local.struct["requestEnvelope"] = getRequestEnvelope().getStruct();
            }

            if(isDefined('this.clientDetails')) {
                local.struct["clientDetails"] = getClientDetails().getStruct();
            }

            if(isDefined('this.cancelUrl')) {
                local.struct["cancelUrl"] = getCancelUrl();
            }

            if(isDefined('this.currencyCode')) {
                local.struct["currencyCode"] = getCurrencyCode();
            }

            if(isDefined('this.dateOfMonth')) {
                local.struct["dateOfMonth"] = getDateOfMonth();
            }

            if(isDefined('this.dayOfWeek')) {
                local.struct["dayOfWeek"] = getDayOfWeek().getStruct();
            }

            if(isDefined('this.endingDate')) {
                local.struct["endingDate"] = getEndingDate();
            }

            if(isDefined('this.maxAmountPerPayment')) {
                local.struct["maxAmountPerPayment"] = getMaxAmountPerPayment();
            }

            if(isDefined('this.maxNumberOfPayments')) {
                local.struct["maxNumberOfPayments"] = getMaxNumberOfPayments();
            }

            if(isDefined('this.maxNumberOfPaymentsPerPeriod')) {
                local.struct["maxNumberOfPaymentsPerPeriod"] = getMaxNumberOfPaymentsPerPeriod();
            }

            if(isDefined('this.maxTotalAmountOfAllPayments')) {
                local.struct["maxTotalAmountOfAllPayments"] = getMaxTotalAmountOfAllPayments();
            }

            if(isDefined('this.paymentPeriod')) {
                local.struct["paymentPeriod"] = getPaymentPeriod();
            }

            if(isDefined('this.returnUrl')) {
                local.struct["returnUrl"] = getReturnUrl();
            }

            if(isDefined('this.memo')) {
                local.struct["memo"] = getMemo();
            }

            if(isDefined('this.ipnNotificationUrl')) {
                local.struct["ipnNotificationUrl"] = getIpnNotificationUrl();
            }

            if(isDefined('this.senderEmail')) {
                local.struct["senderEmail"] = getSenderEmail();
            }

            if(isDefined('this.startingDate')) {
                local.struct["startingDate"] = getStartingDate();
            }

            if(isDefined('this.pinType')) {
                local.struct["pinType"] = getPinType();
            }

            if(isDefined('this.feesPayer')) {
                local.struct["feesPayer"] = getFeesPayer();
            }

            if(isDefined('this.displayMaxTotalAmount')) {
                local.struct["displayMaxTotalAmount"] = getDisplayMaxTotalAmount();
            }

            if(isDefined('this.requireInstantFundingSource')) {
                local.struct["requireInstantFundingSource"] = getRequireInstantFundingSource();
            }

            if(isDefined('this.sender')) {
                local.struct["sender"] = getSender().getStruct();
            }

            return local.struct;
        }

        public any function serialize() {
            return serializeJSON(this.getStruct());
        }

        public any function deserialize(any jsonObj) {
            if(isJSON(jsonObj)) {
                local.json = deserializeJSON(jsonObj);
            } else {
                local.json = jsonObj;
            }

            if(isStruct(local.json)) {

                for(key in local.json) {

                    if('#key#' eq 'requestEnvelope') {

                        var keyObj = createObject("component", 'SenderIdentifier');

                        this.setRequestEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'clientDetails') {

                        var keyObj = createObject("component", 'SenderIdentifier');

                        this.setClientDetails(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'cancelUrl') {
                        this.setCancelUrl(local.json[key]);
                    }

                    if('#key#' eq 'currencyCode') {
                        this.setCurrencyCode(local.json[key]);
                    }

                    if('#key#' eq 'dateOfMonth') {
                        this.setDateOfMonth(local.json[key]);
                    }

                    if('#key#' eq 'dayOfWeek') {

                        var keyObj = createObject("component", 'dayOfWeek');

                        this.setdayOfWeek(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'endingDate') {
                        this.setEndingDate(local.json[key]);
                    }

                    if('#key#' eq 'maxAmountPerPayment') {
                        this.setMaxAmountPerPayment(local.json[key]);
                    }

                    if('#key#' eq 'maxNumberOfPayments') {
                        this.setMaxNumberOfPayments(local.json[key]);
                    }

                    if('#key#' eq 'maxNumberOfPaymentsPerPeriod') {
                        this.setMaxNumberOfPaymentsPerPeriod(local.json[key]);
                    }

                    if('#key#' eq 'maxTotalAmountOfAllPayments') {
                        this.setMaxTotalAmountOfAllPayments(local.json[key]);
                    }

                    if('#key#' eq 'paymentPeriod') {
                        this.setPaymentPeriod(local.json[key]);
                    }

                    if('#key#' eq 'returnUrl') {
                        this.setReturnUrl(local.json[key]);
                    }

                    if('#key#' eq 'memo') {
                        this.setMemo(local.json[key]);
                    }

                    if('#key#' eq 'ipnNotificationUrl') {
                        this.setIpnNotificationUrl(local.json[key]);
                    }

                    if('#key#' eq 'senderEmail') {
                        this.setSenderEmail(local.json[key]);
                    }

                    if('#key#' eq 'startingDate') {
                        this.setStartingDate(local.json[key]);
                    }

                    if('#key#' eq 'pinType') {
                        this.setPinType(local.json[key]);
                    }

                    if('#key#' eq 'feesPayer') {
                        this.setFeesPayer(local.json[key]);
                    }

                    if('#key#' eq 'displayMaxTotalAmount') {
                        this.setDisplayMaxTotalAmount(local.json[key]);
                    }

                    if('#key#' eq 'requireInstantFundingSource') {
                        this.setRequireInstantFundingSource(local.json[key]);
                    }

                    if('#key#' eq 'sender') {

                        var keyObj = createObject("component", 'SenderIdentifier');

                        this.setSender(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setRequestEnvelope(local.json[i]);

                        this.setClientDetails(local.json[i]);

                        this.setCancelUrl(local.json[i]);

                        this.setCurrencyCode(local.json[i]);

                        this.setDateOfMonth(local.json[i]);

                        this.setDayOfWeek(local.json[i]);

                        this.setEndingDate(local.json[i]);

                        this.setMaxAmountPerPayment(local.json[i]);

                        this.setMaxNumberOfPayments(local.json[i]);

                        this.setMaxNumberOfPaymentsPerPeriod(local.json[i]);

                        this.setMaxTotalAmountOfAllPayments(local.json[i]);

                        this.setpaymentPeriod(local.json[i]);

                        this.setReturnUrl(local.json[i]);

                        this.setMemo(local.json[i]);

                        this.setIpnNotificationUrl(local.json[i]);

                        this.setSenderEmail(local.json[i]);

                        this.setStartingDate(local.json[i]);

                        this.setPinType(local.json[i]);

                        this.setFeesPayer(local.json[i]);

                        this.setDisplayMaxTotalAmount(local.json[i]);

                        this.setRequireInstantFundingSource(local.json[i]);

                        this.setSender(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {

                                var keyObj = createObject("component", 'requestEnvelope');

                                this.setRequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'clientDetails') {

                                var keyObj = createObject("component", 'clientDetails');

                                this.setClientDetails(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'cancelUrl') {
                                this.setCancelUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'currencyCode') {
                                this.setCurrencyCode(local.json[i][key]);
                            }

                            if('#key#' eq 'dateOfMonth') {
                                this.setDateOfMonth(local.json[i][key]);
                            }

                            if('#key#' eq 'dayOfWeek') {

                                var keyObj = createObject("component", 'dayOfWeek');

                                this.setDayOfWeek(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'endingDate') {
                                this.setEndingDate(local.json[i][key]);
                            }

                            if('#key#' eq 'maxAmountPerPayment') {
                                this.setMaxAmountPerPayment(local.json[i][key]);
                            }

                            if('#key#' eq 'maxNumberOfPayments') {
                                this.setMaxNumberOfPayments(local.json[i][key]);
                            }

                            if('#key#' eq 'maxNumberOfPaymentsPerPeriod') {
                                this.setMaxNumberOfPaymentsPerPeriod(local.json[i][key]);
                            }

                            if('#key#' eq 'maxTotalAmountOfAllPayments') {
                                this.setMaxTotalAmountOfAllPayments(local.json[i][key]);
                            }

                            if('#key#' eq 'paymentPeriod') {
                                this.setPaymentPeriod(local.json[i][key]);
                            }

                            if('#key#' eq 'returnUrl') {
                                this.setReturnUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'memo') {
                                this.setMemo(local.json[i][key]);
                            }

                            if('#key#' eq 'ipnNotificationUrl') {
                                this.setIpnNotificationUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'senderEmail') {
                                this.setSenderEmail(local.json[i][key]);
                            }

                            if('#key#' eq 'startingDate') {
                                this.setStartingDate(local.json[i][key]);
                            }

                            if('#key#' eq 'pinType') {
                                this.setPinType(local.json[i][key]);
                            }

                            if('#key#' eq 'feesPayer') {
                                this.setFeesPayer(local.json[i][key]);
                            }

                            if('#key#' eq 'displayMaxTotalAmount') {
                                this.setDisplayMaxTotalAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'requireInstantFundingSource') {
                                this.setRequireInstantFundingSource(local.json[i][key]);
                            }

                            if('#key#' eq 'sender') {

                                var keyObj = createObject("component", 'SenderIdentifier');

                                this.setsender(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>