\set ON_ERROR_STOP 1
BEGIN;
set search_path=summary,public;

create table cimisM:r ( CHECK ( y = :r ) ) INHERITS (summary.cimisM);

END;