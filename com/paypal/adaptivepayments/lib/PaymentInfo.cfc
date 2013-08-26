<cfscript>
    component name="PaymentInfo" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="transactionId" type="string" display="transactionId" required="no" hint="";
        property name="transactionStatus" type="string" display="transactionStatus" required="no" hint="";
        property name="receiver" type="Receiver" display="receiver" required="yes" hint="";
        property name="refundedAmount" type="numeric" display="refundedAmount" required="no" hint="";
        property name="pendingRefund" type="boolean" display="pendingRefund" required="no" hint="";
        property name="senderTransactionId" type="string" display="senderTransactionId" required="no" hint="";
        property name="senderTransactionStatus" type="string" display="senderTransactionStatus" required="no" hint="";
        property name="pendingReason" type="string" display="pendingReason" required="no" hint="";

        public PaymentInfo function init(Receiver receiver="") hint="I initialize the component and return myself" output="false" {

            this.setreceiver(arguments.receiver);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setTransactionId(string transactionId) {
            this.transactionId = arguments.transactionId;
        }

        public string function getTransactionId() {
            return this.transactionId;
        }

        public void function setTransactionStatus(string transactionStatus) {
            this.transactionStatus = arguments.transactionStatus;
        }

        public string function getTransactionStatus() {
            return this.transactionStatus;
        }

        public void function setReceiver(Receiver receiver) {
            this.receiver = arguments.receiver;
        }

        public Receiver function getReceiver() {
            return this.receiver;
        }

        public void function setRefundedAmount(numeric refundedAmount) {
            this.refundedAmount = arguments.refundedAmount;
        }

        public numeric function getRefundedAmount() {
            return this.refundedAmount;
        }

        public void function setPendingRefund(boolean pendingRefund) {
            this.pendingRefund = arguments.pendingRefund;
        }

        public boolean function getPendingRefund() {
            return this.pendingRefund;
        }

        public void function setSenderTransactionId(string senderTransactionId) {
            this.senderTransactionId = arguments.senderTransactionId;
        }

        public string function getSenderTransactionId() {
            return this.senderTransactionId;
        }

        public void function setSenderTransactionStatus(string senderTransactionStatus) {
            this.senderTransactionStatus = arguments.senderTransactionStatus;
        }

        public string function getSenderTransactionStatus() {
            return this.senderTransactionStatus;
        }

        public void function setPendingReason(string pendingReason) {
            this.pendingReason = arguments.pendingReason;
        }

        public string function getPendingReason() {
            return this.pendingReason;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.transactionId')) {
                local.struct["transactionId"] = getTransactionId();
            }

            if(isDefined('this.transactionStatus')) {
                local.struct["transactionStatus"] = getTransactionStatus();
            }

            if(isDefined('this.receiver')) {
                local.struct["receiver"] = getReceiver().getStruct();
            }

            if(isDefined('this.refundedAmount')) {
                local.struct["refundedAmount"] = getRefundedAmount();
            }

            if(isDefined('this.pendingRefund')) {
                local.struct["pendingRefund"] = getPendingRefund();
            }

            if(isDefined('this.senderTransactionId')) {
                local.struct["senderTransactionId"] = getSenderTransactionId();
            }

            if(isDefined('this.senderTransactionStatus')) {
                local.struct["senderTransactionStatus"] = getSenderTransactionStatus();
            }

            if(isDefined('this.pendingReason')) {
                local.struct["pendingReason"] = getPendingReason();
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

                    if('#key#' eq 'transactionId') {
                        this.setTransactionId(local.json[key]);
                    }

                    if('#key#' eq 'transactionStatus') {
                        this.setTransactionStatus(local.json[key]);
                    }

                    if('#key#' eq 'receiver') {

                        var keyObj = createObject("component", 'receiver');

                        this.setReceiver(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'refundedAmount') {
                        this.setRefundedAmount(local.json[key]);
                    }

                    if('#key#' eq 'pendingRefund') {
                        this.setPendingRefund(local.json[key]);
                    }

                    if('#key#' eq 'senderTransactionId') {
                        this.setSenderTransactionId(local.json[key]);
                    }

                    if('#key#' eq 'senderTransactionStatus') {
                        this.setSenderTransactionStatus(local.json[key]);
                    }

                    if('#key#' eq 'pendingReason') {
                        this.setPendingReason(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setTransactionId(local.json[i]);

                        this.setTransactionStatus(local.json[i]);

                        this.setReceiver(local.json[i]);

                        this.setRefundedAmount(local.json[i]);

                        this.setPendingRefund(local.json[i]);

                        this.setSenderTransactionId(local.json[i]);

                        this.setSenderTransactionStatus(local.json[i]);

                        this.setPendingReason(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'transactionId') {
                                this.setTransactionId(local.json[i][key]);
                            }

                            if('#key#' eq 'transactionStatus') {
                                this.setTransactionStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'receiver') {

                                var keyObj = createObject("component", 'receiver');

                                this.setreceiver(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'refundedAmount') {
                                this.setRefundedAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'pendingRefund') {
                                this.setPendingRefund(local.json[i][key]);
                            }

                            if('#key#' eq 'senderTransactionId') {
                                this.setSenderTransactionId(local.json[i][key]);
                            }

                            if('#key#' eq 'senderTransactionStatus') {
                                this.setSenderTransactionStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'pendingReason') {
                                this.setPendingReason(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>