select SCRIPT_NAME from ( select * from POLE_UPGRADE_SCRIPT_LOG order by SCRIPT_NAME DESC) where rownum=1;
