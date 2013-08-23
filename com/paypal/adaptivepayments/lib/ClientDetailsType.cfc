<cfscript>
    component name="ClientDetailsType" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="ipAddress" type="string" display="ipAddress" required="no" hint="";
        property name="deviceId" type="string" display="deviceId" required="no" hint="";
        property name="applicationId" type="string" display="applicationId" required="no" hint="";
        property name="model" type="string" display="model" required="no" hint="";
        property name="geoLocation" type="string" display="geoLocation" required="no" hint="";
        property name="customerType" type="string" display="customerType" required="no" hint="";
        property name="partnerName" type="string" display="partnerName" required="no" hint="";
        property name="customerId" type="string" display="customerId" required="no" hint="";

        public ClientDetailsType function init() hint="I initialize the component and return myself" output="false" {

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setIpAddress(string ipAddress) {
            this.ipAddress = arguments.ipAddress;
        }

        public string function getIpAddress() {
            return this.ipAddress;
        }

        public void function setDeviceId(string deviceId) {
            this.deviceId = arguments.deviceId;
        }

        public string function getDeviceId() {
            return this.deviceId;
        }

        public void function setApplicationId(string applicationId) {
            this.applicationId = arguments.applicationId;
        }

        public string function getApplicationId() {
            return this.applicationId;
        }

        public void function setModel(string model) {
            this.model = arguments.model;
        }

        public string function getModel() {
            return this.model;
        }

        public void function setGeoLocation(string geoLocation) {
            this.geoLocation = arguments.geoLocation;
        }

        public string function getGeoLocation() {
            return this.geoLocation;
        }

        public void function setCustomerType(string customerType) {
            this.customerType = arguments.customerType;
        }

        public string function getCustomerType() {
            return this.customerType;
        }

        public void function setPartnerName(string partnerName) {
            this.partnerName = arguments.partnerName;
        }

        public string function getPartnerName() {
            return this.partnerName;
        }

        public void function setCustomerId(string customerId) {
            this.customerId = arguments.customerId;
        }

        public string function getCustomerId() {
            return this.customerId;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.ipAddress')) {
                local.struct["ipAddress"] = getIpAddress();
            }

            if(isDefined('this.deviceId')) {
                local.struct["deviceId"] = getDeviceId();
            }

            if(isDefined('this.applicationId')) {
                local.struct["applicationId"] = getApplicationId();
            }

            if(isDefined('this.model')) {
                local.struct["model"] = getModel();
            }

            if(isDefined('this.geoLocation')) {
                local.struct["geoLocation"] = getGeoLocation();
            }

            if(isDefined('this.customerType')) {
                local.struct["customerType"] = getCustomerType();
            }

            if(isDefined('this.partnerName')) {
                local.struct["partnerName"] = getPartnerName();
            }

            if(isDefined('this.customerId')) {
                local.struct["customerId"] = getCustomerId();
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

                    if('#key#' eq 'ipAddress') {
                        this.setIpAddress(local.json[key]);
                    }

                    if('#key#' eq 'deviceId') {
                        this.setDeviceId(local.json[key]);
                    }

                    if('#key#' eq 'applicationId') {
                        this.setApplicationId(local.json[key]);
                    }

                    if('#key#' eq 'model') {
                        this.setModel(local.json[key]);
                    }

                    if('#key#' eq 'geoLocation') {
                        this.setGeoLocation(local.json[key]);
                    }

                    if('#key#' eq 'customerType') {
                        this.setCustomerType(local.json[key]);
                    }

                    if('#key#' eq 'partnerName') {
                        this.setPartnerName(local.json[key]);
                    }

                    if('#key#' eq 'customerId') {
                        this.setCustomerId(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setIpAddress(local.json[i]);

                        this.setDeviceId(local.json[i]);

                        this.setApplicationId(local.json[i]);

                        this.setModel(local.json[i]);

                        this.setGeoLocation(local.json[i]);

                        this.setCustomerType(local.json[i]);

                        this.setPartnerName(local.json[i]);

                        this.setCustomerId(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'ipAddress') {
                                this.setIpAddress(local.json[i][key]);
                            }

                            if('#key#' eq 'deviceId') {
                                this.setDeviceId(local.json[i][key]);
                            }

                            if('#key#' eq 'applicationId') {
                                this.setApplicationId(local.json[i][key]);
                            }

                            if('#key#' eq 'model') {
                                this.setModel(local.json[i][key]);
                            }

                            if('#key#' eq 'geoLocation') {
                                this.setGeoLocation(local.json[i][key]);
                            }

                            if('#key#' eq 'customerType') {
                                this.setCustomerType(local.json[i][key]);
                            }

                            if('#key#' eq 'partnerName') {
                                this.setPartnerName(local.json[i][key]);
                            }

                            if('#key#' eq 'customerId') {
                                this.setCustomerId(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>