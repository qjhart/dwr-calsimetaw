\set ON_ERROR_STOP 1
BEGIN;
set search_path=summary,public;

create table dailyM:r ( CHECK ( y = :r ) ) INHERITS (summary.dailyM);

END;