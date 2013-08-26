<cfscript>
    component name="PayResponse" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="responseEnvelope" type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
        property name="payKey" type="string" display="payKey" required="yes" hint="";
        property name="paymentExecStatus" type="string" display="paymentExecStatus" required="yes" hint="";
        property name="payErrorList" type="PayErrorList" display="payErrorList" required="no" hint="";
        property name="defaultFundingPlan" type="FundingPlan" display="defaultFundingPlan" required="no" hint="";
        property name="warningDataList" type="WarningDataList" display="warningDataList" required="no" hint="";

        public PayResponse function init(ResponseEnvelope responseEnvelope="", string payKey="", string paymentExecStatus="") hint="I initialize the component and return myself" output="false" {

            this.setResponseEnvelope(arguments.responseEnvelope);

            this.setPayKey(arguments.payKey);

            this.setPaymentExecStatus(arguments.paymentExecStatus);

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

        public void function setPayKey(string payKey) {
            this.payKey = arguments.payKey;
        }

        public string function getPayKey() {
            return this.payKey;
        }

        public void function setPaymentExecStatus(string paymentExecStatus) {
            this.paymentExecStatus = arguments.paymentExecStatus;
        }

        public string function getPaymentExecStatus() {
            return this.paymentExecStatus;
        }

        public void function setPayErrorList(PayErrorList payErrorList) {
            this.payErrorList = arguments.payErrorList;
        }

        public PayErrorList function getPayErrorList() {
            return this.payErrorList;
        }

        public void function setDefaultFundingPlan(FundingPlan defaultFundingPlan) {
            this.defaultFundingPlan = arguments.defaultFundingPlan;
        }

        public FundingPlan function getDefaultFundingPlan() {
            return this.defaultFundingPlan;
        }

        public void function setWarningDataList(WarningDataList warningDataList) {
            this.warningDataList = arguments.warningDataList;
        }

        public WarningDataList function getWarningDataList() {
            return this.warningDataList;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')){
                local.struct["error"] = getError().getStruct();
            }


            if(isDefined('this.responseEnvelope')){
                local.struct["responseEnvelope"] = getResponseEnvelope().getStruct();
            }


            if(isDefined('this.payKey')){
                local.struct["payKey"] = getPayKey();
            }


            if(isDefined('this.paymentExecStatus')){
                local.struct["paymentExecStatus"] = getPaymentExecStatus();
            }


            if(isDefined('this.payErrorList')){
                local.struct["payErrorList"] = getPayErrorList().getStruct();
            }


            if(isDefined('this.defaultFundingPlan')){
                local.struct["defaultFundingPlan"] = getDefaultFundingPlan().getStruct();
            }


            if(isDefined('this.warningDataList')){
                local.struct["warningDataList"] = getWarningDataList().getStruct();
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

                    if('#key#' eq 'payKey') {
                        this.setPayKey(local.json[key]);
                    }

                    if('#key#' eq 'paymentExecStatus') {
                        this.setPaymentExecStatus(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyCom = 'payErrorList';

                        // TODO: does the errorStruct need to be set to local var scope?
                        errorStruct = StructNew();
                        errorStruct['payError'] = local.json[key];
                        local.json[key] = errorStruct;

                        var keyObj = createObject("component", '#keyCom#');

                        this.setpayErrorList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'defaultFundingPlan') {

                        var keyObj = createObject("component", 'defaultFundingPlan');

                        this.setDefaultFundingPlan(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'warningDataList') {

                        var keyObj = createObject("component", 'warningDataList');

                        this.setWarningDataList(keyObj.deserialize(local.json[key]));
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

                        this.setPayKey(local.json[i]);

                        this.setPaymentExecStatus(local.json[i]);

                        this.setPayErrorList(local.json[i]);

                        this.setDefaultFundingPlan(local.json[i]);

                        this.setWarningDataList(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'responseEnvelope') {

                                var keyObj = createObject("component", 'responseEnvelope');

                                this.setResponseEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'payKey') {
                                this.setPayKey(local.json[i][key]);
                            }

                            if('#key#' eq 'paymentExecStatus') {
                                this.setPaymentExecStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'error') {

                                var keyObj = createObject("component", 'error');

                                this.setPayErrorList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'defaultFundingPlan') {

                                var keyObj = createObject("component", 'defaultFundingPlan');

                                this.setDefaultFundingPlan(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'warningDataList') {

                                var keyObj = createObject("component", 'warningDataList');

                                this.setWarningDataList(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>