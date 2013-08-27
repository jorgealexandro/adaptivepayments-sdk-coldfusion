<cfscript>
    component name="WarningData" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="warningId" type="numeric" display="warningId" required="no" hint="";
        property name="message" type="string" display="message" required="no" hint="";

        public WarningData function init() hint="I initialize the component and return myself" output="false" {

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setWarningId(numeric warningId) {
            this.warningId = arguments.warningId;
        }

        public numeric function getWarningId() {
            return this.warningId;
        }

        public void function setMessage(string message) {
            this.message = arguments.message;
        }

        public string function getMessage() {
            return this.message;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.warningId')) {
                local.struct["warningId"] = getWarningId();
            }

            if(isDefined('this.message')) {
                local.struct["message"] = getMessage();
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

                    if('#key#' eq 'warningId') {
                        this.setWarningId(local.json[key]);
                    }

                    if('#key#' eq 'message') {
                        this.setMessage(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setWarningId(local.json[i]);

                        this.setMessage(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'warningId') {
                                this.setWarningId(local.json[i][key]);
                            }

                            if('#key#' eq 'message') {
                                this.setMessage(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>