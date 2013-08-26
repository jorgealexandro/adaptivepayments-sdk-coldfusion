<cfscript>
    component name="PaymentDetailsResponse" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="responseEnvelope" type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
        property name="cancelUrl" type="string" display="cancelUrl" required="yes" hint="";
        property name="currencyCode" type="string" display="currencyCode" required="yes" hint="";
        property name="ipnNotificationUrl" type="string" display="ipnNotificationUrl" required="no" hint="";
        property name="memo" type="string" display="memo" required="no" hint="";
        property name="paymentInfoList" type="PaymentInfoList" display="paymentInfoList" required="yes" hint="";
        property name="returnUrl" type="string" display="returnUrl" required="yes" hint="";
        property name="senderEmail" type="string" display="senderEmail" required="no" hint="";
        property name="status" type="string" display="status" required="yes" hint="";
        property name="trackingId" type="string" display="trackingId" required="no" hint="";
        property name="payKey" type="string" display="payKey" required="yes" hint="";
        property name="actionType" type="string" display="actionType" required="yes" hint="";
        property name="feesPayer" type="string" display="feesPayer" required="yes" hint="";
        property name="reverseAllParallelPaymentsOnError" type="boolean" display="reverseAllParallelPaymentsOnError" required="no" hint="";
        property name="preapprovalKey" type="string" display="preapprovalKey" required="no" hint="";
        property name="fundingConstraint" type="FundingConstraint" display="fundingConstraint" required="no" hint="";
        property name="sender" type="SenderIdentifier" display="sender" required="no" hint="";

        public PaymentDetailsResponse function init(ResponseEnvelope responseEnvelope="", string cancelUrl="", string currencyCode="", PaymentInfoList paymentInfoList="", string returnUrl="", string status="", string payKey="", string actionType="", string feesPayer="") hint="I initialize the component and return myself" output="false" {

            this.setResponseEnvelope(arguments.responseEnvelope);

            this.setCancelUrl(arguments.cancelUrl);

            this.setCurrencyCode(arguments.currencyCode);

            this.setPaymentInfoList(arguments.paymentInfoList);

            this.setReturnUrl(arguments.returnUrl);

            this.setStatus(arguments.status);

            this.setPayKey(arguments.payKey);

            this.setActionType(arguments.actionType);

            this.setFeesPayer(arguments.feesPayer);

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

        public void function setPaymentInfoList(PaymentInfoList paymentInfoList) {
            this.paymentInfoList = arguments.paymentInfoList;
        }

        public PaymentInfoList function getPaymentInfoList() {
            return this.paymentInfoList;
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

        public void function setStatus(string status) {
            this.status = arguments.status;
        }

        public string function getStatus() {
            return this.status;
        }

        public void function setTrackingId(string trackingId) {
            this.trackingId = arguments.trackingId;
        }

        public string function getTrackingId() {
            return this.trackingId;
        }

        public void function setPayKey(string payKey) {
            this.payKey = arguments.payKey;
        }

        public string function getPayKey() {
            return this.payKey;
        }

        public void function setActionType(string actionType) {
            this.actionType = arguments.actionType;
        }

        public string function getActionType() {
            return this.actionType;
        }

        public void function setFeesPayer(string feesPayer) {
            this.feesPayer = arguments.feesPayer;
        }

        public string function getFeesPayer() {
            return this.feesPayer;
        }

        public void function setReverseAllParallelPaymentsOnError(boolean reverseAllParallelPaymentsOnError) {
            this.reverseAllParallelPaymentsOnError = arguments.reverseAllParallelPaymentsOnError;
        }

        public boolean function getReverseAllParallelPaymentsOnError() {
            return this.reverseAllParallelPaymentsOnError;
        }

        public void function setPreapprovalKey(string preapprovalKey) {
            this.preapprovalKey = arguments.preapprovalKey;
        }

        public string function getPreapprovalKey() {
            return this.preapprovalKey;
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

            if(isDefined('this.responseEnvelope')) {
                local.struct["responseEnvelope"] = getResponseEnvelope().getStruct();
            }

            if(isDefined('this.cancelUrl')) {
                local.struct["cancelUrl"] = getCancelUrl();
            }

            if(isDefined('this.currencyCode')) {
                local.struct["currencyCode"] = getCurrencyCode();
            }

            if(isDefined('this.ipnNotificationUrl')) {
                local.struct["ipnNotificationUrl"] = getIpnNotificationUrl();
            }

            if(isDefined('this.memo')) {
                local.struct["memo"] = getMemo();
            }

            if(isDefined('this.paymentInfoList')) {
                local.struct["paymentInfoList"] = getPaymentInfoList().getStruct();
            }

            if(isDefined('this.returnUrl')) {
                local.struct["returnUrl"] = getReturnUrl();
            }

            if(isDefined('this.senderEmail')) {
                local.struct["senderEmail"] = getSenderEmail();
            }

            if(isDefined('this.status')) {
                local.struct["status"] = getStatus();
            }

            if(isDefined('this.trackingId')) {
                local.struct["trackingId"] = getTrackingId();
            }

            if(isDefined('this.payKey')) {
                local.struct["payKey"] = getPayKey();
            }

            if(isDefined('this.actionType')) {
                local.struct["actionType"] = getActionType();
            }

            if(isDefined('this.feesPayer')) {
                local.struct["feesPayer"] = getFeesPayer();
            }

            if(isDefined('this.reverseAllParallelPaymentsOnError')) {
                local.struct["reverseAllParallelPaymentsOnError"] = getReverseAllParallelPaymentsOnError();
            }

            if(isDefined('this.preapprovalKey')) {
                local.struct["preapprovalKey"] = getPreapprovalKey();
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

                    if('#key#' eq 'responseEnvelope') {

                        var keyObj = createObject("component", 'responseEnvelope');
                        this.setResponseEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'cancelUrl') {
                        this.setCancelUrl(local.json[key]);
                    }

                    if('#key#' eq 'currencyCode') {
                        this.setCurrencyCode(local.json[key]);
                    }

                    if('#key#' eq 'ipnNotificationUrl') {
                        this.setIpnNotificationUrl(local.json[key]);
                    }

                    if('#key#' eq 'memo') {
                        this.setMemo(local.json[key]);
                    }

                    if('#key#' eq 'paymentInfoList') {

                        var keyObj = createObject("component", 'paymentInfoList');

                        this.setPaymentInfoList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'returnUrl') {
                        this.setReturnUrl(local.json[key]);
                    }

                    if('#key#' eq 'senderEmail') {
                        this.setSenderEmail(local.json[key]);
                    }

                    if('#key#' eq 'status') {
                        this.setStatus(local.json[key]);
                    }

                    if('#key#' eq 'trackingId') {
                        this.setTrackingId(local.json[key]);
                    }

                    if('#key#' eq 'payKey') {
                        this.setPayKey(local.json[key]);
                    }

                    if('#key#' eq 'actionType') {
                        this.setActionType(local.json[key]);
                    }

                    if('#key#' eq 'feesPayer') {
                        this.setFeesPayer(local.json[key]);
                    }

                    if('#key#' eq 'reverseAllParallelPaymentsOnError') {
                        this.setReverseAllParallelPaymentsOnError(local.json[key]);
                    }

                    if('#key#' eq 'preapprovalKey') {

                        this.setPreapprovalKey(local.json[key]);
                    }

                    if('#key#' eq 'fundingConstraint') {

                        var keyObj = createObject("component", 'fundingConstraint');

                        this.setFundingConstraint(keyObj.deserialize(local.json[key]));
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

                        this.setCancelUrl(local.json[i]);

                        this.setCurrencyCode(local.json[i]);

                        this.setIpnNotificationUrl(local.json[i]);

                        this.setMemo(local.json[i]);

                        this.setPaymentInfoList(local.json[i]);

                        this.setReturnUrl(local.json[i]);

                        this.setSenderEmail(local.json[i]);

                        this.setStatus(local.json[i]);

                        this.setTrackingId(local.json[i]);

                        this.setPayKey(local.json[i]);

                        this.setActionType(local.json[i]);

                        this.setFeesPayer(local.json[i]);

                        this.setReverseAllParallelPaymentsOnError(local.json[i]);

                        this.setPreapprovalKey(local.json[i]);

                        this.setFundingConstraint(local.json[i]);

                        this.setSender(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'responseEnvelope') {

                                var keyObj = createObject("component", 'responseEnvelope');

                                this.setResponseEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'cancelUrl') {
                                this.setCancelUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'currencyCode') {
                                this.setCurrencyCode(local.json[i][key]);
                            }

                            if('#key#' eq 'ipnNotificationUrl') {
                                this.setIpnNotificationUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'memo') {
                                this.setMemo(local.json[i][key]);
                            }

                            if('#key#' eq 'paymentInfoList') {

                                var keyObj = createObject("component", 'paymentInfoList');

                                this.setPaymentInfoList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'returnUrl') {
                                this.setReturnUrl(local.json[i][key]);
                            }

                            if('#key#' eq 'senderEmail') {
                                this.setSenderEmail(local.json[i][key]);
                            }

                            if('#key#' eq 'status') {
                                this.setStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'trackingId') {
                                this.setTrackingId(local.json[i][key]);
                            }

                            if('#key#' eq 'payKey') {
                                this.setPayKey(local.json[i][key]);
                            }

                            if('#key#' eq 'actionType') {
                                this.setActionType(local.json[i][key]);
                            }

                            if('#key#' eq 'feesPayer') {
                                this.setFeesPayer(local.json[i][key]);
                            }

                            if('#key#' eq 'reverseAllParallelPaymentsOnError') {
                                this.setReverseAllParallelPaymentsOnError(local.json[i][key]);
                            }

                            if('#key#' eq 'preapprovalKey') {
                                this.setPreapprovalKey(local.json[i][key]);
                            }

                            if('#key#' eq 'fundingConstraint') {

                                var keyObj = createObject("component", 'fundingConstraint');

                                this.setFundingConstraint(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'sender') {

                                var keyObj = createObject("component", 'sender');
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