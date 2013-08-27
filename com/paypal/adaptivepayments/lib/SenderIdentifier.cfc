<cfscript>
    component name="SenderIdentifier" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="useCredentials" type="boolean" display="useCredentials" required="no" hint="";
        property name="taxIdDetails" type="boolean" display="taxIdDetails" required="no" hint="";
        property name="AccountIdentifier" type="AccountIdentifier" display="AccountIdentifier" required="no" hint="";

        public SenderIdentifier function init() hint="I initialize the component and return myself" output="false" {

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setUseCredentials(boolean useCredentials) {
            this.useCredentials = arguments.useCredentials;
        }

        public boolean function getUseCredentials() {
            return this.useCredentials;
        }

        public void function setTaxIdDetails(boolean taxIdDetails) {
            this.taxIdDetails = arguments.taxIdDetails;
        }

        public boolean function getTaxIdDetails() {
            return this.taxIdDetails;
        }

        public void function setAccountIdentifier(AccountIdentifier AccountIdentifier) {
            this.AccountIdentifier = arguments.AccountIdentifier;
        }

        public AccountIdentifier function getAccountIdentifier() {
            return this.AccountIdentifier;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.useCredentials')) {
                local.struct["useCredentials"] = getuseCredentials();
            }

            if(isDefined('this.taxIdDetails')) {
                local.struct["taxIdDetails"] = gettaxIdDetails();
            }

            if(isDefined('this.AccountIdentifier')) {
                local.struct["AccountIdentifier"] = getAccountIdentifier().getStruct();
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

                    if('#key#' eq 'useCredentials') {

                        this.setUseCredentials(local.json[key]);
                    }

                    if('#key#' eq 'taxIdDetails') {

                        this.setTaxIdDetails(local.json[key]);
                    }

                    if('#key#' eq 'AccountIdentifier') {

                        var keyObj = createObject("component", 'AccountIdentifier');

                        this.setAccountIdentifier(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setUseCredentials(local.json[i]);

                        this.setTaxIdDetails(local.json[i]);

                        this.setAccountIdentifier(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'useCredentials') {

                                this.setUseCredentials(local.json[i][key]);
                            }

                            if('#key#' eq 'taxIdDetails') {

                                this.setTaxIdDetails(local.json[i][key]);
                            }

                            if('#key#' eq 'AccountIdentifier') {

                                var keyObj = createObject("component", 'AccountIdentifier');

                                this.setAccountIdentifier(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>