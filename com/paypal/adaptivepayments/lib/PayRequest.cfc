<cfscript>
    component name="PayRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="clientDetails" type="ClientDetailsType" display="clientDetails" required="no" hint="";
        property name="actionType" type="string" display="actionType" required="yes" hint="";
        property name="cancelUrl" type="string" display="cancelUrl" required="yes" hint="";
        property name="currencyCode" type="string" display="currencyCode" required="yes" hint="";
        property name="feesPayer" type="string" display="feesPayer" required="no" hint="";
        property name="ipnNotificationUrl" type="string" display="ipnNotificationUrl" required="no" hint="";
        property name="memo" type="string" display="memo" required="no" hint="";
        property name="pin" type="string" display="pin" required="no" hint="";
        property name="preapprovalKey" type="string" display="preapprovalKey" required="no" hint="";
        property name="receiverList" type="ReceiverList" display="receiverList" required="yes" hint="";
        property name="reverseAllParallelPaymentsOnError" type="boolean" display="reverseAllParallelPaymentsOnError" required="no" hint="";
        property name="senderEmail" type="string" display="senderEmail" required="no" hint="";
        property name="returnUrl" type="string" display="returnUrl" required="yes" hint="";
        property name="trackingId" type="string" display="trackingId" required="no" hint="";
        property name="fundingConstraint" type="FundingConstraint" display="fundingConstraint" required="no" hint="";
        property name="sender" type="SenderIdentifier" display="sender" required="no" hint="";

        public PayRequest function init(RequestEnvelope requestEnvelope="", string actionType="", string cancelUrl="", string currencyCode="", ReceiverList receiverList="", string returnUrl="") hint="I initialize the component and return myself" output="false" {

            this.setRequestEnvelope(arguments.requestEnvelope);

            this.setActionType(arguments.actionType);

            this.setCancelUrl(arguments.cancelUrl);

            this.setCurrencyCode(arguments.currencyCode);

            this.setReceiverList(arguments.receiverList);

            this.setReturnUrl(arguments.returnUrl);

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

        public void function setActionType(string actionType) {
            this.actionType = arguments.actionType;
        }

        public string function getActionType() {
            return this.actionType;
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

        public void function setFeesPayer(string feesPayer) {
            this.feesPayer = arguments.feesPayer;
        }

        public string function getFeesPayer() {
            return this.feesPayer;
        }

        public void function setIpnNotificationUrl(string ipnNotificationUrl) {
            this.ipnNotificationUrl = arguments.ipnNotificationUrl;
        }

        public string function getIpnNotificationUrl() {
            return this.ipnNotificationUrl;
        }

        public void function setMemo(string memo) {
            this.memo = arguments.memo;
        }

        public string function getMemo() {
            return this.memo;
        }

        public void function setPin(string pin) {
            this.pin = arguments.pin;
        }

        public string function getPin() {
            return this.pin;
        }

        public void function setPreapprovalKey(string preapprovalKey) {
            this.preapprovalKey = arguments.preapprovalKey;
        }

        public string function getPreapprovalKey() {
            return this.preapprovalKey;
        }

        public void function setReceiverList(ReceiverList receiverList) {
            this.receiverList = arguments.receiverList;
        }

        public ReceiverList function getReceiverList() {
            return this.receiverList;
        }

        public void function setReverseAllParallelPaymentsOnError(boolean reverseAllParallelPaymentsOnError) {
            this.reverseAllParallelPaymentsOnError = arguments.reverseAllParallelPaymentsOnError;
        }

        public boolean function getReverseAllParallelPaymentsOnError() {
            return this.reverseAllParallelPaymentsOnError;
        }

        public void function setSenderEmail(string senderEmail) {
            this.senderEmail = arguments.senderEmail;
        }

        public string function getSenderEmail() {
            return this.senderEmail;
        }

        public void function setReturnUrl(string returnUrl) {
            this.returnUrl = arguments.returnUrl;
        }

        public string function getReturnUrl() {
            return this.returnUrl;
        }

        public void function setTrackingId(string trackingId) {
            this.trackingId = arguments.trackingId;
        }

        public string function getTrackingId() {
            return this.trackingId;
        }

        public void function setFundingConstraint(FundingConstraint fundingConstraint) {
            this.fundingConstraint = arguments.fundingConstraint;
        }

        public FundingConstraint function getFundingConstraint() {
            return this.fundingConstraint;
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

            if(isDefined('this.actionType')) {
                local.struct["actionType"] = getActionType();
            }

            if(isDefined('this.cancelUrl')) {
                local.struct["cancelUrl"] = getCancelUrl();
            }

            if(isDefined('this.currencyCode')) {
                local.struct["currencyCode"] = getCurrencyCode();
            }

            if(isDefined('this.feesPayer')) {
                local.struct["feesPayer"] = getFeesPayer();
            }

            if(isDefined('this.ipnNotificationUrl')) {
                local.struct["ipnNotificationUrl"] = getIpnNotificationUrl();
            }

            if(isDefined('this.memo')) {
                local.struct["memo"] = getMemo();
            }

            if(isDefined('this.pin')) {
                local.struct["pin"] = getPin();
            }

            if(isDefined('this.preapprovalKey')) {
                local.struct["preapprovalKey"] = getPreapprovalKey();
            }

            if(isDefined('this.receiverList')) {
                local.struct["receiverList"] = getReceiverList().getStruct();
            }

            if(isDefined('this.reverseAllParallelPaymentsOnError')) {
                local.struct["reverseAllParallelPaymentsOnError"] = getReverseAllParallelPaymentsOnError();
            }

            if(isDefined('this.senderEmail')) {
                local.struct["senderEmail"] = getSenderEmail();
            }

            if(isDefined('this.returnUrl')) {
                local.struct["returnUrl"] = getReturnUrl();
            }

            if(isDefined('this.trackingId')) {
                local.struct["trackingId"] = getTrackingId();
            }

            if(isDefined('this.fundingConstraint')) {
                local.struct["fundingConstraint"] = getFundingConstraint().getStruct();
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

                        var keyObj = createObject("component", 'requestEnvelope');

                        this.setRequestEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'clientDetails') {

                        var keyObj = createObject("component", 'clientDetails');

                        this.setClientDetails(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'actionType') {
                        this.setActionType(local.json[key]);
                    }

                    if('#key#' eq 'cancelUrl') {
                        this.setCancelUrl(local.json[key]);
                    }

                    if('#key#' eq 'currencyCode') {
                        this.setCurrencyCode(local.json[key]);
                    }

                    if('#key#' eq 'feesPayer') {
                        this.setFeesPayer(local.json[key]);
                    }

                    if('#key#' eq 'ipnNotificationUrl') {
                        this.setIpnNotificationUrl(local.json[key]);
                    }

                    if('#key#' eq 'memo') {
                        this.setMemo(local.json[key]);
                    }

                    if('#key#' eq 'pin') {
                        this.setPin(local.json[key]);
                    }

                    if('#key#' eq 'preapprovalKey') {
                        this.setPreapprovalKey(local.json[key]);
                    }

                    if('#key#' eq 'receiverList') {

                        var keyObj = createObject("component", 'receiverList');

                        this.setReceiverList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'reverseAllParallelPaymentsOnError') {
                        this.setReverseAllParallelPaymentsOnError(local.json[key]);
                    }

                    if('#key#' eq 'senderEmail') {
                        this.setSenderEmail(local.json[key]);
                    }

                    if('#key#' eq 'returnUrl') {
                        this.setReturnUrl(local.json[key]);
                    }

                    if('#key#' eq 'trackingId') {
                        this.setTrackingId(local.json[key]);
                    }

                    if('#key#' eq 'fundingConstraint') {

                        var keyObj = createObject("component", 'fundingConstraint');

                        this.setFundingConstraint(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'sender') {

                        var keyObj = createObject("component", 'SenderIdentifier');

                        this.setSnder(keyObj.deserialize(local.json[key]));
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

                        this.setActionType(local.json[i]);

                        this.setCancelUrl(local.json[i]);

                        this.setCurrencyCode(local.json[i]);

                        this.setFeesPayer(local.json[i]);

                        this.setIpnNotificationUrl(local.json[i]);

                        this.setMemo(local.json[i]);

                        this.setPin(local.json[i]);

                        this.setPreapprovalKey(local.json[i]);

                        this.setReceiverList(local.json[i]);

                        this.setReverseAllParallelPaymentsOnError(local.json[i]);

                        this.setSenderEmail(local.json[i]);

                        this.setReturnUrl(local.json[i]);

                        this.setTrackingId(local.json[i]);

                        this.setFundingConstraint(local.json[i]);

                        this.setSender(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {

                                var keyObj = createObject("component", 'requestEnvelope');

                                this.setrequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'clientDetails') {

                                var keyObj = createObject("component", 'clientDetails');

                                this.setClientDetails(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'actionType') {
                                this.setActionType(local.json[i][key]);
                            }

                            if('#key#' eq 'cancelUrl') {
                                this.setCancelUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'currencyCode') {
                                this.setCurrencyCode(local.json[i][key]);
                            }

                            if('#key#' eq 'feesPayer') {
                                this.setFeesPayer(local.json[i][key]);
                            }

                            if('#key#' eq 'ipnNotificationUrl') {
                                this.setIpnNotificationUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'memo') {
                                this.setMemo(local.json[i][key]);
                            }

                            if('#key#' eq 'pin') {
                                this.setPin(local.json[i][key]);
                            }

                            if('#key#' eq 'preapprovalKey') {
                                this.setPreapprovalKey(local.json[i][key]);
                            }

                            if('#key#' eq 'receiverList') {

                                var keyObj = createObject("component", 'receiverList');

                                this.setReceiverList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'reverseAllParallelPaymentsOnError') {
                                this.setReverseAllParallelPaymentsOnError(local.json[i][key]);
                            }

                            if('#key#' eq 'senderEmail') {
                                this.setSenderEmail(local.json[i][key]);
                            }

                            if('#key#' eq 'returnUrl') {
                                this.setReturnUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'trackingId') {
                                this.setTrackingId(local.json[i][key]);
                            }

                            if('#key#' eq 'fundingConstraint') {

                                var keyObj = createObject("component", 'fundingConstraint');

                                this.setfundingConstraint(keyObj.deserialize(local.json[i][key]));
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