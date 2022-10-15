-- Description: Data model changes #532 Connect v6.11.5 Cambyses CON-108710.

insert into POLE_UPGRADE_SCRIPT_LOG
(SCRIPT_NAME, DATA_MODEL_NAME, PROVENANCE, DATE_EXECUTED) values
('pole15432-pole15435.sql', 'Cambyses', 'CON-108710.', sysdate);
commit;

alter table "WORKLOAD_GRID_CONFIGURATION" add "LAST_MODIFIED_DATE_TIME" timestamp(6) null;

-- End