-- Description: Data model changes #533 Connect v6.11.5 Muses2 CON-101562.

insert into POLE_UPGRADE_SCRIPT_LOG
(SCRIPT_NAME, DATA_MODEL_NAME, PROVENANCE, DATE_EXECUTED) values
('pole15453-pole15454.sql', 'Muses2', 'CON-101562', sysdate);
commit;

-- Table creates:
CREATE TABLE "FORENSIC_JOB" (
    "OBJECT_REF"                  NUMBER(10, 0) NOT NULL,
    "VERSION"                     NUMBER(10, 0) NOT NULL,
    "DEEP_VERSION"                NUMBER(10, 0) NOT NULL,
    "BRC"                         CHAR(20),
    "STATUS"                      VARCHAR2(40 CHAR) NULL,
    "CREATE_DATE_TIME"            TIMESTAMP(6) NOT NULL,
    "CREATE_STAFF_OBJECT_REF"     NUMBER(10, 0) NOT NULL,
    "CREATE_EMPLOYEE_ID"          NUMBER(10, 0) NULL,
    "CREATE_CLIENT_USER_DESC"     VARCHAR2(50 CHAR) NULL,
    "CREATE_TERMINAL_ID"          VARCHAR2(40 CHAR) NULL,
    "CREATE_CLIENT_NAME"          VARCHAR2(40 CHAR) NULL,
    "ORIGINATING_PARTNER_CODE"    VARCHAR2(40 CHAR) NULL,
    "ACCESS_PARTNERS_BIT_FIELD"   NUMBER(19, 0) NULL,
    "UPDATE_DATE_TIME"            TIMESTAMP(6) NOT NULL,
    "UPDATE_STAFF_OBJECT_REF"     NUMBER(10, 0) NOT NULL,
    "UPDATE_EMPLOYEE_ID"          NUMBER(10, 0) NOT NULL,
    "UPDATE_CLIENT_USER_DESC"     VARCHAR2(50 CHAR) NULL,
    "UPDATE_TERMINAL_ID"          VARCHAR2(40 CHAR) NULL,
    "OWNING_FORCE_ID"             VARCHAR2(40 CHAR) NULL,
    "MOPI_GROUP"                  VARCHAR2(40 CHAR) NULL,
    "MOPI_RETENTION_DATE"         DATE NULL,
    "INHERITED_RETENTION_DATE"    DATE NULL,
    "BRC_PROVENANCE"              VARCHAR2(20 CHAR) NULL,
    "CURRENT_CLASSIFICATION"      VARCHAR2(40 CHAR) NULL,
    "MANAGED_IN_CARDS"            CHAR(1) NULL,
    "FORENSIC_JOB_TYPE"           VARCHAR2(40 CHAR) NULL,
    "FORENSIC_JOB_STATUS"         VARCHAR2(40 CHAR) NULL,
    "FORENSIC_JOB_DETAILS"        VARCHAR2(40 CHAR) NULL,
    "FORENSIC_JOB_REFERENCE"      VARCHAR2(30 CHAR) NULL,
    "COMPLETION_DATE_TIME"        TIMESTAMP(6) NULL
);
-- TABLESPACE D_POLE;

CREATE TABLE "MARK_ANALYSIS" (
    "OBJECT_REF"                 NUMBER(10, 0) NOT NULL,
    "VERSION"                    NUMBER(10, 0) NOT NULL,
    "DEEP_VERSION"               NUMBER(10, 0) NOT NULL,
    "PARENT_OBJECT_REF"          NUMBER(10, 0) NOT NULL,
    "RATIONALE"                  VARCHAR2(4000 CHAR) NULL,
    "REASON_FOR_INSUFFICIENCY"   VARCHAR2(40 CHAR) NULL
);
-- TABLESPACE D_POLE;

CREATE TABLE "FSP_ITEM_DETAIL" (
    "OBJECT_REF"              NUMBER(10, 0) NOT NULL,
    "VERSION"                 NUMBER(10, 0) NOT NULL,
    "DEEP_VERSION"            NUMBER(10, 0) NOT NULL,
    "PARENT_OBJECT_REF"       NUMBER(10, 0) NOT NULL,
    "SERVICE_PROVIDER_NAME"   VARCHAR2(100 CHAR) NULL,
    "SERVICE"                 VARCHAR2(100 CHAR) NULL,
    "RESULT_TYPE_GROUP"       VARCHAR2(40 CHAR) NULL
);
-- TABLESPACE D_POLE;

CREATE TABLE "FSP_ITEM_DELIVERY_NOTE" (
    "OBJECT_REF"                NUMBER(10, 0) NOT NULL,
    "VERSION"                   NUMBER(10, 0) NOT NULL,
    "DEEP_VERSION"              NUMBER(10, 0) NOT NULL,
    "PARENT_OBJECT_REF"         NUMBER(10, 0) NOT NULL,
    "SERVICE_PROVIDER_NAME"     VARCHAR2(100 CHAR) NULL,
    "LABORATORY_CODE"           VARCHAR2(50 CHAR) NULL,
    "DATE_TAKEN_BY_PROVIDER"    DATE NULL,
    "DATE_OF_DELIVERY_NOTE"     DATE NULL,
    "DELIVERY_NOTE_NUMBER"      VARCHAR2(40 CHAR) NULL,
    "DELIVERY_STATUS"           VARCHAR2(100 CHAR) NULL,
    "UNITS_OF_CHARGING"         VARCHAR2(40 CHAR) NULL,
    "COMMENTS"                  VARCHAR2(4000 CHAR) NULL,
    "QUANTITY_DELIVERED"        NUMBER(10, 0) NULL,
    "COMMITTED_COST"            NUMBER(19, 2) NULL,
    "LIST_PRICE"                NUMBER(19, 2) NULL,
    "UPDATE_BY_EMP_ITER_ID"     NUMBER(10, 0) NULL,
    "LAST_MODIFIED_DATE_TIME"   TIMESTAMP(6) NULL
);
-- TABLESPACE D_POLE;

CREATE TABLE "FSP_ITEM_INVOICE" (
    "OBJECT_REF"                NUMBER(10, 0) NOT NULL,
    "VERSION"                   NUMBER(10, 0) NOT NULL,
    "DEEP_VERSION"              NUMBER(10, 0) NOT NULL,
    "PARENT_OBJECT_REF"         NUMBER(10, 0) NOT NULL,
    "INVOICE_NUMBER"            VARCHAR2(20 CHAR) NULL,
    "UNITS_OF_CHARGING"         VARCHAR2(40 CHAR) NULL,
    "COMMENTS"                  VARCHAR2(4000 CHAR) NULL,
    "INVOICED_PRICE"            NUMBER(19, 2) NULL,
    "COMMITTED_COST"            NUMBER(19, 2) NULL,
    "INVOICED_COST"             NUMBER(19, 2) NULL,
    "INVOICE_DATE"              DATE NULL,
    "QUANTITY"                  NUMBER(10, 0) NULL,
    "UPDATE_BY_EMP_ITER_ID"     NUMBER(10, 0) NULL,
    "LAST_MODIFIED_DATE_TIME"   TIMESTAMP(6) NULL
);
-- TABLESPACE D_POLE;

-- Primary key creates:
alter table "FORENSIC_JOB" add constraint "PK_FORENSIC_JOB" primary key ("OBJECT_REF");
-- using index tablespace I_POLE;
alter table "MARK_ANALYSIS" add constraint "PK_MARK_ANALYSIS" primary key ("OBJECT_REF");
-- using index tablespace I_POLE;
alter table "FSP_ITEM_DETAIL" add constraint "PK_FSP_ITEM_DETAIL" primary key ("OBJECT_REF");
-- using index tablespace I_POLE;
alter table "FSP_ITEM_DELIVERY_NOTE" add constraint "PK_FSP_ITEM_DELIVERY_NOTE" primary key ("OBJECT_REF");
-- using index tablespace I_POLE;
alter table "FSP_ITEM_INVOICE" add constraint "PK_FSP_ITEM_INVOICE" primary key ("OBJECT_REF");
-- using index tablespace I_POLE;

-- Index creates:
create unique index "UX_MARK_ANALYSIS_PARENT" on "MARK_ANALYSIS" ("PARENT_OBJECT_REF");
-- tablespace I_POLE;
create unique index "UX_FSP_ITEM_DETAIL_PARENT" on "FSP_ITEM_DETAIL" ("PARENT_OBJECT_REF");
-- tablespace I_POLE;
create unique index "UX_FIDN_PARENT" on "FSP_ITEM_DELIVERY_NOTE" ("PARENT_OBJECT_REF");
-- tablespace I_POLE;
create unique index "UX_FSP_ITEM_INVOICE_PARENT" on "FSP_ITEM_INVOICE" ("PARENT_OBJECT_REF");
-- tablespace I_POLE;

-- Foreign key constraint creates:
alter table "FORENSIC_JOB" add constraint "FK_FORENSIC_JOB__OPC" foreign key ("ORIGINATING_PARTNER_CODE") references "PARTNER" ("PARTNER_CODE");
alter table "FORENSIC_JOB" add constraint "FK_FORENSIC_JOB__OFI" foreign key ("OWNING_FORCE_ID") references "PNC_FORCE" ("PNC_FORCE_ID");
alter table "MARK_ANALYSIS" add constraint "FK_MARK_ANALYSIS__POR" foreign key ("PARENT_OBJECT_REF") references "FORENSIC_JOB" ("OBJECT_REF") on delete cascade;
alter table "FSP_ITEM_DETAIL" add constraint "FK_FSP_ITEM_DETAIL__SPN_S" foreign key ("SERVICE_PROVIDER_NAME", "SERVICE") references "FORENSIC_FSP_SERVICE" ("SERVICE_PROVIDER_NAME", "SERVICE_CODE");
alter table "FSP_ITEM_DETAIL" add constraint "FK_FSP_ITEM_DETAIL__POR" foreign key ("PARENT_OBJECT_REF") references "FORENSIC_JOB" ("OBJECT_REF") on delete cascade;
alter table "FSP_ITEM_DELIVERY_NOTE" add constraint "FK_FI_DELIVERY_NOTE__UBEII" foreign key ("UPDATE_BY_EMP_ITER_ID") references "EMPLOYEE_ITERATION" ("ID");
alter table "FSP_ITEM_DELIVERY_NOTE" add constraint "FK_FI_DELIVERY_NOTE__SPN__LC" foreign key ("SERVICE_PROVIDER_NAME", "LABORATORY_CODE") references "FORENSIC_FSP_LAB" ("SERVICE_PROVIDER_NAME", "LABORATORY_CODE");
alter table "FSP_ITEM_DELIVERY_NOTE" add constraint "FK_F_ITEM_DELIVERY_NOTE__POR" foreign key ("PARENT_OBJECT_REF") references "FORENSIC_JOB" ("OBJECT_REF") on delete cascade;
alter table "FSP_ITEM_INVOICE" add constraint "FK_FSP_ITEM_INVOICE__UBEII" foreign key ("UPDATE_BY_EMP_ITER_ID") references "EMPLOYEE_ITERATION" ("ID");
alter table "FSP_ITEM_INVOICE" add constraint "FK_FSP_ITEM_INVOICE__POR" foreign key ("PARENT_OBJECT_REF") references "FORENSIC_JOB" ("OBJECT_REF") on delete cascade;

-- Manually added.
CREATE OR REPLACE FUNCTION ENTITY_TYPE_TO_XML (
    n VARCHAR2
) RETURN VARCHAR2 AS
BEGIN
    RETURN
        CASE n
            WHEN 'EXTERNAL_SYSTEM_POINTER' THEN
                'ExternalSystemPointer'
            WHEN 'BRIEFING_ITEM' THEN
                'BriefingItem'
            WHEN 'CUSTODY_INCOMING_TRANSFER' THEN
                'CustodyIncomingTransfer'
            WHEN 'CUSTODY_SUBFACILITY_OCCUPANCY' THEN
                'CustodySubfacilityOccupancy'
            WHEN 'SEARCH' THEN
                'Search'
            WHEN 'COURTWARRANT' THEN
                'CourtWarrant'
            WHEN 'DOCUMENT_PRODUCTION' THEN
                'DocumentProduction'
            WHEN 'POLE_ARREST' THEN
                'Arrest'
            WHEN 'BAIL' THEN
                'Bail'
            WHEN 'BAIL_REFUSED' THEN
                'BailRefused'
            WHEN 'GEM_CASE' THEN
                'GemCase'
            WHEN 'CUSTODY_RECORD' THEN
                'CustodyRecord'
            WHEN 'CUSTODY_HANDOVER' THEN
                'CustodyHandover'
            WHEN 'OFFENCE_CHARGE_SHEET' THEN
                'OffenceChargeSheet'
            WHEN 'POLE_OFFENCE' THEN
                'Offence'
            WHEN 'PERSON_SEARCH' THEN
                'PersonSearch'
            WHEN 'PHOTOGRAPH' THEN
                'Photograph'
            WHEN 'CUSTODY_FACILITY_ROOM' THEN
                'CustodyFacilityRoom'
            WHEN 'CUSTODY_SUBFACIL_SAFETY_CHECK' THEN
                'CustodySubfacilitySafetyCheck'
            WHEN 'PROPERTY_EVENT' THEN
                'PropertyEvent'
            WHEN 'PROPERTY' THEN
                'PropertyItem'
            WHEN 'SAMPLE_TAKEN' THEN
                'SampleTaken'
            WHEN 'POLE_RISK_ASSESSMENT' THEN
                'RiskAssessment'
            WHEN 'AGENCY_REFERRAL' THEN
                'AgencyReferral'
            WHEN 'CRIME' THEN
                'Incident'
            WHEN 'PERSON' THEN
                'Person'
            WHEN 'LOCATION' THEN
                'Location'
            WHEN 'COMMS' THEN
                'Comms'
            WHEN 'VEHICLE' THEN
                'Vehicle'
            WHEN 'DOCUMENT' THEN
                'Document'
            WHEN 'CATEGORY' THEN
                'Category'
            WHEN 'OPERATION' THEN
                'Operation'
            WHEN 'ORGANISATION' THEN
                'Organisation'
            WHEN 'FORENSIC_ACTION_ITEM' THEN
                'ForensicActionItem'
            WHEN 'FORENSIC_RESULT' THEN
                'ForensicResult'
            WHEN 'REPORT' THEN
                'IntelligenceReport'
            WHEN 'TESTONLY_GRDN_STATIC1' THEN
                'GuardianStaticObject1'
            WHEN 'TESTONLY_GRDN_STATIC2' THEN
                'GuardianStaticObject2'
            WHEN 'TESTONLY_BOOK' THEN
                'Book'
            WHEN 'TESTONLY_TEST_VEHICLE' THEN
                'TestVehicle'
            WHEN 'TESTONLY_DG_STATIC_1' THEN
                'DataGroupTestStaticObject1'
            WHEN 'TESTONLY_DG_STATIC_2' THEN
                'DataGroupTestStaticObject2'
            WHEN 'TESTONLY_DG_STATIC_3' THEN
                'DataGroupTestStaticObject3'
            WHEN 'TESTONLY_DG_EVENT_1' THEN
                'DataGroupTestEvent1'
            WHEN 'TESTONLY_ORIGINATOR_STATIC_1' THEN
                'OriginatorTestStaticObject1'
            WHEN 'TESTONLY_FK_STATIC_1' THEN
                'FkTestStaticObject1'
            WHEN 'TESTONLY_FK_STATIC_2' THEN
                'FkTestStaticObject2'
            WHEN 'TESTONLY_DATE_TIME_OBJECT' THEN
                'DateTimeTestObject'
            WHEN 'TESTONLY_API_VERSION_EVENT' THEN
                'ApiVersionTestEvent'
            WHEN 'TESTONLY_FIRE' THEN
                'Fire'
            WHEN 'CUSTODY_FACILITY_OFFENDER_GRP' THEN
                'CustodyFacilityOffenderGroup'
            WHEN 'TESTONLY_STATIC_TRANS' THEN
                'StaticObjectTransientTest'
            WHEN 'WARRANT' THEN
                'Warrant'
            WHEN 'ASSET_EVENT' THEN
                'AssetEvent'
            WHEN 'ASSET' THEN
                'Asset'
            WHEN 'SOCRATES_CASE' THEN
                'SocratesCase'
            WHEN 'SOCRATES_SCENE' THEN
                'SocratesScene'
            WHEN 'SOCRATES_EXHIBIT' THEN
                'SocratesExhibit'
            WHEN 'EXTERNAL_PROXY_EVENT' THEN
                'ExternalProxyEvent'
            WHEN 'EXTERNAL_PROXY_STATIC_OBJECT' THEN
                'ExternalProxyStaticObject'
            WHEN 'CUSTODY_PROPERTY' THEN
                'CustodyProperty'
            WHEN 'CANDC_PERSON' THEN
                'CandcPerson'
            WHEN 'UNFORMATTED_LOCATION' THEN
                'UnformattedLocation'
            WHEN 'MISSING_SIGHTING_OR_CONTACT' THEN
                'MissingSightingOrContact'
            WHEN 'CANDC_INCIDENT' THEN
                'CandcIncident'
            WHEN 'HEALTHCARE_INCIDENT' THEN
                'HealthcareIncident'
            WHEN 'PSP' THEN
                'Psp'
            WHEN 'CUSTODY_PREP_HANDOVER_COMMENT' THEN
                'CustodyPreparedHandoverComment'
            WHEN 'PPE' THEN
                'Ppe'
            WHEN 'CONTACT_EVENT' THEN
                'ContactEvent'
            WHEN 'GENERIC_EVENT' THEN
                'GenericEvent'
            WHEN 'INCIDENT_NOTE' THEN
                'IncidentNote'
            WHEN 'BAIL_SUMMARY' THEN
                'BailSummary'
            WHEN 'FORENSIC_ACTIVITY' THEN
                'ForensicActivity'
            WHEN 'FORENSIC_JOB' THEN
                'ForensicJob'
            ELSE 'ErrorEntityTypeToXmlDatabaseFunctionIsOutOfDate'
        END;
END;
/
SHOW ERRORS;

-- Manually added.
CREATE OR REPLACE FUNCTION IS_EVENT (
    n VARCHAR2
) RETURN VARCHAR2 AS
BEGIN
    RETURN
        CASE UPPER(n)
            WHEN 'BRIEFING_ITEM' THEN
                'T'
            WHEN 'CUSTODY_INCOMING_TRANSFER' THEN
                'T'
            WHEN 'CUSTODY_SUBFACILITY_OCCUPANCY' THEN
                'T'
            WHEN 'SEARCH' THEN
                'T'
            WHEN 'COURTWARRANT' THEN
                'T'
            WHEN 'DOCUMENT_PRODUCTION' THEN
                'T'
            WHEN 'POLE_ARREST' THEN
                'T'
            WHEN 'BAIL' THEN
                'T'
            WHEN 'BAIL_REFUSED' THEN
                'T'
            WHEN 'GEM_CASE' THEN
                'T'
            WHEN 'CUSTODY_RECORD' THEN
                'T'
            WHEN 'CUSTODY_HANDOVER' THEN
                'T'
            WHEN 'OFFENCE_CHARGE_SHEET' THEN
                'T'
            WHEN 'POLE_OFFENCE' THEN
                'T'
            WHEN 'PERSON_SEARCH' THEN
                'T'
            WHEN 'CUSTODY_SUBFACIL_SAFETY_CHECK' THEN
                'T'
            WHEN 'PROPERTY_EVENT' THEN
                'T'
            WHEN 'SAMPLE_TAKEN' THEN
                'T'
            WHEN 'POLE_RISK_ASSESSMENT' THEN
                'T'
            WHEN 'AGENCY_REFERRAL' THEN
                'T'
            WHEN 'CRIME' THEN
                'T'
            WHEN 'REPORT' THEN
                'T'
            WHEN 'TESTONLY_DG_EVENT_1' THEN
                'T'
            WHEN 'TESTONLY_API_VERSION_EVENT' THEN
                'T'
            WHEN 'TESTONLY_FIRE' THEN
                'T'
            WHEN 'CUSTODY_FACILITY_OFFENDER_GRP' THEN
                'T'
            WHEN 'WARRANT' THEN
                'T'
            WHEN 'ASSET_EVENT' THEN
                'T'
            WHEN 'SOCRATES_CASE' THEN
                'T'
            WHEN 'SOCRATES_SCENE' THEN
                'T'
            WHEN 'EXTERNAL_PROXY_EVENT' THEN
                'T'
            WHEN 'CANDC_INCIDENT' THEN
                'T'
            WHEN 'HEALTHCARE_INCIDENT' THEN
                'T'
            WHEN 'PSP' THEN
                'T'
            WHEN 'CUSTODY_PREP_HANDOVER_COMMENT' THEN
                'T'
            WHEN 'PPE' THEN
                'T'
            WHEN 'CONTACT_EVENT' THEN
                'T'
            WHEN 'GENERIC_EVENT' THEN
                'T'
            WHEN 'INCIDENT_NOTE' THEN
                'T'
            WHEN 'BAIL_SUMMARY' THEN
                'T'
            WHEN 'FORENSIC_ACTIVITY' THEN
                'T'
            WHEN 'FORENSIC_JOB' THEN
                'T'
            ELSE 'F'
        END;
END;
/
SHOW ERRORS;

-- End