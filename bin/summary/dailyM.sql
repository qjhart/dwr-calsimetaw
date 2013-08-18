\set ON_ERROR_STOP 1
BEGIN;
set search_path=summary,public;

create table dailyM (
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
eto1 float,
eto2 float,
eto_min float,
eto_max float,
pcp1 float,
pcp2 float,
pcp_min float,
pcp_max float,
nrf integer
);

CREATE OR REPLACE FUNCTION dailyM_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
CASE NEW.y
WHEN 000 THEN insert into summary.dailyM000 VALUES (NEW.*);
WHEN 001 THEN insert into summary.dailyM001 VALUES (NEW.*);
WHEN 002 THEN insert into summary.dailyM002 VALUES (NEW.*);
WHEN 003 THEN insert into summary.dailyM003 VALUES (NEW.*);
WHEN 004 THEN insert into summary.dailyM004 VALUES (NEW.*);
WHEN 005 THEN insert into summary.dailyM005 VALUES (NEW.*);
WHEN 006 THEN insert into summary.dailyM006 VALUES (NEW.*);
WHEN 007 THEN insert into summary.dailyM007 VALUES (NEW.*);
WHEN 008 THEN insert into summary.dailyM008 VALUES (NEW.*);
WHEN 009 THEN insert into summary.dailyM009 VALUES (NEW.*);
WHEN 010 THEN insert into summary.dailyM010 VALUES (NEW.*);
WHEN 011 THEN insert into summary.dailyM011 VALUES (NEW.*);
WHEN 012 THEN insert into summary.dailyM012 VALUES (NEW.*);
WHEN 013 THEN insert into summary.dailyM013 VALUES (NEW.*);
WHEN 014 THEN insert into summary.dailyM014 VALUES (NEW.*);
WHEN 015 THEN insert into summary.dailyM015 VALUES (NEW.*);
WHEN 016 THEN insert into summary.dailyM016 VALUES (NEW.*);
WHEN 017 THEN insert into summary.dailyM017 VALUES (NEW.*);
WHEN 018 THEN insert into summary.dailyM018 VALUES (NEW.*);
WHEN 019 THEN insert into summary.dailyM019 VALUES (NEW.*);
WHEN 020 THEN insert into summary.dailyM020 VALUES (NEW.*);
WHEN 021 THEN insert into summary.dailyM021 VALUES (NEW.*);
WHEN 022 THEN insert into summary.dailyM022 VALUES (NEW.*);
WHEN 023 THEN insert into summary.dailyM023 VALUES (NEW.*);
WHEN 024 THEN insert into summary.dailyM024 VALUES (NEW.*);
WHEN 025 THEN insert into summary.dailyM025 VALUES (NEW.*);
WHEN 026 THEN insert into summary.dailyM026 VALUES (NEW.*);
WHEN 027 THEN insert into summary.dailyM027 VALUES (NEW.*);
WHEN 028 THEN insert into summary.dailyM028 VALUES (NEW.*);
WHEN 029 THEN insert into summary.dailyM029 VALUES (NEW.*);
WHEN 030 THEN insert into summary.dailyM030 VALUES (NEW.*);
WHEN 031 THEN insert into summary.dailyM031 VALUES (NEW.*);
WHEN 032 THEN insert into summary.dailyM032 VALUES (NEW.*);
WHEN 033 THEN insert into summary.dailyM033 VALUES (NEW.*);
WHEN 034 THEN insert into summary.dailyM034 VALUES (NEW.*);
WHEN 035 THEN insert into summary.dailyM035 VALUES (NEW.*);
WHEN 036 THEN insert into summary.dailyM036 VALUES (NEW.*);
WHEN 037 THEN insert into summary.dailyM037 VALUES (NEW.*);
WHEN 038 THEN insert into summary.dailyM038 VALUES (NEW.*);
WHEN 039 THEN insert into summary.dailyM039 VALUES (NEW.*);
WHEN 040 THEN insert into summary.dailyM040 VALUES (NEW.*);
WHEN 041 THEN insert into summary.dailyM041 VALUES (NEW.*);
WHEN 042 THEN insert into summary.dailyM042 VALUES (NEW.*);
WHEN 043 THEN insert into summary.dailyM043 VALUES (NEW.*);
WHEN 044 THEN insert into summary.dailyM044 VALUES (NEW.*);
WHEN 045 THEN insert into summary.dailyM045 VALUES (NEW.*);
WHEN 046 THEN insert into summary.dailyM046 VALUES (NEW.*);
WHEN 047 THEN insert into summary.dailyM047 VALUES (NEW.*);
WHEN 048 THEN insert into summary.dailyM048 VALUES (NEW.*);
WHEN 049 THEN insert into summary.dailyM049 VALUES (NEW.*);
WHEN 050 THEN insert into summary.dailyM050 VALUES (NEW.*);
WHEN 051 THEN insert into summary.dailyM051 VALUES (NEW.*);
WHEN 052 THEN insert into summary.dailyM052 VALUES (NEW.*);
WHEN 053 THEN insert into summary.dailyM053 VALUES (NEW.*);
WHEN 054 THEN insert into summary.dailyM054 VALUES (NEW.*);
WHEN 055 THEN insert into summary.dailyM055 VALUES (NEW.*);
WHEN 056 THEN insert into summary.dailyM056 VALUES (NEW.*);
WHEN 057 THEN insert into summary.dailyM057 VALUES (NEW.*);
WHEN 058 THEN insert into summary.dailyM058 VALUES (NEW.*);
WHEN 059 THEN insert into summary.dailyM059 VALUES (NEW.*);
WHEN 060 THEN insert into summary.dailyM060 VALUES (NEW.*);
WHEN 061 THEN insert into summary.dailyM061 VALUES (NEW.*);
WHEN 062 THEN insert into summary.dailyM062 VALUES (NEW.*);
WHEN 063 THEN insert into summary.dailyM063 VALUES (NEW.*);
WHEN 064 THEN insert into summary.dailyM064 VALUES (NEW.*);
WHEN 065 THEN insert into summary.dailyM065 VALUES (NEW.*);
WHEN 066 THEN insert into summary.dailyM066 VALUES (NEW.*);
WHEN 067 THEN insert into summary.dailyM067 VALUES (NEW.*);
WHEN 068 THEN insert into summary.dailyM068 VALUES (NEW.*);
WHEN 069 THEN insert into summary.dailyM069 VALUES (NEW.*);
WHEN 070 THEN insert into summary.dailyM070 VALUES (NEW.*);
WHEN 071 THEN insert into summary.dailyM071 VALUES (NEW.*);
WHEN 072 THEN insert into summary.dailyM072 VALUES (NEW.*);
WHEN 073 THEN insert into summary.dailyM073 VALUES (NEW.*);
WHEN 074 THEN insert into summary.dailyM074 VALUES (NEW.*);
WHEN 075 THEN insert into summary.dailyM075 VALUES (NEW.*);
WHEN 076 THEN insert into summary.dailyM076 VALUES (NEW.*);
WHEN 077 THEN insert into summary.dailyM077 VALUES (NEW.*);
WHEN 078 THEN insert into summary.dailyM078 VALUES (NEW.*);
WHEN 079 THEN insert into summary.dailyM079 VALUES (NEW.*);
WHEN 080 THEN insert into summary.dailyM080 VALUES (NEW.*);
WHEN 081 THEN insert into summary.dailyM081 VALUES (NEW.*);
WHEN 082 THEN insert into summary.dailyM082 VALUES (NEW.*);
WHEN 083 THEN insert into summary.dailyM083 VALUES (NEW.*);
WHEN 084 THEN insert into summary.dailyM084 VALUES (NEW.*);
WHEN 085 THEN insert into summary.dailyM085 VALUES (NEW.*);
WHEN 086 THEN insert into summary.dailyM086 VALUES (NEW.*);
WHEN 087 THEN insert into summary.dailyM087 VALUES (NEW.*);
WHEN 088 THEN insert into summary.dailyM088 VALUES (NEW.*);
WHEN 089 THEN insert into summary.dailyM089 VALUES (NEW.*);
WHEN 090 THEN insert into summary.dailyM090 VALUES (NEW.*);
WHEN 091 THEN insert into summary.dailyM091 VALUES (NEW.*);
WHEN 092 THEN insert into summary.dailyM092 VALUES (NEW.*);
WHEN 093 THEN insert into summary.dailyM093 VALUES (NEW.*);
WHEN 094 THEN insert into summary.dailyM094 VALUES (NEW.*);
WHEN 095 THEN insert into summary.dailyM095 VALUES (NEW.*);
WHEN 096 THEN insert into summary.dailyM096 VALUES (NEW.*);
WHEN 097 THEN insert into summary.dailyM097 VALUES (NEW.*);
WHEN 098 THEN insert into summary.dailyM098 VALUES (NEW.*);
WHEN 099 THEN insert into summary.dailyM099 VALUES (NEW.*);
WHEN 100 THEN insert into summary.dailyM100 VALUES (NEW.*);
WHEN 101 THEN insert into summary.dailyM101 VALUES (NEW.*);
WHEN 102 THEN insert into summary.dailyM102 VALUES (NEW.*);
WHEN 103 THEN insert into summary.dailyM103 VALUES (NEW.*);
WHEN 104 THEN insert into summary.dailyM104 VALUES (NEW.*);
WHEN 105 THEN insert into summary.dailyM105 VALUES (NEW.*);
WHEN 106 THEN insert into summary.dailyM106 VALUES (NEW.*);
WHEN 107 THEN insert into summary.dailyM107 VALUES (NEW.*);
WHEN 108 THEN insert into summary.dailyM108 VALUES (NEW.*);
WHEN 109 THEN insert into summary.dailyM109 VALUES (NEW.*);
WHEN 110 THEN insert into summary.dailyM110 VALUES (NEW.*);
WHEN 111 THEN insert into summary.dailyM111 VALUES (NEW.*);
WHEN 112 THEN insert into summary.dailyM112 VALUES (NEW.*);
WHEN 113 THEN insert into summary.dailyM113 VALUES (NEW.*);
WHEN 114 THEN insert into summary.dailyM114 VALUES (NEW.*);
WHEN 115 THEN insert into summary.dailyM115 VALUES (NEW.*);
WHEN 116 THEN insert into summary.dailyM116 VALUES (NEW.*);
WHEN 117 THEN insert into summary.dailyM117 VALUES (NEW.*);
WHEN 118 THEN insert into summary.dailyM118 VALUES (NEW.*);
WHEN 119 THEN insert into summary.dailyM119 VALUES (NEW.*);
WHEN 120 THEN insert into summary.dailyM120 VALUES (NEW.*);
WHEN 121 THEN insert into summary.dailyM121 VALUES (NEW.*);
WHEN 122 THEN insert into summary.dailyM122 VALUES (NEW.*);
WHEN 123 THEN insert into summary.dailyM123 VALUES (NEW.*);
WHEN 124 THEN insert into summary.dailyM124 VALUES (NEW.*);
WHEN 125 THEN insert into summary.dailyM125 VALUES (NEW.*);
WHEN 126 THEN insert into summary.dailyM126 VALUES (NEW.*);
WHEN 127 THEN insert into summary.dailyM127 VALUES (NEW.*);
WHEN 128 THEN insert into summary.dailyM128 VALUES (NEW.*);
WHEN 129 THEN insert into summary.dailyM129 VALUES (NEW.*);
WHEN 130 THEN insert into summary.dailyM130 VALUES (NEW.*);
WHEN 131 THEN insert into summary.dailyM131 VALUES (NEW.*);
WHEN 132 THEN insert into summary.dailyM132 VALUES (NEW.*);
WHEN 133 THEN insert into summary.dailyM133 VALUES (NEW.*);
WHEN 134 THEN insert into summary.dailyM134 VALUES (NEW.*);
WHEN 135 THEN insert into summary.dailyM135 VALUES (NEW.*);
WHEN 136 THEN insert into summary.dailyM136 VALUES (NEW.*);
WHEN 137 THEN insert into summary.dailyM137 VALUES (NEW.*);
WHEN 138 THEN insert into summary.dailyM138 VALUES (NEW.*);
WHEN 139 THEN insert into summary.dailyM139 VALUES (NEW.*);
WHEN 140 THEN insert into summary.dailyM140 VALUES (NEW.*);
WHEN 141 THEN insert into summary.dailyM141 VALUES (NEW.*);
WHEN 142 THEN insert into summary.dailyM142 VALUES (NEW.*);
WHEN 143 THEN insert into summary.dailyM143 VALUES (NEW.*);
WHEN 144 THEN insert into summary.dailyM144 VALUES (NEW.*);
WHEN 145 THEN insert into summary.dailyM145 VALUES (NEW.*);
WHEN 146 THEN insert into summary.dailyM146 VALUES (NEW.*);
WHEN 147 THEN insert into summary.dailyM147 VALUES (NEW.*);
WHEN 148 THEN insert into summary.dailyM148 VALUES (NEW.*);
WHEN 149 THEN insert into summary.dailyM149 VALUES (NEW.*);
WHEN 150 THEN insert into summary.dailyM150 VALUES (NEW.*);
WHEN 151 THEN insert into summary.dailyM151 VALUES (NEW.*);
WHEN 152 THEN insert into summary.dailyM152 VALUES (NEW.*);
WHEN 153 THEN insert into summary.dailyM153 VALUES (NEW.*);
WHEN 154 THEN insert into summary.dailyM154 VALUES (NEW.*);
WHEN 155 THEN insert into summary.dailyM155 VALUES (NEW.*);
WHEN 156 THEN insert into summary.dailyM156 VALUES (NEW.*);
WHEN 157 THEN insert into summary.dailyM157 VALUES (NEW.*);
WHEN 158 THEN insert into summary.dailyM158 VALUES (NEW.*);
WHEN 159 THEN insert into summary.dailyM159 VALUES (NEW.*);
WHEN 160 THEN insert into summary.dailyM160 VALUES (NEW.*);
WHEN 161 THEN insert into summary.dailyM161 VALUES (NEW.*);
WHEN 162 THEN insert into summary.dailyM162 VALUES (NEW.*);
WHEN 163 THEN insert into summary.dailyM163 VALUES (NEW.*);
WHEN 164 THEN insert into summary.dailyM164 VALUES (NEW.*);
WHEN 165 THEN insert into summary.dailyM165 VALUES (NEW.*);
WHEN 166 THEN insert into summary.dailyM166 VALUES (NEW.*);
WHEN 167 THEN insert into summary.dailyM167 VALUES (NEW.*);
WHEN 168 THEN insert into summary.dailyM168 VALUES (NEW.*);
WHEN 169 THEN insert into summary.dailyM169 VALUES (NEW.*);
WHEN 170 THEN insert into summary.dailyM170 VALUES (NEW.*);
WHEN 171 THEN insert into summary.dailyM171 VALUES (NEW.*);
WHEN 172 THEN insert into summary.dailyM172 VALUES (NEW.*);
WHEN 173 THEN insert into summary.dailyM173 VALUES (NEW.*);
WHEN 174 THEN insert into summary.dailyM174 VALUES (NEW.*);
WHEN 175 THEN insert into summary.dailyM175 VALUES (NEW.*);
WHEN 176 THEN insert into summary.dailyM176 VALUES (NEW.*);
WHEN 177 THEN insert into summary.dailyM177 VALUES (NEW.*);
WHEN 178 THEN insert into summary.dailyM178 VALUES (NEW.*);
WHEN 179 THEN insert into summary.dailyM179 VALUES (NEW.*);
WHEN 180 THEN insert into summary.dailyM180 VALUES (NEW.*);
WHEN 181 THEN insert into summary.dailyM181 VALUES (NEW.*);
WHEN 182 THEN insert into summary.dailyM182 VALUES (NEW.*);
WHEN 183 THEN insert into summary.dailyM183 VALUES (NEW.*);
WHEN 184 THEN insert into summary.dailyM184 VALUES (NEW.*);
WHEN 185 THEN insert into summary.dailyM185 VALUES (NEW.*);
WHEN 186 THEN insert into summary.dailyM186 VALUES (NEW.*);
WHEN 187 THEN insert into summary.dailyM187 VALUES (NEW.*);
WHEN 188 THEN insert into summary.dailyM188 VALUES (NEW.*);
WHEN 189 THEN insert into summary.dailyM189 VALUES (NEW.*);
WHEN 190 THEN insert into summary.dailyM190 VALUES (NEW.*);
WHEN 191 THEN insert into summary.dailyM191 VALUES (NEW.*);
WHEN 192 THEN insert into summary.dailyM192 VALUES (NEW.*);
WHEN 193 THEN insert into summary.dailyM193 VALUES (NEW.*);
WHEN 194 THEN insert into summary.dailyM194 VALUES (NEW.*);
WHEN 195 THEN insert into summary.dailyM195 VALUES (NEW.*);
WHEN 196 THEN insert into summary.dailyM196 VALUES (NEW.*);
WHEN 197 THEN insert into summary.dailyM197 VALUES (NEW.*);
WHEN 198 THEN insert into summary.dailyM198 VALUES (NEW.*);
WHEN 199 THEN insert into summary.dailyM199 VALUES (NEW.*);
WHEN 200 THEN insert into summary.dailyM200 VALUES (NEW.*);
WHEN 201 THEN insert into summary.dailyM201 VALUES (NEW.*);
WHEN 202 THEN insert into summary.dailyM202 VALUES (NEW.*);
WHEN 203 THEN insert into summary.dailyM203 VALUES (NEW.*);
WHEN 204 THEN insert into summary.dailyM204 VALUES (NEW.*);
WHEN 205 THEN insert into summary.dailyM205 VALUES (NEW.*);
WHEN 206 THEN insert into summary.dailyM206 VALUES (NEW.*);
WHEN 207 THEN insert into summary.dailyM207 VALUES (NEW.*);
WHEN 208 THEN insert into summary.dailyM208 VALUES (NEW.*);
WHEN 209 THEN insert into summary.dailyM209 VALUES (NEW.*);
WHEN 210 THEN insert into summary.dailyM210 VALUES (NEW.*);
WHEN 211 THEN insert into summary.dailyM211 VALUES (NEW.*);
WHEN 212 THEN insert into summary.dailyM212 VALUES (NEW.*);
WHEN 213 THEN insert into summary.dailyM213 VALUES (NEW.*);
WHEN 214 THEN insert into summary.dailyM214 VALUES (NEW.*);
WHEN 215 THEN insert into summary.dailyM215 VALUES (NEW.*);
WHEN 216 THEN insert into summary.dailyM216 VALUES (NEW.*);
WHEN 217 THEN insert into summary.dailyM217 VALUES (NEW.*);
WHEN 218 THEN insert into summary.dailyM218 VALUES (NEW.*);
WHEN 219 THEN insert into summary.dailyM219 VALUES (NEW.*);
WHEN 220 THEN insert into summary.dailyM220 VALUES (NEW.*);
WHEN 221 THEN insert into summary.dailyM221 VALUES (NEW.*);
WHEN 222 THEN insert into summary.dailyM222 VALUES (NEW.*);
WHEN 223 THEN insert into summary.dailyM223 VALUES (NEW.*);
WHEN 224 THEN insert into summary.dailyM224 VALUES (NEW.*);
WHEN 225 THEN insert into summary.dailyM225 VALUES (NEW.*);
WHEN 226 THEN insert into summary.dailyM226 VALUES (NEW.*);
WHEN 227 THEN insert into summary.dailyM227 VALUES (NEW.*);
WHEN 228 THEN insert into summary.dailyM228 VALUES (NEW.*);
WHEN 229 THEN insert into summary.dailyM229 VALUES (NEW.*);
WHEN 230 THEN insert into summary.dailyM230 VALUES (NEW.*);
WHEN 231 THEN insert into summary.dailyM231 VALUES (NEW.*);
WHEN 232 THEN insert into summary.dailyM232 VALUES (NEW.*);
WHEN 233 THEN insert into summary.dailyM233 VALUES (NEW.*);
WHEN 234 THEN insert into summary.dailyM234 VALUES (NEW.*);
WHEN 235 THEN insert into summary.dailyM235 VALUES (NEW.*);
WHEN 236 THEN insert into summary.dailyM236 VALUES (NEW.*);
WHEN 237 THEN insert into summary.dailyM237 VALUES (NEW.*);
WHEN 238 THEN insert into summary.dailyM238 VALUES (NEW.*);
WHEN 239 THEN insert into summary.dailyM239 VALUES (NEW.*);
WHEN 240 THEN insert into summary.dailyM240 VALUES (NEW.*);
WHEN 241 THEN insert into summary.dailyM241 VALUES (NEW.*);
WHEN 242 THEN insert into summary.dailyM242 VALUES (NEW.*);
WHEN 243 THEN insert into summary.dailyM243 VALUES (NEW.*);
WHEN 244 THEN insert into summary.dailyM244 VALUES (NEW.*);
WHEN 245 THEN insert into summary.dailyM245 VALUES (NEW.*);
WHEN 246 THEN insert into summary.dailyM246 VALUES (NEW.*);
WHEN 247 THEN insert into summary.dailyM247 VALUES (NEW.*);
WHEN 248 THEN insert into summary.dailyM248 VALUES (NEW.*);
WHEN 249 THEN insert into summary.dailyM249 VALUES (NEW.*);
WHEN 250 THEN insert into summary.dailyM250 VALUES (NEW.*);
WHEN 251 THEN insert into summary.dailyM251 VALUES (NEW.*);
WHEN 252 THEN insert into summary.dailyM252 VALUES (NEW.*);
WHEN 253 THEN insert into summary.dailyM253 VALUES (NEW.*);
WHEN 254 THEN insert into summary.dailyM254 VALUES (NEW.*);
WHEN 255 THEN insert into summary.dailyM255 VALUES (NEW.*);
WHEN 256 THEN insert into summary.dailyM256 VALUES (NEW.*);
WHEN 257 THEN insert into summary.dailyM257 VALUES (NEW.*);
WHEN 258 THEN insert into summary.dailyM258 VALUES (NEW.*);
WHEN 259 THEN insert into summary.dailyM259 VALUES (NEW.*);
WHEN 260 THEN insert into summary.dailyM260 VALUES (NEW.*);
WHEN 261 THEN insert into summary.dailyM261 VALUES (NEW.*);
WHEN 262 THEN insert into summary.dailyM262 VALUES (NEW.*);
WHEN 263 THEN insert into summary.dailyM263 VALUES (NEW.*);
WHEN 264 THEN insert into summary.dailyM264 VALUES (NEW.*);
WHEN 265 THEN insert into summary.dailyM265 VALUES (NEW.*);
WHEN 266 THEN insert into summary.dailyM266 VALUES (NEW.*);
WHEN 267 THEN insert into summary.dailyM267 VALUES (NEW.*);
WHEN 268 THEN insert into summary.dailyM268 VALUES (NEW.*);
WHEN 269 THEN insert into summary.dailyM269 VALUES (NEW.*);
WHEN 270 THEN insert into summary.dailyM270 VALUES (NEW.*);
WHEN 271 THEN insert into summary.dailyM271 VALUES (NEW.*);
WHEN 272 THEN insert into summary.dailyM272 VALUES (NEW.*);
WHEN 273 THEN insert into summary.dailyM273 VALUES (NEW.*);
WHEN 274 THEN insert into summary.dailyM274 VALUES (NEW.*);
WHEN 275 THEN insert into summary.dailyM275 VALUES (NEW.*);
WHEN 276 THEN insert into summary.dailyM276 VALUES (NEW.*);
WHEN 277 THEN insert into summary.dailyM277 VALUES (NEW.*);
WHEN 278 THEN insert into summary.dailyM278 VALUES (NEW.*);
WHEN 279 THEN insert into summary.dailyM279 VALUES (NEW.*);
WHEN 280 THEN insert into summary.dailyM280 VALUES (NEW.*);
WHEN 281 THEN insert into summary.dailyM281 VALUES (NEW.*);
WHEN 282 THEN insert into summary.dailyM282 VALUES (NEW.*);
WHEN 283 THEN insert into summary.dailyM283 VALUES (NEW.*);
WHEN 284 THEN insert into summary.dailyM284 VALUES (NEW.*);
WHEN 285 THEN insert into summary.dailyM285 VALUES (NEW.*);
WHEN 286 THEN insert into summary.dailyM286 VALUES (NEW.*);
WHEN 287 THEN insert into summary.dailyM287 VALUES (NEW.*);
WHEN 288 THEN insert into summary.dailyM288 VALUES (NEW.*);
WHEN 289 THEN insert into summary.dailyM289 VALUES (NEW.*);
WHEN 290 THEN insert into summary.dailyM290 VALUES (NEW.*);
WHEN 291 THEN insert into summary.dailyM291 VALUES (NEW.*);
WHEN 292 THEN insert into summary.dailyM292 VALUES (NEW.*);
WHEN 293 THEN insert into summary.dailyM293 VALUES (NEW.*);
WHEN 294 THEN insert into summary.dailyM294 VALUES (NEW.*);
WHEN 295 THEN insert into summary.dailyM295 VALUES (NEW.*);
WHEN 296 THEN insert into summary.dailyM296 VALUES (NEW.*);
WHEN 297 THEN insert into summary.dailyM297 VALUES (NEW.*);
WHEN 298 THEN insert into summary.dailyM298 VALUES (NEW.*);
WHEN 299 THEN insert into summary.dailyM299 VALUES (NEW.*);
ELSE insert into summary.dailyM VALUES (NEW.*);
END CASE;
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER insert_dailyM_trigger
BEFORE INSERT ON summary.dailyM FOR EACH ROW 
EXECUTE PROCEDURE dailyM_insert_trigger();
END;

-- Statisical Summaries

create or replace view quad_summary as 
select 
x,y,quad,
sum(days) as days,
sum(m.tx1)/sum(m.days) as tx_avg,
min(m.tx_min) as tx_min, max(m.tx_max) as tx_max,
sqrt((sum(m.days)*sum(tx2)-sum(tx1)^2)/(sum(m.days)*(sum(m.days)-1))) as tx_stddev,
sum(m.tn1)/sum(m.days) as tn_avg,
min(m.tn_min) as tn_min, max(m.tn_max) as tn_max,
sqrt((sum(m.days)*sum(tn2)-sum(tn1)^2)/(sum(m.days)*(sum(m.days)-1))) as tn_stddev,
sum(m.eto1)/sum(m.days) as eto_avg,
min(m.eto_min) as eto_min, max(m.eto_max) as eto_max,
sqrt((sum(m.days)*sum(eto2)-sum(eto1)^2)/(sum(m.days)*(sum(m.days)-1))) as eto_stddev,
sum(m.pcp1)/sum(m.days) as pcp_avg,
min(m.pcp_min) as pcp_min, max(m.pcp_max) as pcp_max,
sqrt((sum(m.days)*sum(pcp2)-sum(pcp1)^2)/(sum(m.days)*(sum(m.days)-1))) as pcp_stddev,
sum(m.nrf)/sum(m.days) as nrf_per_day
from dailyM m join month_quad mq using (month) 
group by x,y,quad 
order by quad,x,y;

create or replace view yearly_quad_summary as 
select 
x,y,year,quad,
sum(days) as days,
sum(m.tx1)/sum(m.days) as tx_avg,
min(m.tx_min) as tx_min, max(m.tx_max) as tx_max,
sqrt((sum(m.days)*sum(tx2)-sum(tx1)^2)/(sum(m.days)*(sum(m.days)-1))) as tx_stddev,
sum(m.tn1)/sum(m.days) as tn_avg,
min(m.tn_min) as tn_min, max(m.tn_max) as tn_max,
sqrt((sum(m.days)*sum(tn2)-sum(tn1)^2)/(sum(m.days)*(sum(m.days)-1))) as tn_stddev,
sum(m.eto1)/sum(m.days) as eto_avg,
min(m.eto_min) as eto_min, max(m.eto_max) as eto_max,
sqrt((sum(m.days)*sum(eto2)-sum(eto1)^2)/(sum(m.days)*(sum(m.days)-1))) as eto_stddev,
sum(m.pcp1)/sum(m.days) as pcp_avg,
min(m.pcp_min) as pcp_min, max(m.pcp_max) as pcp_max,
sqrt((sum(m.days)*sum(pcp2)-sum(pcp1)^2)/(sum(m.days)*(sum(m.days)-1))) as pcp_stddev,
sum(m.nrf)/sum(m.days) as nrf_per_day
from dailyM m join month_quad mq using (month) 
group by x,y,year,quad 
order by x,y,year,quad;

