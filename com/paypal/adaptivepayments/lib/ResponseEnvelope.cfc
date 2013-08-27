<cfscript>
    component name="ResponseEnvelope" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="timestamp" type="string" display="timestamp" required="yes" hint="";
        property name="ack" type="AckCode" display="ack" required="yes" hint="Application level acknowledgment code.";
        property name="correlationId" type="string" display="correlationId" required="yes" hint="";
        property name="build" type="string" display="build" required="yes" hint="";

        public ResponseEnvelope function init(string timestamp="", AckCode ack="", string correlationId="", string build="") hint="I initialize the component and return myself" output="false" {

            this.setTimestamp(arguments.timestamp);

            this.setAck(arguments.ack);

            this.setCorrelationId(arguments.correlationId);

            this.setBuild(arguments.build);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setTimestamp(string timestamp) {
            this.timestamp = arguments.timestamp;
        }

        public string function getTimestamp() {
            return this.timestamp;
        }

        public void function setAck(AckCode ack) {
            this.ack = arguments.ack;
        }

        public AckCode function getAck() {
            return this.ack;
        }

        public void function setCorrelationId(string correlationId) {
            this.correlationId = arguments.correlationId;
        }

        public string function getCorrelationId() {
            return this.correlationId;
        }

        public void function setBuild(string build) {
            this.build = arguments.build;
        }

        public string function getBuild() {
            return this.build;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.timestamp')) {
                local.struct["timestamp"] = getTimestamp();
            }

            if(isDefined('this.ack')) {
                local.struct["ack"] = getAck().getStruct();
            }

            if(isDefined('this.correlationId')) {
                local.struct["correlationId"] = getCorrelationId();
            }

            if(isDefined('this.build')) {
                local.struct["build"] = getBuild();
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

                    if('#key#' eq 'timestamp') {
                        this.setTimestamp(local.json[key]);
                    }

                    if('#key#' eq 'ack') {

                        var keyObj = createObject("component", 'ackCode');

                        this.setAck(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'correlationId') {
                        this.setCorrelationId(local.json[key]);
                    }

                    if('#key#' eq 'build') {
                        this.setBuild(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setTimestamp(local.json[i]);

                        this.setAck(local.json[i]);

                        this.setCorrelationId(local.json[i]);

                        this.setBuild(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'timestamp') {

                                this.setTimestamp(local.json[i][key]);
                            }

                            if('#key#' eq 'ack') {

                                var keyObj = createObject("component", 'ackCode');

                                this.setAck(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'correlationId') {
                                this.setCorrelationId(local.json[i][key]);
                            }

                            if('#key#' eq 'build') {
                                this.setBuild(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>