<cfscript>
    component name="PreapprovalDetailsRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="preapprovalKey" type="string" display="preapprovalKey" required="yes" hint="";
        property name="getBillingAddress" type="boolean" display="getBillingAddress" required="no" hint="";

        public PreapprovalDetailsRequest function init(RequestEnvelope requestEnvelope="", string preapprovalKey="") hint="I initialize the component and return myself" output="false" {

            this.setRequestEnvelope(arguments.requestEnvelope);

            this.setPreapprovalKey(arguments.preapprovalKey);

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

        public void function setPreapprovalKey(string preapprovalKey) {
            this.preapprovalKey = arguments.preapprovalKey;
        }

        public string function getPreapprovalKey() {
            return this.preapprovalKey;
        }

        public void function setGetBillingAddress(boolean getBillingAddress) {
            this.getBillingAddress = arguments.getBillingAddress;
        }

        public boolean function getGetBillingAddress() {
            return this.getBillingAddress;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.requestEnvelope')) {
                local.struct["requestEnvelope"] = getRequestEnvelope().getStruct();
            }

            if(isDefined('this.preapprovalKey')) {
                local.struct["preapprovalKey"] = getPreapprovalKey();
            }

            if(isDefined('this.getBillingAddress')) {
                local.struct["getBillingAddress"] = getGetBillingAddress();
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

                        this.setrequestEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'preapprovalKey') {
                        this.setPreapprovalKey(local.json[key]);
                    }

                    if('#key#' eq 'getBillingAddress') {
                        this.setGetBillingAddress(local.json[key]);
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

                        this.setPreapprovalKey(local.json[i]);

                        this.setGetBillingAddress(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {

                                var keyObj = createObject("component", 'requestEnvelope');

                                this.setRequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'preapprovalKey') {
                                this.setPreapprovalKey(local.json[i][key]);
                            }

                            if('#key#' eq 'getBillingAddress') {
                                this.setGetBillingAddress(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>