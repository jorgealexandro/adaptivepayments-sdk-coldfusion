<cfscript>
    component name="GetAvailableShippingAddressesRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="key" type="string" display="key" required="yes" hint="The key for which to provide the available addresses. Key can be an AdaptivePayments key such as payKey or preapprovalKey";

        public GetAvailableShippingAddressesRequest function init(RequestEnvelope requestEnvelope="", string key="") hint="I initialize the component and return myself" output="false" {

            this.setRequestEnvelope(arguments.requestEnvelope);

            this.setKey(arguments.key);

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

        public void function setKey(string key) {
            this.key = arguments.key;
        }

        public string function getKey() {
            return this.key;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.requestEnvelope')) {
                local.struct["requestEnvelope"] = getRequestEnvelope().getStruct();
            }

            if(isDefined('this.key')) {
                local.struct["key"] = getKey();
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

                    if('#key#' eq 'key') {

                        this.setKey(local.json[key]);
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

                        this.setKey(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {

                                var keyObj = createObject("component", 'requestEnvelope');

                                this.setrequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'key') {
                                this.setkey(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>