<cfscript>
    component name="Address" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="addresseeName" type="string" display="addresseeName" required="no" hint="";
        property name="baseAddress" type="BaseAddress" display="baseAddress" required="yes" hint="";
        property name="addressId" type="string" display="addressId" required="no" hint="";

        public Address function init(BaseAddress baseAddress="") hint="I initialize the component and return myself" output="false" {

            this.setbaseAddress(arguments.baseAddress);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setAddresseeName(string addresseeName) {
            this.addresseeName = arguments.addresseeName;
        }

        public string function getAddresseeName() {
            return this.addresseeName;
        }

        public void function setBaseAddress(BaseAddress baseAddress) {
            this.baseAddress = arguments.baseAddress;
        }

        public BaseAddress function getBaseAddress() {
            return this.baseAddress;
        }

        public void function setAddressId(string addressId) {
            this.addressId = arguments.addressId;
        }

        public string function getAddressId() {
            return this.addressId;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.addresseeName')) {
                local.struct["addresseeName"] = getAddresseeName();
            }

            if(isDefined('this.baseAddress')) {
                local.struct["baseAddress"] = getBaseAddress().getStruct();
            }

            if(isDefined('this.addressId')) {
                local.struct["addressId"] = getAddressId();
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

                    if('#key#' eq 'addresseeName') {

                        this.setAddresseeName(local.json[key]);
                    }

                    if('#key#' eq 'baseAddress') {

                        var keyObj = createObject("component", 'baseAddress');
                        this.setBaseAddress(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'addressId') {

                        this.setAddressId(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setAddresseeName(local.json[i]);

                        this.setBaseAddress(local.json[i]);

                        this.setAddressId(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'addresseeName') {

                                this.setAddresseeName(local.json[i][key]);
                            }

                            if('#key#' eq 'baseAddress') {
                                var keyObj = createObject("component", 'baseAddress');
                                this.setBaseAddress(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'addressId') {
                                this.setAddressId(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>