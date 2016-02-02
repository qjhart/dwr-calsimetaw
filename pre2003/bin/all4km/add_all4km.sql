\set ON_ERROR_STOP 1
BEGIN;
set search_path=all4km,public;

create table daily:r ( CHECK ( y = :r ) ) INHERITS (all4km.daily);

END;
