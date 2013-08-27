<cfscript>
    component name="PreapprovalDetailsResponse" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="responseEnvelope" type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
        property name="approved" type="boolean" display="approved" required="yes" hint="";
        property name="cancelUrl" type="string" display="cancelUrl" required="yes" hint="";
        property name="curPayments" type="numeric" display="curPayments" required="yes" hint="";
        property name="curPaymentsAmount" type="numeric" display="curPaymentsAmount" required="yes" hint="";
        property name="curPeriodAttempts" type="numeric" display="curPeriodAttempts" required="no" hint="";
        property name="curPeriodEndingDate" type="string" display="curPeriodEndingDate" required="no" hint="";
        property name="currencyCode" type="string" display="currencyCode" required="yes" hint="";
        property name="dateOfMonth" type="numeric" display="dateOfMonth" required="no" hint="";
        property name="dayOfWeek" type="DayOfWeek" display="dayOfWeek" required="no" hint="";
        property name="endingDate" type="string" display="endingDate" required="no" hint="";
        property name="maxAmountPerPayment" type="numeric" display="maxAmountPerPayment" required="no" hint="";
        property name="maxNumberOfPayments" type="numeric" display="maxNumberOfPayments" required="no" hint="";
        property name="maxNumberOfPaymentsPerPeriod" type="numeric" display="maxNumberOfPaymentsPerPeriod" required="no" hint="";
        property name="maxTotalAmountOfAllPayments" type="numeric" display="maxTotalAmountOfAllPayments" required="no" hint="";
        property name="paymentPeriod" type="string" display="paymentPeriod" required="no" hint="";
        property name="pinType" type="string" display="pinType" required="no" hint="";
        property name="returnUrl" type="string" display="returnUrl" required="yes" hint="";
        property name="senderEmail" type="string" display="senderEmail" required="no" hint="";
        property name="memo" type="string" display="memo" required="no" hint="";
        property name="startingDate" type="string" display="startingDate" required="yes" hint="";
        property name="status" type="string" display="status" required="yes" hint="";
        property name="ipnNotificationUrl" type="string" display="ipnNotificationUrl" required="no" hint="";
        property name="addressList" type="AddressList" display="addressList" required="no" hint="";
        property name="feesPayer" type="string" display="feesPayer" required="no" hint="";
        property name="displayMaxTotalAmount" type="boolean" display="displayMaxTotalAmount" required="no" hint="";
        property name="sender" type="SenderIdentifier" display="sender" required="no" hint="";

        public PreapprovalDetailsResponse function init(ResponseEnvelope responseEnvelope="", boolean approved="", string cancelUrl="", numeric curPayments="", numeric curPaymentsAmount="", string currencyCode="", string returnUrl="", string startingDate="", string status="") hint="I initialize the component and return myself" output="false" {

            this.setResponseEnvelope(arguments.responseEnvelope);

            this.setApproved(arguments.approved);

            this.setCancelUrl(arguments.cancelUrl);

            this.setCurPayments(arguments.curPayments);

            this.setCurPaymentsAmount(arguments.curPaymentsAmount);

            this.setCurrencyCode(arguments.currencyCode);

            this.setReturnUrl(arguments.returnUrl);

            this.setStartingDate(arguments.startingDate);

            this.setStatus(arguments.status);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setResponseEnvelope(ResponseEnvelope responseEnvelope) {
            this.responseEnvelope = arguments.responseEnvelope;
        }

        public ResponseEnvelope function getResponseEnvelope() {
            return this.responseEnvelope;
        }

        public void function setApproved(boolean approved) {
            this.approved = arguments.approved;
        }

        public boolean function getApproved() {
            return this.approved;
        }

        public void function setCancelUrl(string cancelUrl) {
            this.cancelUrl = arguments.cancelUrl;
        }

        public string function getCancelUrl() {
            return this.cancelUrl;
        }

        public void function setCurPayments(numeric curPayments) {
            this.curPayments = arguments.curPayments;
        }

        public numeric function getCurPayments() {
            return this.curPayments;
        }

        public void function setCurPaymentsAmount(numeric curPaymentsAmount) {
            this.curPaymentsAmount = arguments.curPaymentsAmount;
        }

        public numeric function getCurPaymentsAmount() {
            return this.curPaymentsAmount;
        }

        public void function setCurPeriodAttempts(numeric curPeriodAttempts) {
            this.curPeriodAttempts = arguments.curPeriodAttempts;
        }

        public numeric function getCurPeriodAttempts() {
            return this.curPeriodAttempts;
        }

        public void function setCurPeriodEndingDate(string curPeriodEndingDate) {
            this.curPeriodEndingDate = arguments.curPeriodEndingDate;
        }

        public string function getCurPeriodEndingDate() {
            return this.curPeriodEndingDate;
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

        public numeric function getmMxNumberOfPaymentsPerPeriod() {
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

        public void function setPinType(string pinType) {
            this.pinType = arguments.pinType;
        }

        public string function getPinType() {
            return this.pinType;
        }

        public void function setReturnUrl(string returnUrl) {
            this.returnUrl = arguments.returnUrl;
        }

        public string function getReturnUrl() {
            return this.returnUrl;
        }

        public void function setSenderEmail(string senderEmail) {
            this.senderEmail = arguments.senderEmail;
        }

        public string function getSenderEmail() {
            return this.senderEmail;
        }

        public void function setMemo(string memo) {
            this.memo = arguments.memo;
        }

        public string function getMemo() {
            return this.memo;
        }

        public void function setStartingDate(string startingDate) {
            this.startingDate = arguments.startingDate;
        }

        public string function getStartingDate() {
            return this.startingDate;
        }

        public void function setStatus(string status) {
            this.status = arguments.status;
        }

        public string function getStatus() {
            return this.status;
        }

        public void function setIpnNotificationUrl(string ipnNotificationUrl) {
            this.ipnNotificationUrl = arguments.ipnNotificationUrl;
        }

        public string function getIpnNotificationUrl() {
            return this.ipnNotificationUrl;
        }

        public void function setAddressList(AddressList addressList) {
            this.addressList = arguments.addressList;
        }

        public AddressList function getAddressList() {
            return this.addressList;
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

            if(isDefined('this.responseEnvelope')) {
                local.struct["responseEnvelope"] = getResponseEnvelope().getStruct();
            }

            if(isDefined('this.approved')) {
                local.struct["approved"] = getApproved();
            }

            if(isDefined('this.cancelUrl')) {
                local.struct["cancelUrl"] = getCancelUrl();
            }

            if(isDefined('this.curPayments')) {
                local.struct["curPayments"] = getCurPayments();
            }

            if(isDefined('this.curPaymentsAmount')) {
                local.struct["curPaymentsAmount"] = getCurPaymentsAmount();
            }

            if(isDefined('this.curPeriodAttempts')) {
                local.struct["curPeriodAttempts"] = getCurPeriodAttempts();
            }

            if(isDefined('this.curPeriodEndingDate')) {
                local.struct["curPeriodEndingDate"] = getCurPeriodEndingDate();
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

            if(isDefined('this.pinType')) {
                local.struct["pinType"] = getPinType();
            }

            if(isDefined('this.returnUrl')) {
                local.struct["returnUrl"] = getReturnUrl();
            }

            if(isDefined('this.senderEmail')) {
                local.struct["senderEmail"] = getSenderEmail();
            }

            if(isDefined('this.memo')) {
                local.struct["memo"] = getMemo();
            }

            if(isDefined('this.startingDate')) {
                local.struct["startingDate"] = getStartingDate();
            }

            if(isDefined('this.status')) {
                local.struct["status"] = getStatus();
            }

            if(isDefined('this.ipnNotificationUrl')) {
                local.struct["ipnNotificationUrl"] = getIpnNotificationUrl();
            }

            if(isDefined('this.addressList')) {
                local.struct["addressList"] = getAddressList().getStruct();
            }

            if(isDefined('this.feesPayer')) {
                local.struct["feesPayer"] = getFeesPayer();
            }

            if(isDefined('this.displayMaxTotalAmount')) {
                local.struct["displayMaxTotalAmount"] = getDisplayMaxTotalAmount();
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

                    if('#key#' eq 'responseEnvelope') {

                        var keyObj = createObject("component", 'requestEnvelope');

                        this.setResponseEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'approved') {
                        this.setApproved(local.json[key]);
                    }

                    if('#key#' eq 'cancelUrl') {
                        this.setCancelUrl(local.json[key]);
                    }

                    if('#key#' eq 'curPayments') {
                        this.setCurPayments(local.json[key]);
                    }

                    if('#key#' eq 'curPaymentsAmount') {
                        this.setCurPaymentsAmount(local.json[key]);
                    }

                    if('#key#' eq 'curPeriodAttempts') {
                        this.setCurPeriodAttempts(local.json[key]);
                    }

                    if('#key#' eq 'curPeriodEndingDate') {
                        this.setCurPeriodEndingDate(local.json[key]);
                    }

                    if('#key#' eq 'currencyCode') {
                        this.setCurrencyCode(local.json[key]);
                    }

                    if('#key#' eq 'dateOfMonth') {
                        this.setDateOfMonth(local.json[key]);
                    }

                    if('#key#' eq 'dayOfWeek') {

                        var keyObj = createObject("component", 'dayOfWeek');

                        this.setDayOfWeek(keyObj.deserialize(local.json[key]));
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

                    if('#key#' eq 'pinType') {
                        this.setPinType(local.json[key]);
                    }

                    if('#key#' eq 'returnUrl') {
                        this.setReturnUrl(local.json[key]);
                    }

                    if('#key#' eq 'senderEmail') {
                        this.setSenderEmail(local.json[key]);
                    }

                    if('#key#' eq 'memo') {
                        this.setMemo(local.json[key]);
                    }

                    if('#key#' eq 'startingDate') {
                        this.setStartingDate(local.json[key]);
                    }

                    if('#key#' eq 'status') {
                        this.setStatus(local.json[key]);
                    }

                    if('#key#' eq 'ipnNotificationUrl') {
                        this.setIpnNotificationUrl(local.json[key]);
                    }

                    if('#key#' eq 'addressList') {

                        var keyObj = createObject("component", 'keyCom');

                        this.setAddressList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'feesPayer') {
                        this.setFeesPayer(local.json[key]);
                    }

                    if('#key#' eq 'displayMaxTotalAmount') {
                        this.setDisplayMaxTotalAmount(local.json[key]);
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

                        this.setResponseEnvelope(local.json[i]);

                        this.setApproved(local.json[i]);

                        this.setCancelUrl(local.json[i]);

                        this.setCurPayments(local.json[i]);

                        this.setCurPaymentsAmount(local.json[i]);

                        this.setCurPeriodAttempts(local.json[i]);

                        this.setCurPeriodEndingDate(local.json[i]);

                        this.setCurrencyCode(local.json[i]);

                        this.setDateOfMonth(local.json[i]);

                        this.setDayOfWeek(local.json[i]);

                        this.setEndingDate(local.json[i]);

                        this.setMaxAmountPerPayment(local.json[i]);

                        this.setMaxNumberOfPayments(local.json[i]);

                        this.setMaxNumberOfPaymentsPerPeriod(local.json[i]);

                        this.setMaxTotalAmountOfAllPayments(local.json[i]);

                        this.setPaymentPeriod(local.json[i]);

                        this.setPinType(local.json[i]);

                        this.setReturnUrl(local.json[i]);

                        this.setSenderEmail(local.json[i]);

                        this.setMemo(local.json[i]);

                        this.setStartingDate(local.json[i]);

                        this.setStatus(local.json[i]);

                        this.setIpnNotificationUrl(local.json[i]);

                        this.setAddressList(local.json[i]);

                        this.setFeesPayer(local.json[i]);

                        this.setDisplayMaxTotalAmount(local.json[i]);

                        this.setSender(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'responseEnvelope') {

                                var keyObj = createObject("component", 'responseEnvelope');

                                this.setResponseEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'approved') {
                                this.setApproved(local.json[i][key]);
                            }

                            if('#key#' eq 'cancelUrl') {
                                this.setCancelUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'curPayments') {
                                this.setCurPayments(local.json[i][key]);
                            }

                            if('#key#' eq 'curPaymentsAmount') {
                                this.setCurPaymentsAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'curPeriodAttempts') {
                                this.setCurPeriodAttempts(local.json[i][key]);
                            }

                            if('#key#' eq 'curPeriodEndingDate') {
                                this.setCurPeriodEndingDate(local.json[i][key]);
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

                            if('#key#' eq 'pinType') {
                                this.setPinType(local.json[i][key]);
                            }

                            if('#key#' eq 'returnUrl') {
                                this.setReturnUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'senderEmail') {
                                this.setSenderEmail(local.json[i][key]);
                            }

                            if('#key#' eq 'memo') {
                                this.setMemo(local.json[i][key]);
                            }

                            if('#key#' eq 'startingDate') {
                                this.setStartingDate(local.json[i][key]);
                            }

                            if('#key#' eq 'status') {
                                this.setStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'ipnNotificationUrl') {

                                this.setIpnNotificationUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'addressList') {

                                var keyObj = createObject("component", 'addressList');

                                this.setAddressList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'feesPayer') {
                                this.setFeesPayer(local.json[i][key]);
                            }

                            if('#key#' eq 'displayMaxTotalAmount') {
                                this.setDisplayMaxTotalAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'sender') {

                                var keyObj = createObject("component", 'SenderIdentifier');

                                this.setSender(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>