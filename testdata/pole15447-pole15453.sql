-- Description: Data model changes #533 Connect v6.11.5 Hellenistic CON-116371.

insert into POLE_UPGRADE_SCRIPT_LOG
(SCRIPT_NAME, DATA_MODEL_NAME, PROVENANCE, DATE_EXECUTED) values
('pole15447-pole15453.sql', 'Hellenistic', 'CON-116371', sysdate);
commit;

-- Column creates (excluding make not null):
alter table "SEARCH_PERSON_INFO" add "OUTCOME_REASON" varchar2(40 char) null;
alter table "SEARCH_VEHICLE_INFO" add "OUTCOME_REASON" varchar2(40 char) null;

-- End