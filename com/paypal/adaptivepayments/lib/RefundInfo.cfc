<cfscript>
    component name="RefundInfo" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="receiver" type="Receiver" display="receiver" required="yes" hint="";
        property name="refundStatus" type="string" display="refundStatus" required="no" hint="";
        property name="refundNetAmount" type="numeric" display="refundNetAmount" required="no" hint="";
        property name="refundFeeAmount" type="numeric" display="refundFeeAmount" required="no" hint="";
        property name="refundGrossAmount" type="numeric" display="refundGrossAmount" required="no" hint="";
        property name="totalOfAllRefunds" type="numeric" display="totalOfAllRefunds" required="no" hint="";
        property name="refundHasBecomeFull" type="boolean" display="refundHasBecomeFull" required="no" hint="";
        property name="encryptedRefundTransactionId" type="string" display="encryptedRefundTransactionId" required="no" hint="";
        property name="refundTransactionStatus" type="string" display="refundTransactionStatus" required="no" hint="";
        property name="errorList" type="ErrorList" display="errorList" required="no" hint="";

        public RefundInfo function init(Receiver receiver="") hint="I initialize the component and return myself" output="false" {

            this.setReceiver(arguments.receiver);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setReceiver(Receiver receiver) {
            this.receiver = arguments.receiver;
        }

        public Receiver function getReceiver() {
            return this.receiver;
        }

        public void function setRefundStatus(string refundStatus) {
            this.refundStatus = arguments.refundStatus;
        }

        public string function getRefundStatus() {
            return this.refundStatus;
        }

        public void function setRefundNetAmount(numeric refundNetAmount) {
            this.refundNetAmount = arguments.refundNetAmount;
        }

        public numeric function getRefundNetAmount() {
            return this.refundNetAmount;
        }

        public void function setRefundFeeAmount(numeric refundFeeAmount) {
            this.refundFeeAmount = arguments.refundFeeAmount;
        }

        public numeric function getRefundFeeAmount() {
            return this.refundFeeAmount;
        }

        public void function setRefundGrossAmount(numeric refundGrossAmount) {
            this.refundGrossAmount = arguments.refundGrossAmount;
        }

        public numeric function getRefundGrossAmount() {
            return this.refundGrossAmount;
        }

        public void function setTotalOfAllRefunds(numeric totalOfAllRefunds) {
            this.totalOfAllRefunds = arguments.totalOfAllRefunds;
        }

        public numeric function getTotalOfAllRefunds() {
            return this.totalOfAllRefunds;
        }

        public void function setRefundHasBecomeFull(boolean refundHasBecomeFull) {
            this.refundHasBecomeFull = arguments.refundHasBecomeFull;
        }

        public boolean function getRefundHasBecomeFull() {
            return this.refundHasBecomeFull;
        }

        public void function setEncryptedRefundTransactionId(string encryptedRefundTransactionId) {
            this.encryptedRefundTransactionId = arguments.encryptedRefundTransactionId;
        }

        public string function getEncryptedRefundTransactionId() {
            return this.encryptedRefundTransactionId;
        }

        public void function setRefundTransactionStatus(string refundTransactionStatus) {
            this.refundTransactionStatus = arguments.refundTransactionStatus;
        }

        public string function getRefundTransactionStatus() {
            return this.refundTransactionStatus;
        }

        public void function setRrrorList(ErrorList errorList) {
            this.errorList = arguments.errorList;
        }

        public ErrorList function getErrorList() {
            return this.errorList;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.receiver')) {
                local.struct["receiver"] = getReceiver().getStruct();
            }

            if(isDefined('this.refundStatus')) {
                local.struct["refundStatus"] = getRefundStatus();
            }

            if(isDefined('this.refundNetAmount')) {
                local.struct["refundNetAmount"] = getRefundNetAmount();
            }

            if(isDefined('this.refundFeeAmount')) {
                local.struct["refundFeeAmount"] = getRefundFeeAmount();
            }

            if(isDefined('this.refundGrossAmount')) {
                local.struct["refundGrossAmount"] = getRefundGrossAmount();
            }

            if(isDefined('this.totalOfAllRefunds')) {
                local.struct["totalOfAllRefunds"] = getTotalOfAllRefunds();
            }

            if(isDefined('this.refundHasBecomeFull')) {
                local.struct["refundHasBecomeFull"] = getRefundHasBecomeFull();
            }

            if(isDefined('this.encryptedRefundTransactionId')) {
                local.struct["encryptedRefundTransactionId"] = getEncryptedRefundTransactionId();
            }

            if(isDefined('this.refundTransactionStatus'))
                local.struct["refundTransactionStatus"] = getRefundTransactionStatus();

            if(isDefined('this.errorList')) {
                local.struct["errorList"] = getErrorList().getStruct();
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

                    if('#key#' eq 'receiver') {

                        var keyObj = createObject("component", 'receiver');

                        this.setReceiver(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'refundStatus') {
                        this.setRefundStatus(local.json[key]);
                    }

                    if('#key#' eq 'refundNetAmount') {
                        this.setRefundNetAmount(local.json[key]);
                    }

                    if('#key#' eq 'refundFeeAmount') {
                        this.setRefundFeeAmount(local.json[key]);
                    }

                    if('#key#' eq 'refundGrossAmount') {
                        this.setRefundGrossAmount(local.json[key]);
                    }

                    if('#key#' eq 'totalOfAllRefunds') {
                        this.setTotalOfAllRefunds(local.json[key]);
                    }

                    if('#key#' eq 'refundHasBecomeFull') {
                        this.setRefundHasBecomeFull(local.json[key]);
                    }

                    if('#key#' eq 'encryptedRefundTransactionId') {
                        this.setEncryptedRefundTransactionId(local.json[key]);
                    }

                    if('#key#' eq 'refundTransactionStatus') {
                        this.setRefundTransactionStatus(local.json[key]);
                    }

                    if('#key#' eq 'errorList') {

                        var keyObj = createObject("component", 'errorList');

                        this.setErrorList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setReceiver(local.json[i]);

                        this.setRefundStatus(local.json[i]);

                        this.setRefundNetAmount(local.json[i]);

                        this.setRefundFeeAmount(local.json[i]);

                        this.setRefundGrossAmount(local.json[i]);

                        this.setTotalOfAllRefunds(local.json[i]);

                        this.setRefundHasBecomeFull(local.json[i]);

                        this.setEncryptedRefundTransactionId(local.json[i]);

                        this.setRefundTransactionStatus(local.json[i]);

                        this.setErrorList(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'receiver') {

                                var keyObj = createObject("component", 'receiver');

                                this.setReceiver(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'refundStatus') {
                                this.setRefundStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'refundNetAmount') {
                                this.setRefundNetAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'refundFeeAmount') {
                                this.setRefundFeeAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'refundGrossAmount') {
                                this.setRefundGrossAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'totalOfAllRefunds') {
                                this.setTotalOfAllRefunds(local.json[i][key]);
                            }

                            if('#key#' eq 'refundHasBecomeFull') {
                                this.setRefundHasBecomeFull(local.json[i][key]);
                            }

                            if('#key#' eq 'encryptedRefundTransactionId') {
                                this.setEncryptedRefundTransactionId(local.json[i][key]);
                            }

                            if('#key#' eq 'refundTransactionStatus') {
                                this.setRefundTransactionStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'errorList') {

                                var keyObj = createObject("component", 'errorList');

                                this.seterrorList(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>