CREATE TABLE BSSRV 
    ( 
     BID          NUMBER (4) , 
     NAME         VARCHAR2 (30) , 
     ARCHITECTURE VARCHAR2 (20) , 
     ANR          VARCHAR2 (20) , 
     HNAME        VARCHAR2 (20) , 
     CONTACT      VARCHAR2 (35) 
    ) 
    NO INMEMORY 
;

CREATE UNIQUE INDEX BSSRV_IDX1 ON BSSRV 
    ( 
     BID ASC 
    ) 
;

CREATE UNIQUE INDEX BSSRV_PK ON BSSRV 
    ( 
     BID ASC , 
     NAME ASC 
    ) 
;

ALTER TABLE BSSRV 
    ADD CONSTRAINT BSSRV_PK PRIMARY KEY ( BID, NAME ) 
    USING INDEX BSSRV_PK ;

ALTER TABLE BSSRV 
    ADD CONSTRAINT BSSRV_IDX1 UNIQUE ( BID ) 
    USING INDEX BSSRV_IDX1 ;

CREATE TABLE COMP 
    ( 
     NAME    VARCHAR2 (20) , 
     CID     NUMBER (4) , 
     PDB     VARCHAR2 (26) , 
     SERVICE VARCHAR2 (40) , 
     HNAME   VARCHAR2 (20) , 
     BID     NUMBER (4) , 
     TNS     VARCHAR2 (1200) , 
     STATUS  VARCHAR2 (10) 
    ) 
    NO INMEMORY 
;

CREATE UNIQUE INDEX COMP_IDX1 ON COMP 
    ( 
     NAME ASC 
    ) 
;

CREATE UNIQUE INDEX COMP_PK ON COMP 
    ( 
     CID ASC 
    ) 
;

ALTER TABLE COMP 
    ADD CONSTRAINT COMP_PK PRIMARY KEY ( CID ) 
    USING INDEX COMP_PK ;

CREATE TABLE EWE_DBSERVER 
    ( 
     DBNAME VARCHAR2 (4000) , 
     HOST   VARCHAR2 (4000) 
    ) 
    NO INMEMORY 
;

CREATE TABLE HOST 
    ( 
     NAME   VARCHAR2 (20) , 
     IP     VARCHAR2 (20) , 
     NATIP  VARCHAR2 (20) , 
     HID    NUMBER (4) , 
     HWTYPE VARCHAR2 (20) 
    ) 
    NO INMEMORY 
;

CREATE UNIQUE INDEX HOST_IDX1 ON HOST 
    ( 
     NAME ASC 
    ) 
;

CREATE UNIQUE INDEX HOST_PK ON HOST 
    ( 
     HID ASC 
    ) 
;

ALTER TABLE HOST 
    ADD CONSTRAINT HOST_PK PRIMARY KEY ( HID ) 
    USING INDEX HOST_PK ;

ALTER TABLE HOST 
    ADD CONSTRAINT HOST_IDX1 UNIQUE ( NAME ) 
    USING INDEX HOST_IDX1 ;

ALTER TABLE COMP 
    ADD CONSTRAINT COMP_FK FOREIGN KEY 
    ( 
     HNAME
    ) 
    REFERENCES HOST 
    ( 
         NAME
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE COMP 
    ADD CONSTRAINT COMP_FK2 FOREIGN KEY 
    ( 
     BID
    ) 
    REFERENCES BSSRV 
    ( 
         BID
    ) 
    NOT DEFERRABLE 
;



