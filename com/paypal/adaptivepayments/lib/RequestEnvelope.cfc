<cfscript>
    component name="RequestEnvelope" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="detailLevel" type="DetailLevelCode" display="detailLevel" required="no" hint=" This specifies the required detail level that is needed by a client application pertaining to a particular data component (e.g., Item, Transaction, etc.). The detail level is specified in the DetailLevelCodeType which has all the enumerated values of the detail level for each component.";
        property name="errorLanguage" type="string" display="errorLanguage" required="yes" hint="This should be the standard RFC 3066 language identification tag, e.g., en_US.";

        public RequestEnvelope function init(string errorLanguage="") hint="I initialize the component and return myself" output="false" {

            this.setErrorLanguage(arguments.errorLanguage);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setDetailLevel(DetailLevelCode detailLevel) {
            this.detailLevel = arguments.detailLevel;
        }

        public DetailLevelCode function getDetailLevel() {
            return this.detailLevel;
        }

        public void function setErrorLanguage(string errorLanguage) {
            this.errorLanguage = arguments.errorLanguage;
        }

        public string function getErrorLanguage() {
            return this.errorLanguage;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')){
                local.struct["error"] = getError().getStruct();
            }


            if(isDefined('this.detailLevel')){
                local.struct["detailLevel"] = getDetailLevel().getStruct();
            }


            if(isDefined('this.errorLanguage')){
                local.struct["errorLanguage"] = getErrorLanguage();
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

                    if('#key#' eq 'detailLevel') {

                        var keyObj = createObject("component", 'detailLevel');

                        this.setDetailLevel(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'errorLanguage') {
                        this.setErrorLanguage(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setDetailLevel(local.json[i]);

                        this.setErrorLanguage(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'detailLevel') {

                                var keyObj = createObject("component", 'detailLevel');

                                this.setDetailLevel(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'errorLanguage') {
                                this.setErrorLanguage(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>