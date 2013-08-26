<cfscript>
    component name="ExecutePaymentRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="payKey" type="string" display="payKey" required="yes" hint="";
        property name="actionType" type="string" display="actionType" required="no" hint="Describes the action that is performed by this API";
        property name="fundingPlanId" type="string" display="fundingPlanId" required="no" hint="";

        public ExecutePaymentRequest function init(RequestEnvelope requestEnvelope="", string payKey="") hint="I initialize the component and return myself" output="false" {

            this.setrequestEnvelope(arguments.requestEnvelope);

            this.setpayKey(arguments.payKey);

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

        public void function setFundingPlanId(string fundingPlanId) {
            this.fundingPlanId = arguments.fundingPlanId;
        }

        public string function getFundingPlanId() {
            return this.fundingPlanId;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.requestEnvelope')) {
                local.struct["requestEnvelope"] = getRequestEnvelope().getStruct();
            }

            if(isDefined('this.payKey')) {
                local.struct["payKey"] = getPayKey();
            }

            if(isDefined('this.actionType')) {
                local.struct["actionType"] = getActionType();
            }

            if(isDefined('this.fundingPlanId')) {
                local.struct["fundingPlanId"] = getFundingPlanId();
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

                    if('#key#' eq 'payKey') {

                        this.setPayKey(local.json[key]);
                    }

                    if('#key#' eq 'actionType') {

                        this.setActionType(local.json[key]);
                    }

                    if('#key#' eq 'fundingPlanId') {

                        this.setFundingPlanId(local.json[key]);
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

                        this.setPayKey(local.json[i]);

                        this.setActionType(local.json[i]);

                        this.setFundingPlanId(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {
                                var keyObj = createObject("component", 'requestEnvelope');
                                this.setRequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'payKey') {
                                this.setPayKey(local.json[i][key]);
                            }

                            if('#key#' eq 'actionType') {
                                this.setActionType(local.json[i][key]);
                            }

                            if('#key#' eq 'fundingPlanId') {
                                this.setFundingPlanId(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>