\set ON_ERROR_STOP 1
BEGIN;
drop schema if exists simetaw4km cascade;
create schema simetaw4km;
set search_path=simetaw4km,public;

-- This is a test
create table dates (
       x integer,
       y integer,
       ymd date[],
       primary key(x,y)
);

create table daily (
 x integer,
 y integer,
 tx float[],
 tn float[],
 pcp float[],
 eto float2[],
 rf  boolean[],
 primary key (x,y)
);

END;

