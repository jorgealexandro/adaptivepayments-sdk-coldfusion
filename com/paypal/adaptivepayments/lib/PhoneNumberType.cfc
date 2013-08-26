<cfscript>
    component name="PhoneNumberType" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="countryCode" type="string" display="countryCode" required="yes" hint="";
        property name="phoneNumber" type="string" display="phoneNumber" required="yes" hint="";
        property name="extension" type="string" display="extension" required="no" hint="";

        public PhoneNumberType function init(string countryCode="", string phoneNumber="") hint="I initialize the component and return myself" output="false" {

            this.setCountryCode(arguments.countryCode);

            this.setPhoneNumber(arguments.phoneNumber);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setCountryCode(string countryCode) {
            this.countryCode = arguments.countryCode;
        }

        public string function getCountryCode() {
            return this.countryCode;
        }

        public void function setPhoneNumber(string phoneNumber) {
            this.phoneNumber = arguments.phoneNumber;
        }

        public string function getPhoneNumber() {
            return this.phoneNumber;
        }

        public void function setExtension(string extension) {
            this.extension = arguments.extension;
        }

        public string function getExtension() {
            return this.extension;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.countryCode')) {
                local.struct["countryCode"] = getCountryCode();
            }

            if(isDefined('this.phoneNumber')) {
                local.struct["phoneNumber"] = getPhoneNumber();
            }

            if(isDefined('this.extension')) {
                local.struct["extension"] = getExtension();
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

                    if('#key#' eq 'countryCode') {
                        this.setCountryCode(local.json[key]);
                    }

                    if('#key#' eq 'phoneNumber') {
                        this.setPhoneNumber(local.json[key]);
                    }

                    if('#key#' eq 'extension') {
                        this.setExtension(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setCountryCode(local.json[i]);

                        this.setPhoneNumber(local.json[i]);

                        this.setExtension(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'countryCode') {
                                this.setCountryCode(local.json[i][key]);
                            }

                            if('#key#' eq 'phoneNumber') {
                                this.setPhoneNumber(local.json[i][key]);
                            }

                            if('#key#' eq 'extension') {
                                this.setExtension(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>