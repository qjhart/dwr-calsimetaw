\set ON_ERROR_STOP 1
BEGIN;
set search_path=join4km,public;

create table daily:r ( CHECK ( y = :r ) ) INHERITS (join4km.daily);

END;
