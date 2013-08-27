<cfscript>
    component name="PreapprovalResponse" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="responseEnvelope" type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
        property name="preapprovalKey" type="string" display="preapprovalKey" required="yes" hint="";

        public PreapprovalResponse function init(ResponseEnvelope responseEnvelope="", string preapprovalKey="") hint="I initialize the component and return myself" output="false" {

            this.setResponseEnvelope(arguments.responseEnvelope);

            this.setPreapprovalKey(arguments.preapprovalKey);

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

        public void function setPreapprovalKey(string preapprovalKey) {
            this.preapprovalKey = arguments.preapprovalKey;
        }

        public string function getPreapprovalKey() {
            return this.preapprovalKey;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.responseEnvelope')) {
                local.struct["responseEnvelope"] = getResponseEnvelope().getStruct();
            }

            if(isDefined('this.preapprovalKey')) {
                local.struct["preapprovalKey"] = getPreapprovalKey();
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

                    if('#key#' eq 'preapprovalKey') {
                        this.setPreapprovalKey(local.json[key]);
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

                        this.setPreapprovalKey(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'responseEnvelope') {

                                var keyObj = createObject("component", 'responseEnvelope');

                                this.setResponseEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'preapprovalKey') {
                                this.setPreapprovalKey(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>