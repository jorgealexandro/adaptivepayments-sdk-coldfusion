<cfscript>
    component name="InstitutionCustomer" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="institutionId" type="string" display="institutionId" required="yes" hint="The unique identifier as assigned to the institution.";
        property name="firstName" type="string" display="firstName" required="yes" hint="The first (given) name of the end consumer as known by the institution.";
        property name="lastName" type="string" display="lastName" required="yes" hint="The last (family) name of the end consumer as known by the institution.";
        property name="displayName" type="string" display="displayName" required="yes" hint="The full name of the end consumer as known by the institution.";
        property name="institutionCustomerId" type="string" display="institutionCustomerId" required="yes" hint="The unique identifier as assigned to the end consumer by the institution.";
        property name="countryCode" type="string" display="countryCode" required="yes" hint="The two-character ISO country code of the home country of the end consumer";
        property name="email" type="string" display="email" required="no" hint="";

        public InstitutionCustomer function init(string institutionId="", string firstName="", string lastName="", string displayName="", string institutionCustomerId="", string countryCode="") hint="I initialize the component and return myself" output="false" {

            this.setInstitutionId(arguments.institutionId);

            this.setFirstName(arguments.firstName);

            this.setLastName(arguments.lastName);

            this.setDisplayName(arguments.displayName);

            this.setInstitutionCustomerId(arguments.institutionCustomerId);

            this.setCountryCode(arguments.countryCode);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setInstitutionId(string institutionId) {
            this.institutionId = arguments.institutionId;
        }

        public string function getInstitutionId() {
            return this.institutionId;
        }

        public void function setFirstName(string firstName) {
            this.firstName = arguments.firstName;
        }

        public string function getFirstName() {
            return this.firstName;
        }

        public void function setLastName(string lastName) {
            this.lastName = arguments.lastName;
        }

        public string function getLastName() {
            return this.lastName;
        }

        public void function setDisplayName(string displayName) {
            this.displayName = arguments.displayName;
        }

        public string function getDisplayName() {
            return this.displayName;
        }

        public void function setInstitutionCustomerId(string institutionCustomerId) {
            this.institutionCustomerId = arguments.institutionCustomerId;
        }

        public string function getInstitutionCustomerId() {
            return this.institutionCustomerId;
        }

        public void function setCountryCode(string countryCode) {
            this.countryCode = arguments.countryCode;
        }

        public string function getCountryCode() {
            return this.countryCode;
        }

        public void function setEmail(string email) {
            this.email = arguments.email;
        }

        public string function getEmail() {
            return this.email;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.institutionId')) {
                local.struct["institutionId"] = getInstitutionId();
            }

            if(isDefined('this.firstName')) {
                local.struct["firstName"] = getFirstName();
            }

            if(isDefined('this.lastName')) {
                local.struct["lastName"] = getLastName();
            }

            if(isDefined('this.displayName')) {
                local.struct["displayName"] = getDisplayName();
            }

            if(isDefined('this.institutionCustomerId')) {
                local.struct["institutionCustomerId"] = getInstitutionCustomerId();
            }

            if(isDefined('this.countryCode')) {
                local.struct["countryCode"] = getCountryCode();
            }

            if(isDefined('this.email')) {
                local.struct["email"] = getEmail();
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

                    if('#key#' eq 'institutionId') {
                        this.setInstitutionId(local.json[key]);
                    }

                    if('#key#' eq 'firstName') {
                        this.setFirstName(local.json[key]);
                    }

                    if('#key#' eq 'lastName') {
                        this.setLastName(local.json[key]);
                    }

                    if('#key#' eq 'displayName') {
                        this.setDisplayName(local.json[key]);
                    }

                    if('#key#' eq 'institutionCustomerId') {
                        this.setInstitutionCustomerId(local.json[key]);
                    }

                    if('#key#' eq 'countryCode') {
                        this.setCountryCode(local.json[key]);
                    }

                    if('#key#' eq 'email') {
                        this.setEmail(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setInstitutionId(local.json[i]);

                        this.setFirstName(local.json[i]);

                        this.setLastName(local.json[i]);

                        this.setDisplayName(local.json[i]);

                        this.setInstitutionCustomerId(local.json[i]);

                        this.setCountryCode(local.json[i]);

                        this.setEmail(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'institutionId') {
                                this.setInstitutionId(local.json[i][key]);
                            }

                            if('#key#' eq 'firstName') {
                                this.setFirstName(local.json[i][key]);
                            }

                            if('#key#' eq 'lastName') {
                                this.setLastName(local.json[i][key]);
                            }

                            if('#key#' eq 'displayName') {
                                this.setDisplayName(local.json[i][key]);
                            }

                            if('#key#' eq 'institutionCustomerId') {

                                this.setInstitutionCustomerId(local.json[i][key]);
                            }

                            if('#key#' eq 'countryCode') {

                                this.setCountryCode(local.json[i][key]);
                            }

                            if('#key#' eq 'email') {

                                this.setEmail(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>