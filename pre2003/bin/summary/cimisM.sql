\set ON_ERROR_STOP 1
BEGIN;
set search_path=summary,public;

create table cimisM (
x integer,
y integer,
year integer,
month integer,
days integer,
tx1 float,
tx2 float,
tx_min float,
tx_max float,
tn1 float,
tn2 float,
tn_min float,
tn_max float,
u21 float,
u22 float,
u2_min float,
u2_max float,
tdew1 float,
tdew2 float,
tdew_min float,
tdew_max float,
rs1 float,
rs2 float,
rs_min float,
rs_max float,
k1 float,
k2 float,
k_min float,
k_max float,
et01 float,
et02 float,
et0_min float,
et0_max float,
pcp1 float,
pcp2 float,
pcp_min float,
pcp_max float,
nrf integer
);


CREATE OR REPLACE FUNCTION cimisM_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
CASE NEW.y
WHEN 000 THEN insert into summary.cimisM000 VALUES (NEW.*);
WHEN 001 THEN insert into summary.cimisM001 VALUES (NEW.*);
WHEN 002 THEN insert into summary.cimisM002 VALUES (NEW.*);
WHEN 003 THEN insert into summary.cimisM003 VALUES (NEW.*);
WHEN 004 THEN insert into summary.cimisM004 VALUES (NEW.*);
WHEN 005 THEN insert into summary.cimisM005 VALUES (NEW.*);
WHEN 006 THEN insert into summary.cimisM006 VALUES (NEW.*);
WHEN 007 THEN insert into summary.cimisM007 VALUES (NEW.*);
WHEN 008 THEN insert into summary.cimisM008 VALUES (NEW.*);
WHEN 009 THEN insert into summary.cimisM009 VALUES (NEW.*);
WHEN 010 THEN insert into summary.cimisM010 VALUES (NEW.*);
WHEN 011 THEN insert into summary.cimisM011 VALUES (NEW.*);
WHEN 012 THEN insert into summary.cimisM012 VALUES (NEW.*);
WHEN 013 THEN insert into summary.cimisM013 VALUES (NEW.*);
WHEN 014 THEN insert into summary.cimisM014 VALUES (NEW.*);
WHEN 015 THEN insert into summary.cimisM015 VALUES (NEW.*);
WHEN 016 THEN insert into summary.cimisM016 VALUES (NEW.*);
WHEN 017 THEN insert into summary.cimisM017 VALUES (NEW.*);
WHEN 018 THEN insert into summary.cimisM018 VALUES (NEW.*);
WHEN 019 THEN insert into summary.cimisM019 VALUES (NEW.*);
WHEN 020 THEN insert into summary.cimisM020 VALUES (NEW.*);
WHEN 021 THEN insert into summary.cimisM021 VALUES (NEW.*);
WHEN 022 THEN insert into summary.cimisM022 VALUES (NEW.*);
WHEN 023 THEN insert into summary.cimisM023 VALUES (NEW.*);
WHEN 024 THEN insert into summary.cimisM024 VALUES (NEW.*);
WHEN 025 THEN insert into summary.cimisM025 VALUES (NEW.*);
WHEN 026 THEN insert into summary.cimisM026 VALUES (NEW.*);
WHEN 027 THEN insert into summary.cimisM027 VALUES (NEW.*);
WHEN 028 THEN insert into summary.cimisM028 VALUES (NEW.*);
WHEN 029 THEN insert into summary.cimisM029 VALUES (NEW.*);
WHEN 030 THEN insert into summary.cimisM030 VALUES (NEW.*);
WHEN 031 THEN insert into summary.cimisM031 VALUES (NEW.*);
WHEN 032 THEN insert into summary.cimisM032 VALUES (NEW.*);
WHEN 033 THEN insert into summary.cimisM033 VALUES (NEW.*);
WHEN 034 THEN insert into summary.cimisM034 VALUES (NEW.*);
WHEN 035 THEN insert into summary.cimisM035 VALUES (NEW.*);
WHEN 036 THEN insert into summary.cimisM036 VALUES (NEW.*);
WHEN 037 THEN insert into summary.cimisM037 VALUES (NEW.*);
WHEN 038 THEN insert into summary.cimisM038 VALUES (NEW.*);
WHEN 039 THEN insert into summary.cimisM039 VALUES (NEW.*);
WHEN 040 THEN insert into summary.cimisM040 VALUES (NEW.*);
WHEN 041 THEN insert into summary.cimisM041 VALUES (NEW.*);
WHEN 042 THEN insert into summary.cimisM042 VALUES (NEW.*);
WHEN 043 THEN insert into summary.cimisM043 VALUES (NEW.*);
WHEN 044 THEN insert into summary.cimisM044 VALUES (NEW.*);
WHEN 045 THEN insert into summary.cimisM045 VALUES (NEW.*);
WHEN 046 THEN insert into summary.cimisM046 VALUES (NEW.*);
WHEN 047 THEN insert into summary.cimisM047 VALUES (NEW.*);
WHEN 048 THEN insert into summary.cimisM048 VALUES (NEW.*);
WHEN 049 THEN insert into summary.cimisM049 VALUES (NEW.*);
WHEN 050 THEN insert into summary.cimisM050 VALUES (NEW.*);
WHEN 051 THEN insert into summary.cimisM051 VALUES (NEW.*);
WHEN 052 THEN insert into summary.cimisM052 VALUES (NEW.*);
WHEN 053 THEN insert into summary.cimisM053 VALUES (NEW.*);
WHEN 054 THEN insert into summary.cimisM054 VALUES (NEW.*);
WHEN 055 THEN insert into summary.cimisM055 VALUES (NEW.*);
WHEN 056 THEN insert into summary.cimisM056 VALUES (NEW.*);
WHEN 057 THEN insert into summary.cimisM057 VALUES (NEW.*);
WHEN 058 THEN insert into summary.cimisM058 VALUES (NEW.*);
WHEN 059 THEN insert into summary.cimisM059 VALUES (NEW.*);
WHEN 060 THEN insert into summary.cimisM060 VALUES (NEW.*);
WHEN 061 THEN insert into summary.cimisM061 VALUES (NEW.*);
WHEN 062 THEN insert into summary.cimisM062 VALUES (NEW.*);
WHEN 063 THEN insert into summary.cimisM063 VALUES (NEW.*);
WHEN 064 THEN insert into summary.cimisM064 VALUES (NEW.*);
WHEN 065 THEN insert into summary.cimisM065 VALUES (NEW.*);
WHEN 066 THEN insert into summary.cimisM066 VALUES (NEW.*);
WHEN 067 THEN insert into summary.cimisM067 VALUES (NEW.*);
WHEN 068 THEN insert into summary.cimisM068 VALUES (NEW.*);
WHEN 069 THEN insert into summary.cimisM069 VALUES (NEW.*);
WHEN 070 THEN insert into summary.cimisM070 VALUES (NEW.*);
WHEN 071 THEN insert into summary.cimisM071 VALUES (NEW.*);
WHEN 072 THEN insert into summary.cimisM072 VALUES (NEW.*);
WHEN 073 THEN insert into summary.cimisM073 VALUES (NEW.*);
WHEN 074 THEN insert into summary.cimisM074 VALUES (NEW.*);
WHEN 075 THEN insert into summary.cimisM075 VALUES (NEW.*);
WHEN 076 THEN insert into summary.cimisM076 VALUES (NEW.*);
WHEN 077 THEN insert into summary.cimisM077 VALUES (NEW.*);
WHEN 078 THEN insert into summary.cimisM078 VALUES (NEW.*);
WHEN 079 THEN insert into summary.cimisM079 VALUES (NEW.*);
WHEN 080 THEN insert into summary.cimisM080 VALUES (NEW.*);
WHEN 081 THEN insert into summary.cimisM081 VALUES (NEW.*);
WHEN 082 THEN insert into summary.cimisM082 VALUES (NEW.*);
WHEN 083 THEN insert into summary.cimisM083 VALUES (NEW.*);
WHEN 084 THEN insert into summary.cimisM084 VALUES (NEW.*);
WHEN 085 THEN insert into summary.cimisM085 VALUES (NEW.*);
WHEN 086 THEN insert into summary.cimisM086 VALUES (NEW.*);
WHEN 087 THEN insert into summary.cimisM087 VALUES (NEW.*);
WHEN 088 THEN insert into summary.cimisM088 VALUES (NEW.*);
WHEN 089 THEN insert into summary.cimisM089 VALUES (NEW.*);
WHEN 090 THEN insert into summary.cimisM090 VALUES (NEW.*);
WHEN 091 THEN insert into summary.cimisM091 VALUES (NEW.*);
WHEN 092 THEN insert into summary.cimisM092 VALUES (NEW.*);
WHEN 093 THEN insert into summary.cimisM093 VALUES (NEW.*);
WHEN 094 THEN insert into summary.cimisM094 VALUES (NEW.*);
WHEN 095 THEN insert into summary.cimisM095 VALUES (NEW.*);
WHEN 096 THEN insert into summary.cimisM096 VALUES (NEW.*);
WHEN 097 THEN insert into summary.cimisM097 VALUES (NEW.*);
WHEN 098 THEN insert into summary.cimisM098 VALUES (NEW.*);
WHEN 099 THEN insert into summary.cimisM099 VALUES (NEW.*);
WHEN 100 THEN insert into summary.cimisM100 VALUES (NEW.*);
WHEN 101 THEN insert into summary.cimisM101 VALUES (NEW.*);
WHEN 102 THEN insert into summary.cimisM102 VALUES (NEW.*);
WHEN 103 THEN insert into summary.cimisM103 VALUES (NEW.*);
WHEN 104 THEN insert into summary.cimisM104 VALUES (NEW.*);
WHEN 105 THEN insert into summary.cimisM105 VALUES (NEW.*);
WHEN 106 THEN insert into summary.cimisM106 VALUES (NEW.*);
WHEN 107 THEN insert into summary.cimisM107 VALUES (NEW.*);
WHEN 108 THEN insert into summary.cimisM108 VALUES (NEW.*);
WHEN 109 THEN insert into summary.cimisM109 VALUES (NEW.*);
WHEN 110 THEN insert into summary.cimisM110 VALUES (NEW.*);
WHEN 111 THEN insert into summary.cimisM111 VALUES (NEW.*);
WHEN 112 THEN insert into summary.cimisM112 VALUES (NEW.*);
WHEN 113 THEN insert into summary.cimisM113 VALUES (NEW.*);
WHEN 114 THEN insert into summary.cimisM114 VALUES (NEW.*);
WHEN 115 THEN insert into summary.cimisM115 VALUES (NEW.*);
WHEN 116 THEN insert into summary.cimisM116 VALUES (NEW.*);
WHEN 117 THEN insert into summary.cimisM117 VALUES (NEW.*);
WHEN 118 THEN insert into summary.cimisM118 VALUES (NEW.*);
WHEN 119 THEN insert into summary.cimisM119 VALUES (NEW.*);
WHEN 120 THEN insert into summary.cimisM120 VALUES (NEW.*);
WHEN 121 THEN insert into summary.cimisM121 VALUES (NEW.*);
WHEN 122 THEN insert into summary.cimisM122 VALUES (NEW.*);
WHEN 123 THEN insert into summary.cimisM123 VALUES (NEW.*);
WHEN 124 THEN insert into summary.cimisM124 VALUES (NEW.*);
WHEN 125 THEN insert into summary.cimisM125 VALUES (NEW.*);
WHEN 126 THEN insert into summary.cimisM126 VALUES (NEW.*);
WHEN 127 THEN insert into summary.cimisM127 VALUES (NEW.*);
WHEN 128 THEN insert into summary.cimisM128 VALUES (NEW.*);
WHEN 129 THEN insert into summary.cimisM129 VALUES (NEW.*);
WHEN 130 THEN insert into summary.cimisM130 VALUES (NEW.*);
WHEN 131 THEN insert into summary.cimisM131 VALUES (NEW.*);
WHEN 132 THEN insert into summary.cimisM132 VALUES (NEW.*);
WHEN 133 THEN insert into summary.cimisM133 VALUES (NEW.*);
WHEN 134 THEN insert into summary.cimisM134 VALUES (NEW.*);
WHEN 135 THEN insert into summary.cimisM135 VALUES (NEW.*);
WHEN 136 THEN insert into summary.cimisM136 VALUES (NEW.*);
WHEN 137 THEN insert into summary.cimisM137 VALUES (NEW.*);
WHEN 138 THEN insert into summary.cimisM138 VALUES (NEW.*);
WHEN 139 THEN insert into summary.cimisM139 VALUES (NEW.*);
WHEN 140 THEN insert into summary.cimisM140 VALUES (NEW.*);
WHEN 141 THEN insert into summary.cimisM141 VALUES (NEW.*);
WHEN 142 THEN insert into summary.cimisM142 VALUES (NEW.*);
WHEN 143 THEN insert into summary.cimisM143 VALUES (NEW.*);
WHEN 144 THEN insert into summary.cimisM144 VALUES (NEW.*);
WHEN 145 THEN insert into summary.cimisM145 VALUES (NEW.*);
WHEN 146 THEN insert into summary.cimisM146 VALUES (NEW.*);
WHEN 147 THEN insert into summary.cimisM147 VALUES (NEW.*);
WHEN 148 THEN insert into summary.cimisM148 VALUES (NEW.*);
WHEN 149 THEN insert into summary.cimisM149 VALUES (NEW.*);
WHEN 150 THEN insert into summary.cimisM150 VALUES (NEW.*);
WHEN 151 THEN insert into summary.cimisM151 VALUES (NEW.*);
WHEN 152 THEN insert into summary.cimisM152 VALUES (NEW.*);
WHEN 153 THEN insert into summary.cimisM153 VALUES (NEW.*);
WHEN 154 THEN insert into summary.cimisM154 VALUES (NEW.*);
WHEN 155 THEN insert into summary.cimisM155 VALUES (NEW.*);
WHEN 156 THEN insert into summary.cimisM156 VALUES (NEW.*);
WHEN 157 THEN insert into summary.cimisM157 VALUES (NEW.*);
WHEN 158 THEN insert into summary.cimisM158 VALUES (NEW.*);
WHEN 159 THEN insert into summary.cimisM159 VALUES (NEW.*);
WHEN 160 THEN insert into summary.cimisM160 VALUES (NEW.*);
WHEN 161 THEN insert into summary.cimisM161 VALUES (NEW.*);
WHEN 162 THEN insert into summary.cimisM162 VALUES (NEW.*);
WHEN 163 THEN insert into summary.cimisM163 VALUES (NEW.*);
WHEN 164 THEN insert into summary.cimisM164 VALUES (NEW.*);
WHEN 165 THEN insert into summary.cimisM165 VALUES (NEW.*);
WHEN 166 THEN insert into summary.cimisM166 VALUES (NEW.*);
WHEN 167 THEN insert into summary.cimisM167 VALUES (NEW.*);
WHEN 168 THEN insert into summary.cimisM168 VALUES (NEW.*);
WHEN 169 THEN insert into summary.cimisM169 VALUES (NEW.*);
WHEN 170 THEN insert into summary.cimisM170 VALUES (NEW.*);
WHEN 171 THEN insert into summary.cimisM171 VALUES (NEW.*);
WHEN 172 THEN insert into summary.cimisM172 VALUES (NEW.*);
WHEN 173 THEN insert into summary.cimisM173 VALUES (NEW.*);
WHEN 174 THEN insert into summary.cimisM174 VALUES (NEW.*);
WHEN 175 THEN insert into summary.cimisM175 VALUES (NEW.*);
WHEN 176 THEN insert into summary.cimisM176 VALUES (NEW.*);
WHEN 177 THEN insert into summary.cimisM177 VALUES (NEW.*);
WHEN 178 THEN insert into summary.cimisM178 VALUES (NEW.*);
WHEN 179 THEN insert into summary.cimisM179 VALUES (NEW.*);
WHEN 180 THEN insert into summary.cimisM180 VALUES (NEW.*);
WHEN 181 THEN insert into summary.cimisM181 VALUES (NEW.*);
WHEN 182 THEN insert into summary.cimisM182 VALUES (NEW.*);
WHEN 183 THEN insert into summary.cimisM183 VALUES (NEW.*);
WHEN 184 THEN insert into summary.cimisM184 VALUES (NEW.*);
WHEN 185 THEN insert into summary.cimisM185 VALUES (NEW.*);
WHEN 186 THEN insert into summary.cimisM186 VALUES (NEW.*);
WHEN 187 THEN insert into summary.cimisM187 VALUES (NEW.*);
WHEN 188 THEN insert into summary.cimisM188 VALUES (NEW.*);
WHEN 189 THEN insert into summary.cimisM189 VALUES (NEW.*);
WHEN 190 THEN insert into summary.cimisM190 VALUES (NEW.*);
WHEN 191 THEN insert into summary.cimisM191 VALUES (NEW.*);
WHEN 192 THEN insert into summary.cimisM192 VALUES (NEW.*);
WHEN 193 THEN insert into summary.cimisM193 VALUES (NEW.*);
WHEN 194 THEN insert into summary.cimisM194 VALUES (NEW.*);
WHEN 195 THEN insert into summary.cimisM195 VALUES (NEW.*);
WHEN 196 THEN insert into summary.cimisM196 VALUES (NEW.*);
WHEN 197 THEN insert into summary.cimisM197 VALUES (NEW.*);
WHEN 198 THEN insert into summary.cimisM198 VALUES (NEW.*);
WHEN 199 THEN insert into summary.cimisM199 VALUES (NEW.*);
WHEN 200 THEN insert into summary.cimisM200 VALUES (NEW.*);
WHEN 201 THEN insert into summary.cimisM201 VALUES (NEW.*);
WHEN 202 THEN insert into summary.cimisM202 VALUES (NEW.*);
WHEN 203 THEN insert into summary.cimisM203 VALUES (NEW.*);
WHEN 204 THEN insert into summary.cimisM204 VALUES (NEW.*);
WHEN 205 THEN insert into summary.cimisM205 VALUES (NEW.*);
WHEN 206 THEN insert into summary.cimisM206 VALUES (NEW.*);
WHEN 207 THEN insert into summary.cimisM207 VALUES (NEW.*);
WHEN 208 THEN insert into summary.cimisM208 VALUES (NEW.*);
WHEN 209 THEN insert into summary.cimisM209 VALUES (NEW.*);
WHEN 210 THEN insert into summary.cimisM210 VALUES (NEW.*);
WHEN 211 THEN insert into summary.cimisM211 VALUES (NEW.*);
WHEN 212 THEN insert into summary.cimisM212 VALUES (NEW.*);
WHEN 213 THEN insert into summary.cimisM213 VALUES (NEW.*);
WHEN 214 THEN insert into summary.cimisM214 VALUES (NEW.*);
WHEN 215 THEN insert into summary.cimisM215 VALUES (NEW.*);
WHEN 216 THEN insert into summary.cimisM216 VALUES (NEW.*);
WHEN 217 THEN insert into summary.cimisM217 VALUES (NEW.*);
WHEN 218 THEN insert into summary.cimisM218 VALUES (NEW.*);
WHEN 219 THEN insert into summary.cimisM219 VALUES (NEW.*);
WHEN 220 THEN insert into summary.cimisM220 VALUES (NEW.*);
WHEN 221 THEN insert into summary.cimisM221 VALUES (NEW.*);
WHEN 222 THEN insert into summary.cimisM222 VALUES (NEW.*);
WHEN 223 THEN insert into summary.cimisM223 VALUES (NEW.*);
WHEN 224 THEN insert into summary.cimisM224 VALUES (NEW.*);
WHEN 225 THEN insert into summary.cimisM225 VALUES (NEW.*);
WHEN 226 THEN insert into summary.cimisM226 VALUES (NEW.*);
WHEN 227 THEN insert into summary.cimisM227 VALUES (NEW.*);
WHEN 228 THEN insert into summary.cimisM228 VALUES (NEW.*);
WHEN 229 THEN insert into summary.cimisM229 VALUES (NEW.*);
WHEN 230 THEN insert into summary.cimisM230 VALUES (NEW.*);
WHEN 231 THEN insert into summary.cimisM231 VALUES (NEW.*);
WHEN 232 THEN insert into summary.cimisM232 VALUES (NEW.*);
WHEN 233 THEN insert into summary.cimisM233 VALUES (NEW.*);
WHEN 234 THEN insert into summary.cimisM234 VALUES (NEW.*);
WHEN 235 THEN insert into summary.cimisM235 VALUES (NEW.*);
WHEN 236 THEN insert into summary.cimisM236 VALUES (NEW.*);
WHEN 237 THEN insert into summary.cimisM237 VALUES (NEW.*);
WHEN 238 THEN insert into summary.cimisM238 VALUES (NEW.*);
WHEN 239 THEN insert into summary.cimisM239 VALUES (NEW.*);
WHEN 240 THEN insert into summary.cimisM240 VALUES (NEW.*);
WHEN 241 THEN insert into summary.cimisM241 VALUES (NEW.*);
WHEN 242 THEN insert into summary.cimisM242 VALUES (NEW.*);
WHEN 243 THEN insert into summary.cimisM243 VALUES (NEW.*);
WHEN 244 THEN insert into summary.cimisM244 VALUES (NEW.*);
WHEN 245 THEN insert into summary.cimisM245 VALUES (NEW.*);
WHEN 246 THEN insert into summary.cimisM246 VALUES (NEW.*);
WHEN 247 THEN insert into summary.cimisM247 VALUES (NEW.*);
WHEN 248 THEN insert into summary.cimisM248 VALUES (NEW.*);
WHEN 249 THEN insert into summary.cimisM249 VALUES (NEW.*);
WHEN 250 THEN insert into summary.cimisM250 VALUES (NEW.*);
WHEN 251 THEN insert into summary.cimisM251 VALUES (NEW.*);
WHEN 252 THEN insert into summary.cimisM252 VALUES (NEW.*);
WHEN 253 THEN insert into summary.cimisM253 VALUES (NEW.*);
WHEN 254 THEN insert into summary.cimisM254 VALUES (NEW.*);
WHEN 255 THEN insert into summary.cimisM255 VALUES (NEW.*);
WHEN 256 THEN insert into summary.cimisM256 VALUES (NEW.*);
WHEN 257 THEN insert into summary.cimisM257 VALUES (NEW.*);
WHEN 258 THEN insert into summary.cimisM258 VALUES (NEW.*);
WHEN 259 THEN insert into summary.cimisM259 VALUES (NEW.*);
WHEN 260 THEN insert into summary.cimisM260 VALUES (NEW.*);
WHEN 261 THEN insert into summary.cimisM261 VALUES (NEW.*);
WHEN 262 THEN insert into summary.cimisM262 VALUES (NEW.*);
WHEN 263 THEN insert into summary.cimisM263 VALUES (NEW.*);
WHEN 264 THEN insert into summary.cimisM264 VALUES (NEW.*);
WHEN 265 THEN insert into summary.cimisM265 VALUES (NEW.*);
WHEN 266 THEN insert into summary.cimisM266 VALUES (NEW.*);
WHEN 267 THEN insert into summary.cimisM267 VALUES (NEW.*);
WHEN 268 THEN insert into summary.cimisM268 VALUES (NEW.*);
WHEN 269 THEN insert into summary.cimisM269 VALUES (NEW.*);
WHEN 270 THEN insert into summary.cimisM270 VALUES (NEW.*);
WHEN 271 THEN insert into summary.cimisM271 VALUES (NEW.*);
WHEN 272 THEN insert into summary.cimisM272 VALUES (NEW.*);
WHEN 273 THEN insert into summary.cimisM273 VALUES (NEW.*);
WHEN 274 THEN insert into summary.cimisM274 VALUES (NEW.*);
WHEN 275 THEN insert into summary.cimisM275 VALUES (NEW.*);
WHEN 276 THEN insert into summary.cimisM276 VALUES (NEW.*);
WHEN 277 THEN insert into summary.cimisM277 VALUES (NEW.*);
WHEN 278 THEN insert into summary.cimisM278 VALUES (NEW.*);
WHEN 279 THEN insert into summary.cimisM279 VALUES (NEW.*);
WHEN 280 THEN insert into summary.cimisM280 VALUES (NEW.*);
WHEN 281 THEN insert into summary.cimisM281 VALUES (NEW.*);
WHEN 282 THEN insert into summary.cimisM282 VALUES (NEW.*);
WHEN 283 THEN insert into summary.cimisM283 VALUES (NEW.*);
WHEN 284 THEN insert into summary.cimisM284 VALUES (NEW.*);
WHEN 285 THEN insert into summary.cimisM285 VALUES (NEW.*);
WHEN 286 THEN insert into summary.cimisM286 VALUES (NEW.*);
WHEN 287 THEN insert into summary.cimisM287 VALUES (NEW.*);
WHEN 288 THEN insert into summary.cimisM288 VALUES (NEW.*);
WHEN 289 THEN insert into summary.cimisM289 VALUES (NEW.*);
WHEN 290 THEN insert into summary.cimisM290 VALUES (NEW.*);
WHEN 291 THEN insert into summary.cimisM291 VALUES (NEW.*);
WHEN 292 THEN insert into summary.cimisM292 VALUES (NEW.*);
WHEN 293 THEN insert into summary.cimisM293 VALUES (NEW.*);
WHEN 294 THEN insert into summary.cimisM294 VALUES (NEW.*);
WHEN 295 THEN insert into summary.cimisM295 VALUES (NEW.*);
WHEN 296 THEN insert into summary.cimisM296 VALUES (NEW.*);
WHEN 297 THEN insert into summary.cimisM297 VALUES (NEW.*);
WHEN 298 THEN insert into summary.cimisM298 VALUES (NEW.*);
WHEN 299 THEN insert into summary.cimisM299 VALUES (NEW.*);
ELSE insert into summary.cimisM VALUES (NEW.*);
END CASE;
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER insert_cimisM_trigger
BEFORE INSERT ON summary.cimisM FOR EACH ROW 
EXECUTE PROCEDURE cimisM_insert_trigger();
END;

-- Statisical Summaries

--create view month_quad as
--select x as month, 1+ (x-1)/3 as quad 
--from generate_series(1,12) as x; 

create or replace view cimis_quad_summary as 
select 
x,y,quad,
sum(days) as days,
sum(m.tx1)/sum(m.days) as tx_avg,
min(m.tx_min) as tx_min, max(m.tx_max) as tx_max,
sqrt((sum(m.days)*sum(tx2)-sum(tx1)^2)/(sum(m.days)*(sum(m.days)-1))) as tx_stddev,
sum(m.tn1)/sum(m.days) as tn_avg,
min(m.tn_min) as tn_min, max(m.tn_max) as tn_max,
sqrt((sum(m.days)*sum(tn2)-sum(tn1)^2)/(sum(m.days)*(sum(m.days)-1))) as tn_stddev,
sum(m.u21)/sum(m.days) as u2_avg,
min(m.u2_min) as u2_min, max(m.u2_max) as u2_max,
sqrt((sum(m.days)*sum(u22)-sum(u21)^2)/(sum(m.days)*(sum(m.days)-1))) as u2_stddev,
sum(m.tdew1)/sum(m.days) as tdew_avg,
min(m.tdew_min) as tdew_min, max(m.tdew_max) as tdew_max,
sqrt((sum(m.days)*sum(tdew2)-sum(tdew1)^2)/(sum(m.days)*(sum(m.days)-1))) as tdew_stddev,
sum(m.rs1)/sum(m.days) as rs_avg,
min(m.rs_min) as rs_min, max(m.rs_max) as rs_max,
sqrt((sum(m.days)*sum(rs2)-sum(rs1)^2)/(sum(m.days)*(sum(m.days)-1))) as rs_stddev,
sum(m.k1)/sum(m.days) as k_avg,
min(m.k_min) as k_min, max(m.k_max) as k_max,
sqrt((sum(m.days)*sum(k2)-sum(k1)^2)/(sum(m.days)*(sum(m.days)-1))) as k_stddev,
sum(m.et01)/sum(m.days) as et0_avg,
min(m.et0_min) as et0_min, max(m.et0_max) as et0_max,
sqrt((sum(m.days)*sum(et02)-sum(et01)^2)/(sum(m.days)*(sum(m.days)-1))) as et0_stddev,
sum(m.pcp1)/sum(m.days) as pcp_avg,
min(m.pcp_min) as pcp_min, max(m.pcp_max) as pcp_max,
sqrt((sum(m.days)*sum(pcp2)-sum(pcp1)^2)/(sum(m.days)*(sum(m.days)-1))) as pcp_stddev,
sum(m.nrf)/sum(m.days) as nrf_per_day
from cimisM m join month_quad mq using (month) 
group by x,y,quad 
order by quad,x,y;

create or replace view cimis_yearly_quad_summary as 
select 
x,y,year,quad,
sum(days) as days,
sum(m.tx1)/sum(m.days) as tx_avg,
min(m.tx_min) as tx_min, max(m.tx_max) as tx_max,
sqrt((sum(m.days)*sum(tx2)-sum(tx1)^2)/(sum(m.days)*(sum(m.days)-1))) as tx_stddev,
sum(m.tn1)/sum(m.days) as tn_avg,
min(m.tn_min) as tn_min, max(m.tn_max) as tn_max,
sqrt((sum(m.days)*sum(tn2)-sum(tn1)^2)/(sum(m.days)*(sum(m.days)-1))) as tn_stddev,
sum(m.u21)/sum(m.days) as u2_avg,
min(m.u2_min) as u2_min, max(m.u2_max) as u2_max,
sqrt((sum(m.days)*sum(u22)-sum(u21)^2)/(sum(m.days)*(sum(m.days)-1))) as u2_stddev,
sum(m.tdew1)/sum(m.days) as tdew_avg,
min(m.tdew_min) as tdew_min, max(m.tdew_max) as tdew_max,
sqrt((sum(m.days)*sum(tdew2)-sum(tdew1)^2)/(sum(m.days)*(sum(m.days)-1))) as tdew_stddev,
sum(m.rs1)/sum(m.days) as rs_avg,
min(m.rs_min) as rs_min, max(m.rs_max) as rs_max,
sqrt((sum(m.days)*sum(rs2)-sum(rs1)^2)/(sum(m.days)*(sum(m.days)-1))) as rs_stddev,
sum(m.k1)/sum(m.days) as k_avg,
min(m.k_min) as k_min, max(m.k_max) as k_max,
sqrt((sum(m.days)*sum(k2)-sum(k1)^2)/(sum(m.days)*(sum(m.days)-1))) as k_stddev,
sum(m.et01)/sum(m.days) as et0_avg,
min(m.et0_min) as et0_min, max(m.et0_max) as et0_max,
sqrt((sum(m.days)*sum(et02)-sum(et01)^2)/(sum(m.days)*(sum(m.days)-1))) as et0_stddev,
sum(m.pcp1)/sum(m.days) as pcp_avg,
min(m.pcp_min) as pcp_min, max(m.pcp_max) as pcp_max,
sqrt((sum(m.days)*sum(pcp2)-sum(pcp1)^2)/(sum(m.days)*(sum(m.days)-1))) as pcp_stddev,
sum(m.nrf)/sum(m.days) as nrf_per_day
from cimisM m join month_quad mq using (month) 
group by x,y,year,quad 
order by x,y,year,quad;

